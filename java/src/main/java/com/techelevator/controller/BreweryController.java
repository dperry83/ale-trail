package com.techelevator.controller;

import com.techelevator.dao.beersDao;
import com.techelevator.dao.breweryDao;
import com.techelevator.dao.reviewDao;
import com.techelevator.model.Brewery;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

//@PreAuthorize("permitAll")
@CrossOrigin
@RestController
public class BreweryController {
    private breweryDao breweryDAO;
    private beersDao beerDAO;
    private reviewDao reviewDAO;


    public BreweryController(breweryDao breweryDao) {
        this.breweryDAO = breweryDao;
    }

    //@PreAuthorize("permitAll")
    @RequestMapping(path="/breweries", method = RequestMethod.GET)
    public List<Brewery> getAllBrewery() {
        List<Brewery> listOfBreweries = breweryDAO.getAllBrewery();
        return listOfBreweries;
    }

    @RequestMapping(path="/breweries/{id}", method = RequestMethod.GET)
    public Brewery getBrewery(@PathVariable int id, Brewery brewery){
        Brewery thisBrewery = breweryDAO.getBreweryById(id);
        return thisBrewery;

    }
}
