package com.techelevator.Service;

import com.techelevator.Client.OpenBreweryClient;
import com.techelevator.model.BreweryAPI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class BreweryAPIService {

    private final OpenBreweryClient openBreweryClient;

    @Autowired
    public BreweryAPIService(OpenBreweryClient openBreweryClient) {
        this.openBreweryClient = openBreweryClient;
    }



    public BreweryAPI getRandomBrewery() {
        RestTemplate restTemplate = new RestTemplate();
        String url = "https://api.openbrewerydb.org/breweries?by_city=Minneapolis&per_page=50";
        BreweryAPI[] breweries = restTemplate.getForObject(url, BreweryAPI[].class);

        if (breweries != null && breweries.length > 0) {
            int random = (int) (Math.random() * breweries.length);
            return breweries[random];
        } else {
            return null;
        }
    }

}
