package com.halabo.model;

public class Package {
    private int id;
    private int destinationId;
    private String destinationName; // To hold the joined name from destinations table
    private String packageName;
    private String imagePath;
    private String price; // Storing as String based on schema
    private String duration; // Storing as String based on schema
    private String minPeople; // Storing as String based on schema
    private String tourType;
    private String tourCode;
    private String description;
    private String itinerary;
    private String priceDetails;
    private String hotel;
    private String remarks;

    // Default constructor
    public Package() {}

    // Constructor to match the fields retrieved from DB, including joined destination_name
    public Package(int id, int destinationId, String destinationName, String packageName,
                   String imagePath, String price, String duration, String minPeople,
                   String tourType, String tourCode, String description, String itinerary,
                   String priceDetails, String hotel, String remarks) {
        this.id = id;
        this.destinationId = destinationId;
        this.destinationName = destinationName;
        this.packageName = packageName;
        this.imagePath = imagePath;
        this.price = price;
        this.duration = duration;
        this.minPeople = minPeople;
        this.tourType = tourType;
        this.tourCode = tourCode;
        this.description = description;
        this.itinerary = itinerary;
        this.priceDetails = priceDetails;
        this.hotel = hotel;
        this.remarks = remarks;
    }

    // You will need all the getters and setters for all fields
    // Example:
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getDestinationId() { return destinationId; }
    public void setDestinationId(int destinationId) { this.destinationId = destinationId; }
    public String getDestinationName() { return destinationName; }
    public void setDestinationName(String destinationName) { this.destinationName = destinationName; }
    public String getPackageName() { return packageName; }
    public void setPackageName(String packageName) { this.packageName = packageName; }
    // ... all other getters and setters ...

    // If you have a Destination object in Package (as in my previous example), you'd need this too
    private Destination destination;
    public Destination getDestination() {
        if (this.destination == null) {
            this.destination = new Destination();
            this.destination.setId(this.destinationId);
            this.destination.setName(this.destinationName);
        }
        return this.destination;
    }
    public void setDestination(Destination destination) {
        this.destination = destination;
        if (destination != null) {
            this.destinationId = destination.getId();
            this.destinationName = destination.getName();
        }
    }
}