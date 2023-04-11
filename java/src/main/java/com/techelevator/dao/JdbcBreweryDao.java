package com.techelevator.dao;

import com.techelevator.model.Brewery;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcBreweryDao implements breweryDao{
    private JdbcTemplate jdbcTemplate;

    public JdbcBreweryDao(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Brewery> getAllBrewery() {
        List<Brewery> allBreweries = new ArrayList<>();
        String sqlSelectAllBreweries = "SELECT * FROM brewery";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllBreweries);

        while(results.next()) {
            Brewery brewery = mapRowToBrewery(results);
            allBreweries.add(brewery);
        }
        return allBreweries;
    }

    @Override
    public void addBrewery(Brewery brewery) {

    }

    @Override
    public void deleteBrewery(long breweryId) {

    }

    @Override
    public void updateBrewery(Brewery brewery) {

    }

    @Override
    public Brewery getBreweryById(long breweryId) {
        return null;
    }

  private Brewery mapRowToBrewery(SqlRowSet rs) {
        Brewery brewery = new Brewery();
        brewery.setAddress(rs.getString("address"));
        brewery.setBreweryId(rs.getInt("brewery_id"));
        brewery.setHistory(rs.getString("history"));
        brewery.setHoursDaysOperation(rs.getString("hours_days_operation"));
        brewery.setImage(rs.getString("image"));
        brewery.setName(rs.getString("name"));
        brewery.setPhone(rs.getString("phone"));
        brewery.setWebsite(rs.getString("website"));
        return brewery;
  }
}
