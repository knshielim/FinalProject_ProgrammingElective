package com.halabo.model; 

import java.sql.Timestamp;
import java.time.LocalDate; // Use LocalDate for travel_date for cleaner handling

public class Booking {
    private int id;
    private int userId;
    private String username; // From users table
    private int packageId;
    private String packageName; // From packages table
    private Timestamp bookingDate;
    private LocalDate travelDate; // Using LocalDate for just date
    private int numberOfTravelers;
    private double totalPrice; // Use double or BigDecimal for currency
    private String status;
    private String specialRequests;
    private String contactName;
    private String contactEmail;
    private String contactPhone;

    // Constructors
    public Booking() {
    }

    // Constructor for fetching from DB
    public Booking(int id, int userId, String username, int packageId, String packageName,
                   Timestamp bookingDate, LocalDate travelDate, int numberOfTravelers,
                   double totalPrice, String status, String specialRequests,
                   String contactName, String contactEmail, String contactPhone) {
        this.id = id;
        this.userId = userId;
        this.username = username;
        this.packageId = packageId;
        this.packageName = packageName;
        this.bookingDate = bookingDate;
        this.travelDate = travelDate;
        this.numberOfTravelers = numberOfTravelers;
        this.totalPrice = totalPrice;
        this.status = status;
        this.specialRequests = specialRequests;
        this.contactName = contactName;
        this.contactEmail = contactEmail;
        this.contactPhone = contactPhone;
    }

    // Getters
    public int getId() { return id; }
    public int getUserId() { return userId; }
    public String getUsername() { return username; }
    public int getPackageId() { return packageId; }
    public String getPackageName() { return packageName; }
    public Timestamp getBookingDate() { return bookingDate; }
    public LocalDate getTravelDate() { return travelDate; }
    public int getNumberOfTravelers() { return numberOfTravelers; }
    public double getTotalPrice() { return totalPrice; }
    public String getStatus() { return status; }
    public String getSpecialRequests() { return specialRequests; }
    public String getContactName() { return contactName; }
    public String getContactEmail() { return contactEmail; }
    public String getContactPhone() { return contactPhone; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setUserId(int userId) { this.userId = userId; }
    public void setUsername(String username) { this.username = username; }
    public void setPackageId(int packageId) { this.packageId = packageId; }
    public void setPackageName(String packageName) { this.packageName = packageName; }
    public void setBookingDate(Timestamp bookingDate) { this.bookingDate = bookingDate; }
    public void setTravelDate(LocalDate travelDate) { this.travelDate = travelDate; }
    public void setNumberOfTravelers(int numberOfTravelers) { this.numberOfTravelers = numberOfTravelers; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }
    public void setStatus(String status) { this.status = status; }
    public void setSpecialRequests(String specialRequests) { this.specialRequests = specialRequests; }
    public void setContactName(String contactName) { this.contactName = contactName; }
    public void setContactEmail(String contactEmail) { this.contactEmail = contactEmail; }
    public void setContactPhone(String contactPhone) { this.contactPhone = contactPhone; }

    @Override
    public String toString() {
        return "Booking{" +
               "id=" + id +
               ", username='" + username + '\'' +
               ", packageName='" + packageName + '\'' +
               ", bookingDate=" + bookingDate +
               ", status='" + status + '\'' +
               '}';
    }
}