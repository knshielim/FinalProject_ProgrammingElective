package com.halabo.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class InsertUserTest {
    public static void main(String[] args) {
        try {
            Connection conn = com.halabo.util.DatabaseConnection.getConnection();

            String sql = "INSERT INTO users (first_name, last_name, username, email, password, phone) " +
                         "VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "Testy");
            stmt.setString(2, "McTestface");
            stmt.setString(3, "testuser");
            stmt.setString(4, "test@example.com");
            stmt.setString(5, "testpass123");
            stmt.setString(6, "0123456789");

            int rows = stmt.executeUpdate();

            if (rows > 0) {
                System.out.println("✅ User inserted!");
            } else {
                System.out.println("❌ Insert failed.");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}