package com.utm.controllers;

import com.utm.entities.Administrator;
import com.utm.entities.User;
import com.utm.services.AdministratorService;
import com.utm.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class UserController {
    private AdministratorService administratorService;
    private UserService userService;

    @Autowired
    public void setAdministratorService(AdministratorService administratorService) {
        this.administratorService = administratorService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/administrator/update-user-data", method = RequestMethod.GET)
    public String showUpdateUserForm(HttpServletRequest request, Model model) {
        int administratorId = Integer.parseInt(request.getParameter("administratorId"));
        Administrator administrator = this.administratorService.getAdministratorById(administratorId);

        model.addAttribute("user", administrator.getUser());

        return "administrator/update-user-data";
    }

    @RequestMapping(value = "/administrator/update-user-data", method = RequestMethod.POST)
    public String updateUser(@Valid @ModelAttribute("user") User user, BindingResult resultUser) {
        if(resultUser.hasErrors()) {
            return "administrator/update-user-data";
        }

        this.userService.updateUser(user);

        return "home";
    }
}
