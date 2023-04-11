package com.techelevator.model;

import java.time.LocalDateTime;
import java.util.Date;

public class Review {
    private long reviewId;
    private long userId;
    private long breweryId;
    private String reviewText;
    private Date date;
    private int rating;
    private boolean isForBeer;

    public long getReviewId() {
        return reviewId;
    }

    public void setReviewId(long reviewId) {
        this.reviewId = reviewId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(long breweryId) {
        this.breweryId = breweryId;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
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

    public boolean isForBeer() {
        return isForBeer;
    }

    public void setForBeer(boolean forBeer) {
        isForBeer = forBeer;
    }
}
