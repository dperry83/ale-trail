package com.techelevator.controller;

import com.techelevator.dao.beersDao;
import com.techelevator.dao.breweryDao;
import com.techelevator.dao.reviewDao;
import com.techelevator.model.Beer;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@PreAuthorize("permitAll")
@RestController
@CrossOrigin
public class BeerController {
    private beersDao beerDAO;
    private breweryDao breweryDAO;
    private reviewDao reviewDAO;

    public BeerController(beersDao beerDao){
        this.beerDAO = beerDao;
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/beers", method=RequestMethod.GET)
    public List<Beer> getAllBeer(){
        List<Beer> listOfBeer = beerDAO.getAllBeer();
        return listOfBeer;
    }

}
