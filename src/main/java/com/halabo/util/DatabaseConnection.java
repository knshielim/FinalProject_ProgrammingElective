package com.halabo.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String BASE_URL = "jdbc:mysql://localhost:3306/?allowMultiQueries=true&serverTimezone=UTC";
    private static final String DB_URL   = "jdbc:mysql://localhost:3306/halabo_tour?allowMultiQueries=true&serverTimezone=UTC";

    private static final String USERNAME = "root";
    private static final String PASSWORD = "root"; // add your actual password

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getBaseConnection() throws SQLException {
        return DriverManager.getConnection(BASE_URL, USERNAME, PASSWORD);
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
    }
}