package com.techelevator.controller;


import com.techelevator.dao.UserDao;
import com.techelevator.model.User;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class UserController {
    UserDao userDAO;

    public UserController(UserDao userDao) {
        this.userDAO = userDao;
    }

    @RequestMapping(path = "/user/id/name={name}", method = RequestMethod.GET)
    public int getIdByUsername(@PathVariable String name) {
        int userId = userDAO.findIdByUsername(name);
        return userId;
    }

    @RequestMapping(path = "/user/{id}", method = RequestMethod.GET)
    public User getUserById(@PathVariable int id) {
        User userId = userDAO.getUserById(id);
        return userId;
    }

    @RequestMapping(path = "/user", method = RequestMethod.GET)
    public List<User> findAll() {
        List<User> listOfUser = userDAO.findAll();
        return listOfUser;
    }

    @RequestMapping(path = "/user/name={name}", method = RequestMethod.GET)
    public User findByUsername(@PathVariable String name){
        User thisUser = userDAO.findByUsername(name);
        return thisUser;
    }

    @RequestMapping(path = "/user/{id}", method = RequestMethod.PUT)
    public boolean updateUserRole(@RequestBody User user, @PathVariable int id) {
        userDAO.updateUserRole(user, id);
        return true;
    }
}
