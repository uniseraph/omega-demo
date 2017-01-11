package com.omega.demo.service.controller;

import com.omega.demo.api.bean.User;
import com.omega.demo.service.domain.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by wuzhengtao on 16/12/6.
 */

@RestController
public class UserController {

    @Autowired
    UserEntity userEntity;

    @RequestMapping("/user/{id}")
    public User getById(@PathVariable("id") String id) {
        return userEntity.getById(id);
    }

    @RequestMapping(value="/user/create", method = RequestMethod.POST)
    public void create(@RequestBody User user) {
        userEntity.create(user);
    }

    @RequestMapping(value="/testUser")
    public void test() {
        userEntity.create(null);
    }

}
