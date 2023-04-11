package com.techelevator.dao;

import com.techelevator.model.Brewery;

import java.util.List;

public interface breweryDao {

    List<Brewery> getAllBrewery();

    void addBrewery(Brewery brewery);

    void deleteBrewery(long breweryId);

    void updateBrewery(Brewery brewery);

    Brewery getBreweryById(long breweryId);


}
