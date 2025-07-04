// com.halabo.model.User.java
package com.halabo.model;

import java.io.Serializable; // Good practice for session objects

public class User implements Serializable {
    private int id;
    private String firstName;
    private String lastName;
    private String username;
    private String email;
    private String phone;
    private boolean isAdmin; // Added for admin status

    // Constructor (optional)
    public User() {}

    // Getters and Setters for all fields
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

    public boolean isAdmin() { return isAdmin; } // Getter for boolean is convention "is"
    public void setAdmin(boolean admin) { isAdmin = admin; }

    // Convenience method for full name
    public String getFullName() {
        return (firstName != null ? firstName : "") + " " + (lastName != null ? lastName : "");
    }
}