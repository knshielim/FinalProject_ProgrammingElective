package com.halabo.util;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppStartupListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Halabo Tour Application Starting Up...");
        System.out.println("Attempting to run DatabaseSeeder...");

        ServletContext servletContext = sce.getServletContext();
        String webAppPath = servletContext.getRealPath("/");
        // --- ADD THIS LINE FOR DEBUGGING ---
        System.out.println("DEBUG: ServletContext.getRealPath(\"/\") returned: " + webAppPath);
        // -----------------------------------

        try {
            DatabaseSeeder.runSeeder(webAppPath);
            System.out.println("DatabaseSeeder executed successfully on startup.");
        } catch (Exception e) {
            System.err.println("ERROR: DatabaseSeeder failed to run on startup!");
            e.printStackTrace();
            // Optional: throw new RuntimeException("Database initialization failed!", e);
        }
        System.out.println("Halabo Tour Application Startup Complete.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Halabo Tour Application Shutting Down...");
    }
}