package com.halabo.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DatabaseSeeder {

    public static void runSeeder(String webAppRootPath) {
        List<DestinationData> destinationsToSeedImages = new ArrayList<>();
        destinationsToSeedImages.add(new DestinationData("Borobudur Temple", "images/borobudur1.jpg"));
        destinationsToSeedImages.add(new DestinationData("Bali Island", "images/bali2.jpg"));
        destinationsToSeedImages.add(new DestinationData("Raja Ampat", "images/rajaampat3.jpg"));
        destinationsToSeedImages.add(new DestinationData("Mount Bromo", "images/bromo4.jpg"));
        destinationsToSeedImages.add(new DestinationData("Lake Toba", "images/toba5.jpg"));
        destinationsToSeedImages.add(new DestinationData("Pulau Seribu", "images/pulauseribu6.jpg"));
        destinationsToSeedImages.add(new DestinationData("Monas National Monument", "images/monas7.jpg"));
        destinationsToSeedImages.add(new DestinationData("Komodo Island", "images/komodo8.jpg"));
        destinationsToSeedImages.add(new DestinationData("Labuan Bajo", "images/labuanbajo9.jpg"));
        destinationsToSeedImages.add(new DestinationData("Prambanan Temple", "images/prambanan10.jpg"));

        List<PackageData> packagesToSeedImages = new ArrayList<>();
        packagesToSeedImages.add(new PackageData("3D2N Borobudur (Family Journey) – Java Family Stay", "images/borobudur_p1.jpg"));
        packagesToSeedImages.add(new PackageData("3D2N Borobudur (Adventure Trail) – Sunrise & Trek", "images/borobudur_p2.jpg"));
        packagesToSeedImages.add(new PackageData("4D3N Borobudur (Cultural Luxury) – Borobudur Heritage Resort", "images/borobudur_p3.jpg"));
        packagesToSeedImages.add(new PackageData("3D2N Bali (Beach Getaway) – Ocean Breeze Hotel", "images/bali_p1.jpg"));
        packagesToSeedImages.add(new PackageData("5D4N Bali (Adventure Retreat) – Ubud Jungle Lodge", "images/bali_p2.jpg"));
        packagesToSeedImages.add(new PackageData("3D2N Bali (Beachside Romance) – Seminyak Bliss Resort", "images/bali_p3.jpg"));
        packagesToSeedImages.add(new PackageData("4D3N Raja Ampat (Marine Discovery) – Coral Reef Lodge", "images/rajaampat_p1.jpg"));
        packagesToSeedImages.add(new PackageData("6D5N Raja Ampat (Eco Explorer) – Coral Reef Resort", "images/rajaampat_p2.jpg"));
        packagesToSeedImages.add(new PackageData("6D5N Raja Ampat (Luxury Dive Cruise) – Ocean Pearl Explorer", "images/rajaampat_p3.jpg"));
        packagesToSeedImages.add(new PackageData("2D1N Mount Bromo (Sunrise Experience) – Bromo Hillside Lodge", "images/mountbromo_p1.jpg"));
        packagesToSeedImages.add(new PackageData("3D2N Mount Bromo (Scenic Discovery) – Lava View Resort", "images/mountbromo_p2.jpg"));
        packagesToSeedImages.add(new PackageData("4D3N Mount Bromo & Ijen (Crater Adventure) – Volcanic Trekker's Delight", "images/mountbromo_p3.jpg"));
        packagesToSeedImages.add(new PackageData("3D2N Lake Toba (Cultural Retreat) – Toba Serenity Resort", "images/laketoba_p1.jpg"));
        packagesToSeedImages.add(new PackageData("4D3N Lake Toba (Adventure Discovery) – Summit Eco Lodge", "images/laketoba_p2.jpg"));
        packagesToSeedImages.add(new PackageData("5D4N Lake Toba (Honeymoon Escape) – Samosir Romantic Villas", "images/laketoba_p3.jpg"));
        packagesToSeedImages.add(new PackageData("2D1N Pulau Seribu (Island Escape) – Tidung Serenity Resort", "images/pulauseribu_p1.jpg"));
        packagesToSeedImages.add(new PackageData("3D2N Pulau Seribu (Couple's Getaway) – Coral Bliss Resort", "images/pulauseribu_p2.jpg"));
        packagesToSeedImages.add(new PackageData("3D2N Pulau Seribu (Water Adventure) – Marina Dive Lodge", "images/pulauseribu_p3.jpg"));
        packagesToSeedImages.add(new PackageData("2D1N Monas (Historical Exploration) – Jakarta Heritage Hotel", "images/monas_p1.jpg"));
        packagesToSeedImages.add(new PackageData("2D1N Monas (Heritage Tour) – Jakarta City Stay", "images/monas_p2.jpg"));
        packagesToSeedImages.add(new PackageData("3D2N Monas (Night City Escape) – Urban Glow Hotel", "images/monas_p3.jpg"));
        packagesToSeedImages.add(new PackageData("3D2N Komodo Encounter (Explorer Package) – Labuan Bajo Stay", "images/komodoisland_p1.jpg"));
        packagesToSeedImages.add(new PackageData("3D2N Komodo (Wildlife Trek) – Komodo Hillside Inn", "images/komodoisland_p2.jpg"));
        packagesToSeedImages.add(new PackageData("4D3N Komodo (Explorer's Escape) – Ocean Breeze Resort", "images/komodoisland_p3.jpg"));
        packagesToSeedImages.add(new PackageData("2D1N Labuan Bajo (Quick Adventure) – Bajo Harbor Lodge", "images/labuanbajo_p1.jpg"));
        packagesToSeedImages.add(new PackageData("4D3N Labuan Bajo (Island Discovery) – Bajo Bay Villas", "images/labuanbajo_p2.jpg"));
        packagesToSeedImages.add(new PackageData("3D2N Labuan Bajo (Romantic Escape) – Sunset View Villas", "images/labuanbajo_p3.jpg"));
        packagesToSeedImages.add(new PackageData("3D2N Prambanan (Cultural Discovery) – Candi Garden Hotel", "images/prambanan_p1.jpg"));
        packagesToSeedImages.add(new PackageData("3D2N Prambanan (Romantic Heritage Escape) – Svarna Heritage Lodge", "images/prambanan_p2.jpg"));
        packagesToSeedImages.add(new PackageData("2D1N Prambanan (Budget Explorer) – Taman Yogyakarta Guesthouse", "images/prambanan_p3.jpg"));

        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            conn.setAutoCommit(false);

            System.out.println("Updating destination image paths...");
            String updateDestinationSql = "UPDATE destinations SET image_path = ? WHERE destination_name = ?";
            try (PreparedStatement ps = conn.prepareStatement(updateDestinationSql)) {
                for (DestinationData data : destinationsToSeedImages) {
                    ps.setString(1, data.imageRelativePath);
                    ps.setString(2, data.name);
                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                        System.out.println("✔ Updated: " + data.name);
                    } else {
                        System.err.println("⚠ Not found: " + data.name);
                    }
                }
            }

            System.out.println("Updating package image paths...");
            String updatePackageSql = "UPDATE packages SET image_path = ? WHERE package_name = ?";
            try (PreparedStatement ps = conn.prepareStatement(updatePackageSql)) {
                for (PackageData data : packagesToSeedImages) {
                    ps.setString(1, data.imageRelativePath);
                    ps.setString(2, data.packageName);
                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                        System.out.println("✔ Updated: " + data.packageName);
                    } else {
                        System.err.println("⚠ Not found: " + data.packageName);
                    }
                }
            }

            conn.commit();
            System.out.println("✅ Image path seeding completed.");
        } catch (SQLException e) {
            System.err.println("❌ Database error. Rolling back.");
            e.printStackTrace();
            if (conn != null) try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
        } finally {
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

    static class DestinationData {
        String name, imageRelativePath;
        DestinationData(String name, String imageRelativePath) {
            this.name = name;
            this.imageRelativePath = imageRelativePath;
        }
    }

    static class PackageData {
        String packageName, imageRelativePath;
        PackageData(String packageName, String imageRelativePath) {
            this.packageName = packageName;
            this.imageRelativePath = imageRelativePath;
        }
    }
}
