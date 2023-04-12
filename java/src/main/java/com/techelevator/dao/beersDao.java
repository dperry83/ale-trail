package com.techelevator.dao;

import com.techelevator.model.Beer;

import java.util.List;

public interface beersDao {

    List<Beer> getAllBeer();

    void addBeer(Beer beer);

    void deleteBeer(long beerId);


    Beer getBeerById(long beerId);

    boolean updateBeer(Beer beer);

    List<Beer> getBeerByBreweryId(long breweryId);

    Beer getBeerByName(String name);


}
