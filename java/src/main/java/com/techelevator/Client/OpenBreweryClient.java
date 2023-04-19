package com.techelevator.Client;

import com.techelevator.model.BreweryAPI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.List;

@Component
public class OpenBreweryClient {
    public static final String API_BASE_URL = "https://api.openbrewerydb.org";
    public final RestTemplate restTemplate;

    @Autowired
    public OpenBreweryClient (RestTemplateBuilder restTemplateBuilder) {
        this.restTemplate = restTemplateBuilder.build();
    }
    public List<BreweryAPI> searchBreweriesByName(String name) {
        String url = String.format("%s/breweries/search?query=%s", API_BASE_URL, name);
        BreweryAPI[] breweries = restTemplate.getForObject(url, BreweryAPI[].class);
        return Arrays.asList(breweries);
    }

}
