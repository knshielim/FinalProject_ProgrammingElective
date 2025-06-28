package com.halabo.model;

public class User {
    private int id;
    private String firstName;
    private String lastName;
    private String username;
    private String email;
    // private String password; // Don't typically keep password in model after login
    private String phone;
    private String profileImage; // Assuming you handle BLOBs as paths/base64 strings or stream them
    private boolean isAdmin; // This is how we're tracking admin status for now

    public User() {}

    // Constructor for fetched data (add full_name if you want to initialize it directly from DB)
    public User(int id, String firstName, String lastName, String username, String email, String phone) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.phone = phone;
        // isAdmin is not part of this constructor's initial data
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getFullName() { return firstName + " " + lastName; } // Convenience method
    public String getProfileImage() { return profileImage; }
    public void setProfileImage(String profileImage) { this.profileImage = profileImage; } // Or byte[]
    public boolean isAdmin() { return isAdmin; } // Getter for admin status
    public void setAdmin(boolean admin) { isAdmin = admin; } // Setter for admin status

    // REMOVED: No getRole() or setRole() if 'role' column doesn't exist in DB
}