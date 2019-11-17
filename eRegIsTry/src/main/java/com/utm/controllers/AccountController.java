package com.utm.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountController {
    @GetMapping("/my-account")
    public String showLoginPage() {

        //return "plain-login";

        return "my-account";
    }
}
