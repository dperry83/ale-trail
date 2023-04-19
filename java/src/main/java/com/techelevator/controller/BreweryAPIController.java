package com.techelevator.controller;

import com.techelevator.Service.BreweryAPIService;
import com.techelevator.model.BreweryAPI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RestController
public class BreweryAPIController {
    private final BreweryAPIService breweryApiService;

    @Autowired
    public BreweryAPIController(BreweryAPIService breweryApiService) {
        this.breweryApiService = breweryApiService;
    }

    @GetMapping("/breweries/random")
    public BreweryAPI getRandomBrewery() {
        return breweryApiService.getRandomBrewery();
    }
}
