package com.techelevator.dao;

import com.techelevator.model.Brewery;

import java.util.List;

public interface breweryDao {

    List<Brewery> getAllBrewery();

    void addBrewery(Brewery brewery);

    void deleteBrewery(long breweryId);

    boolean updateBrewery(Brewery brewery, long id);

    Brewery getBreweryById(long breweryId);

    Brewery getBreweryByName(String name);


}
