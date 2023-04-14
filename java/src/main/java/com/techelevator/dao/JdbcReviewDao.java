package com.techelevator.dao;

import com.techelevator.model.Brewery;
import com.techelevator.model.Review;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcReviewDao implements reviewDao{
    private JdbcTemplate jdbcTemplate;

    public JdbcReviewDao(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    @Override
    public List<Review> getReviewsForBeerById(long beer_id) {
        List<Review> allReviews = new ArrayList<>();
        String sqlSelectAllReviews = "SELECT * FROM reviews WHERE beer_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllReviews, beer_id);

        while(results.next()) {
            Review review = mapRowToReview(results);
            allReviews.add(review);
        }
        return allReviews;
    }

    @Override
    public List<Review> getReviewsForBreweryById(long brewery_id) {
        List<Review> allReviews = new ArrayList<>();
        String sqlSelectAllReviews = "SELECT * FROM reviews WHERE brewery_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllReviews, brewery_id);

        while(results.next()) {
            Review review = mapRowToReview(results);
            allReviews.add(review);
        }
        return allReviews;
    }

    @Override
    public void addReview(Review review) {
        String sqlAddReview = "INSERT INTO reviews(date, text, rating) VALUES(?,?,?);";
        jdbcTemplate.update(sqlAddReview, review.getDate(), review.getText(), review.getRating());
    }

    @Override
    public void deleteReview(long reviewId) {
        String sqlDeleteReview = "DELETE FROM reviews WHERE review_id = ?;";
        jdbcTemplate.update(sqlDeleteReview, reviewId);
    }

    @Override
    public List<Review> getReviewsForBeerByName(String name) {
        List<Review> allReviews = new ArrayList<>();
        String sqlSelectAllReviews = "SELECT * FROM reviews JOIN beers ON reviews.beer_id = beers.beer_id WHERE UPPER(beer.name) = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllReviews, name);

        while(results.next()) {
            Review review = mapRowToReview(results);
            allReviews.add(review);
        }
        return allReviews;
    }

    @Override
    public List<Review> getReviewsForBreweryByName(String name) {
        List<Review> allReviews = new ArrayList<>();
        String sqlSelectAllReviews = "SELECT * FROM reviews JOIN brewery ON reviews.brewery_id = brewery.brewery_id WHERE UPPER(brewery.name) = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllReviews, name);

        while(results.next()) {
            Review review = mapRowToReview(results);
            allReviews.add(review);
        }
        return allReviews;
    }

    private Review mapRowToReview(SqlRowSet rs){
        Review review = new Review();
        review.setUserId(rs.getInt("user_id"));
        review.setBreweryId(rs.getInt("brewery_id"));
        review.setBeerId(rs.getInt("beer_id"));
        review.setText(rs.getString("review_text"));
        review.setDate(rs.getDate("date"));
        review.setForBeer(rs.getBoolean("is_for_beer"));
        return review;
    }
}
