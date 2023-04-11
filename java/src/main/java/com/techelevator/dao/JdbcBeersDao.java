package com.techelevator.dao;

import com.techelevator.model.Beer;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBeersDao implements beersDao{
    private JdbcTemplate jdbcTemplate;

    public JdbcBeersDao(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Beer> getAllBeer() {
        List<Beer> listOfBeers = new ArrayList<>();
        String sqlSelectAllBeers = "SELECT * FROM beers;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllBeers);

        while(results.next()){
            Beer beer = mapRowToBeer(results);
            listOfBeers.add(beer);
        }
        return listOfBeers;
    }

    @Override
    public void addBeer(Beer beer) {

    }

    @Override
    public void deleteBeer(long beerId) {

    }

    @Override
    public void saveBeer(Beer beer) {

    }

    @Override
    public Beer getBeerById(long beerId) {
        return null;
    }

    @Override
    public void updateBeer(Beer beer) {

    }

    @Override
    public List<Beer> getBeerByBrewerId(long breweryId) {
        return null;
    }

    private Beer mapRowToBeer(SqlRowSet rs){
        Beer beer = new Beer();
        beer.setBeerId(rs.getInt("beer_id"));
        beer.setBreweryId(rs.getInt("brewery_id"));
        beer.setName(rs.getString("name"));
        beer.setDescription(rs.getString("description"));
        beer.setAbv(rs.getDouble("abv"));
        beer.setBeerType(rs.getString("beer_type"));
        return beer;
    }
}
