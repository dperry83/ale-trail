package com.techelevator.dao;

import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import org.springframework.dao.DataIntegrityViolationException;
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
        String sqlAddBeer = "INSERT INTO beers(brewery_id, name, description, abv, beer_type) " +
                "VALUES(?,?,?,?,?);";
        jdbcTemplate.update(sqlAddBeer, beer.getBreweryId(), beer.getName(),
                beer.getDescription(), beer.getAbv(), beer.getBeerType());
    }

    @Override
    public void deleteBeer(long beerId) {
        String sqlDeleteBeer= "DELETE FROM beers WHERE beer_id = ?;";
        jdbcTemplate.update(sqlDeleteBeer, beerId);
    }

    @Override
    public Beer getBeerById(long beerId) {
        Beer beer = new Beer();
        String sqlGetBeerById = "SELECT * FROM beers WHERE beer_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetBeerById, beerId);
        if(results.next()){
            beer = mapRowToBeer(results);
        }
        return beer;
    }

    @Override
    public boolean updateBeer(Beer beer) {
        String sqlUpdateBeer = "UPDATE beers SET brewery_id = ?,name = ?, " +
                "description = ?, abv = ?, beer_type = ? " +
                "WHERE beer_id = ?;";
        try {
            jdbcTemplate.update(sqlUpdateBeer, beer.getBreweryId(), beer.getName(),
                    beer.getDescription(), beer.getAbv(), beer.getBeerType(), beer.getBeerId());
        }catch(DataIntegrityViolationException e){
            sqlUpdateBeer = "ROLLBACK;";
            jdbcTemplate.update(sqlUpdateBeer);
            return false;
        }
        return true;
    }

    @Override
    public List<Beer> getBeerByBreweryId(long breweryId) {
        List<Beer> allBeers = new ArrayList<>();
        String sqlSelectAllBeers = "SELECT * FROM beers WHERE brewery_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllBeers, breweryId);

        while (results.next()) {
            Beer beers = mapRowToBeer(results);
            allBeers.add(beers);
        }
        return allBeers;
    }

    @Override
    public Beer getBeerByName(String name) {
        Beer beer = new Beer();
        String sqlGetBeerByName = "SELECT * FROM beer WHERE UPPER(name) = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetBeerByName, name);
        if(results.next()){
            beer = mapRowToBeer(results);
        }
        return beer;
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
