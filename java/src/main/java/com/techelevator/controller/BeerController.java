package com.techelevator.controller;

import com.techelevator.dao.beersDao;
import com.techelevator.dao.breweryDao;
import com.techelevator.dao.reviewDao;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
//@PreAuthorize("permitAll")
@RestController
@CrossOrigin
public class BeerController {
    private beersDao beerDAO;
    private breweryDao breweryDAO;
    private reviewDao reviewDAO;

    public BeerController(beersDao beerDao){
        this.beerDAO = beerDao;
    }

//    @PreAuthorize("permitAll")
    @RequestMapping(path = "/beers", method=RequestMethod.GET)
    public List<Beer> getAllBeer(){
        List<Beer> listOfBeer = beerDAO.getAllBeer();
        return listOfBeer;
    }

    @RequestMapping(path="/beers/{id}", method = RequestMethod.GET)
    public Beer getBeerById(@PathVariable int id, Beer beer){
        Beer thisBeer = beerDAO.getBeerById(id);
        return thisBeer;
    }

    @RequestMapping(path="/beers/name={name}", method = RequestMethod.GET)
    public Beer getBeerByName(@PathVariable String name, Beer beer){
        Beer thisBeer = beerDAO.getBeerByName(name.toUpperCase());
        return thisBeer;
    }

    @RequestMapping(path="/beers/breweryId={id}", method = RequestMethod.GET)
    public List<Beer> getBeerByBreweryId(@PathVariable int id){
        List<Beer> listOfBeer = beerDAO.getBeerByBreweryId(id);
        return listOfBeer;
    }

    @RequestMapping(path="/beers", method =RequestMethod.POST)
    public void addBeer(@RequestBody Beer beer) {
        beerDAO.addBeer(beer);
    }

    @RequestMapping(path="/beers/{id}", method = RequestMethod.PUT)
    public boolean updateBeer(@RequestBody Beer beer, @PathVariable long id) {
        beerDAO.updateBeer(beer, id);
                return true;
    }

    @RequestMapping(path="/beers/{id}", method = RequestMethod.DELETE)
    public void deleteBeer(@PathVariable long id) {
        beerDAO.deleteBeer(id);
    }
}
