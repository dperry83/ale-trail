package com.techelevator.controller;

import com.techelevator.dao.beersDao;
import com.techelevator.dao.breweryDao;
import com.techelevator.dao.reviewDao;
import com.techelevator.model.Brewery;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Locale;

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
    public Brewery getBreweryById(@PathVariable int id, Brewery brewery){
        Brewery thisBrewery = breweryDAO.getBreweryById(id);
        return thisBrewery;
    }

    @RequestMapping(path="/breweries/name={name}", method = RequestMethod.GET)
    public Brewery getBreweryByName(@PathVariable String name){
        Brewery thisBrewery = breweryDAO.getBreweryByName(name.toUpperCase());
        return thisBrewery;
    }
}
