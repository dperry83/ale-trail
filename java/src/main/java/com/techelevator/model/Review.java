package com.techelevator.model;

import java.time.LocalDateTime;
import java.util.Date;

public class Review {
    private int reviewId;
    private int userId;
//    private String reviewerName;
    private int breweryId;
    private int beerId;
    private String beerName;
    private String text;
    private Date date;
    private int rating;
    private String username;
    private boolean isForBeer;

//    public String getReviewerName() {
//        return reviewerName;
//    }

//    public void setReviewerName(String reviewerName) {
//        this.reviewerName = reviewerName;
//    }

    public String getBeerName() {
        return beerName;
    }

    public void setBeerName(String beerName) {
        this.beerName = beerName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public long getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public long getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(int breweryId) {
        this.breweryId = breweryId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public boolean getIsForBeer() {
        return isForBeer;
    }

    public void setIsForBeer(boolean forBeer) {
        isForBeer = forBeer;
    }

    public long getBeerId() {
        return beerId;
    }

    public void setBeerId(int beerId) {
        this.beerId = beerId;
    }
}
