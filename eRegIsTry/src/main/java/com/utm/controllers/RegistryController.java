package com.utm.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegistryController {

    @RequestMapping("/create-registry")
    public String createUser() {

        return "registry/create-registry";
    }

}
