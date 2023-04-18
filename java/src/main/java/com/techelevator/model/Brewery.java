package com.techelevator.model;

public class Brewery {

    private long breweryId;
    private int userId;
    private String name;
    private String address;
    private String phone;
    private String history;
    private String website;
    private String hoursDaysOperation;
    private String image;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public long getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(long breweryId) {
        this.breweryId = breweryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getHoursDaysOperation() {
        return hoursDaysOperation;
    }

    public void setHoursDaysOperation(String hoursDaysOperation) {
        this.hoursDaysOperation = hoursDaysOperation;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
