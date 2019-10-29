package com.utm.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    @RequestMapping("/create-user")
    public String createUser() {

        return "user/create-user";
    }

}
