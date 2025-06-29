package com.halabo.model;

public class Destination {
    private int id;
    private String name;
    private String caption;
    private String description;
    private byte[] imageData; // Stores image data as byte array (BLOB)
    private String imagePath; // Added imagePath field

    // Constructor for fetching from DB with all fields
    public Destination(int id, String name, String caption, String description, String imagePath) {
        this.id = id;
        this.name = name;
        this.caption = caption;
        this.description = description;
        this.imagePath = imagePath;
    }

    // Constructor for fetching from DB with image data
    public Destination(int id, String name, String caption, String description, byte[] imageData) {
        this.id = id;
        this.name = name;
        this.caption = caption;
        this.description = description;
        this.imageData = imageData;
    }

    // Constructor for creating new destinations (e.g., from form input, before ID is assigned)
    public Destination(String name, String caption, String description, byte[] imageData) {
        this.name = name;
        this.caption = caption;
        this.description = description;
        this.imageData = imageData;
    }

    // Getters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getCaption() { return caption; }
    public String getDescription() { return description; }
    public byte[] getImageData() { return imageData; }
    public String getImagePath() { return imagePath; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setCaption(String caption) { this.caption = caption; }
    public void setDescription(String description) { this.description = description; }
    public void setImageData(byte[] imageData) { this.imageData = imageData; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
}