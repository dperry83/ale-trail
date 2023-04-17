package com.techelevator.dao;

import com.techelevator.model.Review;
import org.springframework.stereotype.Component;

import java.util.List;

public interface reviewDao {
    List<Review> getReviewsForBeerById(int beer_id);

    List<Review> getReviewsForBreweryById(int brewery_id);

    void addReview(Review review);

    void deleteReview(long reviewId);

    List<Review> getReviewsForBeerByName(String name);

    List<Review> getReviewsForBreweryByName(String name);
}
