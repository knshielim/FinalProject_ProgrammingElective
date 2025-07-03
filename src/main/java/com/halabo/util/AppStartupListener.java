package com.halabo.util;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;

@WebListener
public class AppStartupListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Halabo Tour Application Starting Up...");
        System.out.println("Attempting to run database.sql and seeder...");

        ServletContext servletContext = sce.getServletContext();
        String webAppPath = servletContext.getRealPath("/");
        System.out.println("DEBUG: ServletContext.getRealPath(\"/\") returned: " + webAppPath);

        try {
            // Step 1: Run database.sql
            String sqlFilePath = webAppPath + "WEB-INF/sql/database.sql";
            runSqlScript(sqlFilePath);

            // Step 2: Run data seeder
            DatabaseSeeder.runSeeder(webAppPath);
            System.out.println("✅ DatabaseSeeder executed successfully on startup.");
        } catch (Exception e) {
            System.err.println("❌ ERROR: Failed to initialize database!");
            e.printStackTrace();
        }

        System.out.println("✅ Halabo Tour Application Startup Complete.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Halabo Tour Application Shutting Down...");
    }

    private void runSqlScript(String filePath) throws Exception {
        System.out.println("Running SQL script from: " + filePath);

        StringBuilder fullSql = new StringBuilder();

        // 1. Read entire file
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                line = line.trim();
                if (line.isEmpty() || line.startsWith("--") || line.startsWith("//")) continue;
                fullSql.append(line).append("\n");
            }
        }

        // 2. Split by semicolon, but skip empty statements
        String[] statements = fullSql.toString().split("(?<=[;])\\s*(?=\\n)");

        // 3. Execute: use base connection for CREATE DATABASE/USE, then switch
        try (Connection baseConn = DatabaseConnection.getBaseConnection();
             Statement baseStmt = baseConn.createStatement()) {

            for (String statement : statements) {
                String sql = statement.trim();
                if (sql.isEmpty()) continue;
                if (sql.toLowerCase().startsWith("create database") || sql.toLowerCase().startsWith("use")) {
                    baseStmt.execute(sql);
                }
            }
            System.out.println("✅ Initial DB setup done (CREATE DATABASE and USE)");
        }

        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement()) {

            for (String statement : statements) {
                String sql = statement.trim();
                if (sql.isEmpty()) continue;
                if (!(sql.toLowerCase().startsWith("create database") || sql.toLowerCase().startsWith("use"))) {
                    stmt.execute(sql);
                }
            }
            System.out.println("✅ Main script executed successfully.");
        }
    }
}