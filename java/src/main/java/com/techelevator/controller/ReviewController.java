package com.techelevator.controller;

import com.techelevator.dao.beersDao;
import com.techelevator.dao.breweryDao;
import com.techelevator.dao.reviewDao;
import com.techelevator.model.Brewery;
import com.techelevator.model.Review;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class ReviewController {
    private breweryDao breweryDAO;
    private beersDao beerDAO;
    private reviewDao reviewDAO;

    public ReviewController(reviewDao reviewDao){
        this.reviewDAO = reviewDao;
    }

    @RequestMapping(path="/review/beer/name={name}", method = RequestMethod.GET)
    public List<Review> getReviewForBeerByName(@PathVariable String name) {
        List<Review> ListOfReviewForBeer = reviewDAO.getReviewsForBeerByName(name.toUpperCase());
        return ListOfReviewForBeer;
    }

    @RequestMapping(path="/review/brewery/{id}", method = RequestMethod.GET)
    public List<Review> getReviewsForBreweryById(@PathVariable int id){
        List<Review> ListOfReviewForBrewery = reviewDAO.getReviewsForBreweryById(id);
        return ListOfReviewForBrewery;
    }

    @RequestMapping(path="/review/beer/{id}", method = RequestMethod.GET)
    public List<Review> getReviewByBeerId(@PathVariable int id){
        List<Review> ListOfReviewForBeer = reviewDAO.getReviewsForBeerById(id);
        return ListOfReviewForBeer;
    }

    @RequestMapping(path="/review/brewery/name={name}", method = RequestMethod.GET)
    public List<Review> getReviewForBreweryByName(@PathVariable String name){
        List<Review> ListOfReviewForBrewery = reviewDAO.getReviewsForBreweryByName(name.toUpperCase());
        return ListOfReviewForBrewery;
    }

    @RequestMapping(path="/review", method=RequestMethod.POST)
    public void addReview(@RequestBody Review review) {
        reviewDAO.addReview(review);
    }

    @RequestMapping(path="/review/{reviewId}", method = RequestMethod.DELETE)
    public void deleteReview(@PathVariable long reviewId) {
        reviewDAO.deleteReview(reviewId);
    }
}
