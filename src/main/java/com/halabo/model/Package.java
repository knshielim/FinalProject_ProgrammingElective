package com.halabo.model;

public class Package {
    private int id;
    private int destinationId;
    private String packageName;
    private byte[] packageImage;
    private String imagePath;
    private String price;
    private String duration;
    private int minPeople;
    private String tourType;
    private String tourCode;
    private String description;
    private String itinerary;
    private String priceDetails;
    private String hotel;
    private String remarks;

    public Package(int id, int destinationId, String packageName, String imagePath, String price, 
                   String duration, int minPeople, String tourType, String tourCode, String description,
                   String itinerary, String priceDetails, String hotel, String remarks) {
        this.id = id;
        this.destinationId = destinationId;
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

    public Package(int destinationId, String packageName, byte[] packageImage, String price,
                   String duration, int minPeople, String tourType, String tourCode, String description,
                   String itinerary, String priceDetails, String hotel, String remarks) {
        this.destinationId = destinationId;
        this.packageName = packageName;
        this.packageImage = packageImage;
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

    public int getId() { return id; }
    public int getDestinationId() { return destinationId; }
    public String getPackageName() { return packageName; }
    public byte[] getPackageImage() { return packageImage; }
    public String getImagePath() { return imagePath; }
    public String getPrice() { return price; }
    public String getDuration() { return duration; }
    public int getMinPeople() { return minPeople; }
    public String getTourType() { return tourType; }
    public String getTourCode() { return tourCode; }
    public String getDescription() { return description; }
    public String getItinerary() { return itinerary; }
    public String getPriceDetails() { return priceDetails; }
    public String getHotel() { return hotel; }
    public String getRemarks() { return remarks; }

    public void setId(int id) { this.id = id; }
    public void setDestinationId(int destinationId) { this.destinationId = destinationId; }
    public void setPackageName(String packageName) { this.packageName = packageName; }
    public void setPackageImage(byte[] packageImage) { this.packageImage = packageImage; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
    public void setPrice(String price) { this.price = price; }
    public void setDuration(String duration) { this.duration = duration; }
    public void setMinPeople(int minPeople) { this.minPeople = minPeople; }
    public void setTourType(String tourType) { this.tourType = tourType; }
    public void setTourCode(String tourCode) { this.tourCode = tourCode; }
    public void setDescription(String description) { this.description = description; }
    public void setItinerary(String itinerary) { this.itinerary = itinerary; }
    public void setPriceDetails(String priceDetails) { this.priceDetails = priceDetails; }
    public void setHotel(String hotel) { this.hotel = hotel; }
    public void setRemarks(String remarks) { this.remarks = remarks; }
}