package com.halabo.util;

import java.io.File;
import java.io.FileInputStream; 
import java.io.InputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DatabaseSeeder {

    // Store the webAppRootPath, so getImageInputStream can use it
    private static String WEBARCHIVE_ROOT_PATH;

    // Helper method to get InputStream for image file from the filesystem
    private static InputStream getImageInputStream(String relativePath) throws IOException {
        // Construct the full path using the provided web archive root path
        // The relativePath here is "images/borobudur1.jpg"
        // So, fullPath will be something like "C:/path/to/tomcat/webapps/FinalProject_ProgrammingElective/images/borobudur1.jpg"
        String fullPath = WEBARCHIVE_ROOT_PATH + relativePath; // <--- MODIFIED HERE
        File file = new File(fullPath);

        if (!file.exists()) {
            System.err.println("ERROR: Image file not found at: " + file.getAbsolutePath());
            throw new IOException("Image file not found at: " + file.getAbsolutePath());
        }
        return new FileInputStream(file);
    }

    // New method that the AppStartupListener will call
    public static void runSeeder(String webAppRootPath) {
        // Set the web archive root path for use by getImageInputStream
        WEBARCHIVE_ROOT_PATH = webAppRootPath;

        // --- IMPORTANT: Ensure you have already run your modified SQL script
        // to populate the text data, before running this Java seeder.

        List<DestinationData> destinationsToSeedImages = new ArrayList<>();
        destinationsToSeedImages.add(new DestinationData(
                "Borobudur Temple", "images/borobudur1.jpg"
        ));
        destinationsToSeedImages.add(new DestinationData(
                "Bali Island", "images/bali2.jpg"
        ));
        destinationsToSeedImages.add(new DestinationData(
                "Raja Ampat", "images/rajaampat3.jpg"
        ));
        destinationsToSeedImages.add(new DestinationData(
                "Mount Bromo", "images/bromo4.jpg"
        ));
        destinationsToSeedImages.add(new DestinationData(
                "Lake Toba", "images/toba5.jpg"
        ));
        destinationsToSeedImages.add(new DestinationData(
                "Pulau Seribu", "images/pulauseribu6.jpg"
        ));
        destinationsToSeedImages.add(new DestinationData(
                "Monas National Monument", "images/monas7.jpg"
        ));
        destinationsToSeedImages.add(new DestinationData(
                "Komodo Island", "images/komodo8.jpg"
        ));
        destinationsToSeedImages.add(new DestinationData(
                "Labuan Bajo", "images/labuanbajo9.jpg"
        ));
        destinationsToSeedImages.add(new DestinationData(
                "Prambanan Temple", "images/prambanan10.jpg"
        ));

        List<PackageData> packagesToSeedImages = new ArrayList<>();
        packagesToSeedImages.add(new PackageData(
            "3D2N Borobudur (Family Journey) – Java Family Stay", "images/borobudur_p1.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "3D2N Borobudur (Adventure Trail) – Sunrise & Trek", "images/borobudur_p2.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "4D3N Borobudur (Cultural Luxury) – Borobudur Heritage Resort", "images/borobudur_p3.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "3D2N Bali (Beach Getaway) – Ocean Breeze Hotel", "images/bali_p1.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "5D4N Bali (Adventure Retreat) – Ubud Jungle Lodge", "images/bali_p2.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "3D2N Bali (Beachside Romance) – Seminyak Bliss Resort", "images/bali_p3.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "4D3N Raja Ampat (Marine Discovery) – Coral Reef Lodge", "images/rajaampat_p1.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "6D5N Raja Ampat (Eco Explorer) – Coral Reef Resort", "images/rajaampat_p2.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "6D5N Raja Ampat (Luxury Dive Cruise) – Ocean Pearl Explorer", "images/rajaampat_p3.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "2D1N Mount Bromo (Sunrise Experience) – Bromo Hillside Lodge", "images/mountbromo_p1.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "3D2N Mount Bromo (Scenic Discovery) – Lava View Resort", "images/mountbromo_p2.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "4D3N Mount Bromo & Ijen (Crater Adventure) – Volcanic Trekker's Delight", "images/mountbromo_p3.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "3D2N Lake Toba (Cultural Retreat) – Toba Serenity Resort", "images/laketoba_p1.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "4D3N Lake Toba (Adventure Discovery) – Summit Eco Lodge", "images/laketoba_p2.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "5D4N Lake Toba (Honeymoon Escape) – Samosir Romantic Villas", "images/laketoba_p3.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "2D1N Pulau Seribu (Island Escape) – Tidung Serenity Resort", "images/pulauseribu_p1.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "3D2N Pulau Seribu (Couple's Getaway) – Coral Bliss Resort", "images/pulauseribu_p2.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "3D2N Pulau Seribu (Water Adventure) – Marina Dive Lodge", "images/pulauseribu_p3.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "2D1N Monas (Historical Exploration) – Jakarta Heritage Hotel", "images/monas_p1.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "2D1N Monas (Heritage Tour) – Jakarta City Stay", "images/monas_p2.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "3D2N Monas (Night City Escape) – Urban Glow Hotel", "images/monas_p3.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "3D2N Komodo Encounter (Explorer Package) – Labuan Bajo Stay", "images/komodoisland_p1.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "3D2N Komodo (Wildlife Trek) – Komodo Hillside Inn", "images/komodoisland_p2.jpg"
        ));
        packagesToSeedImages.add(new PackageData(
            "4D3N Komodo (Explorer's Escape) – Ocean Breeze Resort", "images/komodoisland_p3.jpg"
        ));   
        packagesToSeedImages.add(new PackageData(
            "2D1N Labuan Bajo (Quick Adventure) – Bajo Harbor Lodge", "images/labuanbajo_p1.jpg"
        ));   
        packagesToSeedImages.add(new PackageData(
            "4D3N Labuan Bajo (Island Discovery) – Bajo Bay Villas", "images/labuanbajo_p2.jpg"
        ));   
        packagesToSeedImages.add(new PackageData(
            "3D2N Labuan Bajo (Romantic Escape) – Sunset View Villas", "images/labuanbajo_p3.jpg"
        ));   
        packagesToSeedImages.add(new PackageData(
            "3D2N Prambanan (Cultural Discovery) – Candi Garden Hotel", "images/prambanan_p1.jpg"
        ));   
        packagesToSeedImages.add(new PackageData(
            "3D2N Prambanan (Romantic Heritage Escape) – Svarna Heritage Lodge", "images/prambanan_p2.jpg"
        ));   
        packagesToSeedImages.add(new PackageData(
            "2D1N Prambanan (Budget Explorer) – Taman Yogyakarta Guesthouse", "images/prambanan_p3.jpg"
        ));   
        


        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            conn.setAutoCommit(false); // Start transaction

            // Update Destination Images
            System.out.println("Updating destination images...");
            String updateDestinationSql = "UPDATE destinations SET destination_image = ? WHERE destination_name = ?";
            try (PreparedStatement ps = conn.prepareStatement(updateDestinationSql)) {
                for (DestinationData data : destinationsToSeedImages) {
                    try (InputStream imageStream = getImageInputStream(data.imageRelativePath)) {
                        if (imageStream != null) {
                            ps.setBlob(1, imageStream);
                            ps.setString(2, data.name);
                            int rowsAffected = ps.executeUpdate();
                            if (rowsAffected > 0) {
                                System.out.println("Updated image for Destination: " + data.name);
                            } else {
                                System.err.println("WARNING: Destination not found or image not updated for: " + data.name);
                            }
                        } else {
                            System.err.println("ERROR: Image not found for " + data.name + " at " + data.imageRelativePath + ". Skipping image update.");
                        }
                    } catch (IOException e) {
                        System.err.println("Error reading image file for " + data.name + ": " + e.getMessage());
                    }
                }
            }
            System.out.println("All destination images processed.");


            // Update Package Images
            System.out.println("Updating package images...");
            String updatePackageSql = "UPDATE packages SET package_image = ? WHERE package_name = ?";
            try (PreparedStatement ps = conn.prepareStatement(updatePackageSql)) {
                for (PackageData data : packagesToSeedImages) {
                    try (InputStream imageStream = getImageInputStream(data.imageRelativePath)) {
                        if (imageStream != null) {
                            ps.setBlob(1, imageStream);
                            ps.setString(2, data.packageName);
                            int rowsAffected = ps.executeUpdate();
                            if (rowsAffected > 0) {
                                System.out.println("Updated image for Package: " + data.packageName);
                            } else {
                                System.err.println("WARNING: Package not found or image not updated for: " + data.packageName);
                            }
                        } else {
                            System.err.println("ERROR: Image not found for " + data.packageName + " at " + data.imageRelativePath + ". Skipping image update.");
                        }
                    } catch (IOException e) {
                        System.err.println("Error reading image file for " + data.packageName + ": " + e.getMessage());
                    }
                }
            }
            System.out.println("All package images processed.");


            conn.commit(); // Commit all changes
            System.out.println("Image seeding completed successfully!");

        } catch (SQLException e) {
            System.err.println("Image Seeding Failed! Rolling back transaction.");
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    System.err.println("Rollback failed: " + ex.getMessage());
                }
            }
        } catch (Exception e) {
            System.err.println("An unexpected error occurred during image seeding.");
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    System.err.println("Rollback failed after unexpected error: " + ex.getMessage());
                }
            }
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    System.err.println("Failed to close database connection: " + e.getMessage());
                }
            }
        }
    }

    // Keep the main method for direct testing if needed, but it won't be called by the listener
    public static void main(String[] args) {
        // If you run this main method directly, you'll need to provide the correct absolute path
        // Example: C:\Users\Keisha Nalani\Documents\GitHub\FinalProject_ProgrammingElective\src\main\webapp\
        // For development, it's often easier to simply run the web application via Tomcat.
        System.err.println("WARNING: Running DatabaseSeeder.main() directly. Ensure WEBARCHIVE_ROOT_PATH is correctly set or passed.");
        // You would typically set WEBARCHIVE_ROOT_PATH manually here for direct testing, e.g.:
        // WEBARCHIVE_ROOT_PATH = "C:\\Users\\Keisha Nalani\\Documents\\GitHub\\FinalProject_ProgrammingElective\\src\\main\\webapp\\";
        // runSeeder(WEBARCHIVE_ROOT_PATH);
    }

    // Existing nested classes
    static class DestinationData {
        String name;
        String imageRelativePath;
        DestinationData(String name, String imageRelativePath) {
            this.name = name;
            this.imageRelativePath = imageRelativePath;
        }
    }

    static class PackageData {
        String packageName;
        String imageRelativePath;
        PackageData(String packageName, String imageRelativePath) {
            this.packageName = packageName;
            this.imageRelativePath = imageRelativePath;
        }
    }
}