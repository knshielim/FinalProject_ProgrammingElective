package com.halabo.model;

public class Destination {
    private int id;
    private String name; // maps to destination_name in DB
    private String caption;
    private String description;
    private String imagePath;
    // Add other fields as per your schema if needed for the model

    public Destination() {}

    // Existing constructor (might be used elsewhere)
    public Destination(int id, String name) {
        this.id = id;
        this.name = name;
    }

    // NEW CONSTRUCTOR TO ADD:
    public Destination(int id, String name, String caption, String description, String imagePath) {
        this.id = id;
        this.name = name;
        this.caption = caption;
        this.description = description;
        this.imagePath = imagePath;
    }

    // Getters and Setters (ensure these exist for all fields)
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getCaption() { return caption; }
    public void setCaption(String caption) { this.caption = caption; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
}