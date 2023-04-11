package com.techelevator.dao;

import com.techelevator.model.Review;

import java.util.List;

public interface reviewDao {
    List<Review> getReviewsForBeer(long beer_id);

    void addReview(Review review);

    void deleteReview(long reviewId);


}
