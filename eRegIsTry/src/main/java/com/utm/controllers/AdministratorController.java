package com.utm.controllers;

import com.utm.editors.AdministratorEditor;
import com.utm.entities.Administrator;
import com.utm.entities.User;
import com.utm.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
    private AdministratorEditor administratorEditor;
    private UserService userService;

    @Autowired
    public void setAdministratorService(AdministratorService administratorService) {
        this.administratorService = administratorService;
    }

    @Autowired
    public void setAdministratorEditor(AdministratorEditor administratorEditor) {
        this.administratorEditor = administratorEditor;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Administrator.class, this.administratorEditor);
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String showCreateForm(Model model) {
        model.addAttribute("user", new User());
        return "administrator/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String submit(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return "administrator/register";
        }

        Administrator administrator = this.administratorService.createAdministrator(user);
        this.administratorService.saveAdministrator(administrator);

        return "home";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String showUpdateAdministratorForm(HttpServletRequest request, Model model) {
        int administratorId = Integer.parseInt(request.getParameter("administratorId"));
        Administrator administrator = this.administratorService.getAdministratorById(administratorId);

        model.addAttribute("administrator", administrator);

        return "administrator/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateAdministrator(@Valid @ModelAttribute("administrator") Administrator administrator, BindingResult resultAdministrator) {
        if(resultAdministrator.hasErrors()) {
            return "administrator/update";
        }

        this.administratorService.updateAdministrator(administrator);

        return "home";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String showDeleteAdministratorForm(HttpServletRequest request, Model model) {
        int administratorId = Integer.parseInt(request.getParameter("administratorId"));
        Administrator administrator = this.administratorService.getAdministratorById(administratorId);

        model.addAttribute("user", administrator.getUser());

        return "administrator/delete";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteAdministrator(@ModelAttribute("user") User user, BindingResult resultUser) {
        if(resultUser.hasErrors()) {
            return "administrator/delete";
        }

        this.userService.deleteUser(user);

        return "home";
    }
}
