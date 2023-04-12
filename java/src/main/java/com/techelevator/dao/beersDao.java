package com.techelevator.dao;

import com.techelevator.model.Beer;

import java.util.List;

public interface beersDao {

    List<Beer> getAllBeer();

    void addBeer(Beer beer);

    void deleteBeer(long beerId);

    void saveBeer(Beer beer);

    Beer getBeerById(long beerId);

    void updateBeer(Beer beer);

    List<Beer> getBeerByBrewerId(long breweryId);


}
