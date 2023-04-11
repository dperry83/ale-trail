package com.techelevator.dao;

import com.techelevator.model.Review;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public interface reviewDao {
    List<Review> getReviewsForBeer(long beer_id);

    void addReview(Review review);

    void deleteReview(long reviewId);


}
