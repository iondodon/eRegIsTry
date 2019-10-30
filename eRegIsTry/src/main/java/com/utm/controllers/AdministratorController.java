package com.utm.controllers;

import com.utm.entities.Administrator;
import com.utm.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.utm.services.AdministratorService;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/administrator")
public class AdministratorController {
    private AdministratorService administratorService;

    @Autowired
    public void setAdministratorService(AdministratorService administratorService) {
        this.administratorService = administratorService;
    }

    @RequestMapping(value = "/register", method=RequestMethod.GET)
    public String showCreateAdministratorForm(HttpServletRequest request, Model model) {
        model.addAttribute("user", new User());
        return "administrator/register";
    }

    @RequestMapping(value = "/register", method=RequestMethod.POST)
    public String submitAdministrator(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return "administrator/register";
        }

        Administrator administrator = this.administratorService.createAdministrator(user);
        this.administratorService.saveAdministrator(administrator);

        return "home";
    }
}
