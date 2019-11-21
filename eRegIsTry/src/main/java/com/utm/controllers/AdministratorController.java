package com.utm.controllers;

import com.utm.editors.AdministratorEditor;
import com.utm.entities.Administrator;
import com.utm.entities.User;
import com.utm.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.utm.services.AdministratorService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

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
    public String showCreateAdministratorForm(Model model) {
        model.addAttribute("user", new User());
        return "administrator/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String submitAdministrator(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
        if(!user.getPassword().equals(user.getPasswordConfirmation())) {
            bindingResult.rejectValue("passwordConfirmation", "password", "Passwords don't match.");
        }

        if(bindingResult.hasErrors()){
            return "administrator/register";
        }

        Administrator administrator = this.administratorService.createAdministrator(user);
        this.administratorService.saveAdministrator(administrator);

        return "redirect:/";
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

        return "redirect:/";
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

        this.userService.deleteAdministratorUser(user);

        return "redirect:/";
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String showAdministrator(HttpServletRequest request, Model model) {
        int administratorId = Integer.parseInt(request.getParameter("administratorId"));
        Administrator administrator = this.administratorService.getAdministratorById(administratorId);

        model.addAttribute("administrator", administrator);

        return "administrator/show";
    }

    @RequestMapping(value = "/update-user-data", method = RequestMethod.GET)
    public String showUpdateUserForm(HttpServletRequest request, Model model) {
        int administratorId = Integer.parseInt(request.getParameter("administratorId"));
        Administrator administrator = this.administratorService.getAdministratorById(administratorId);

        model.addAttribute("user", administrator.getUser());

        return "administrator/update-user-data";
    }

    @RequestMapping(value = "/update-user-data", method = RequestMethod.POST)
    public ModelAndView updateUser(@Valid @ModelAttribute("user") User user, BindingResult resultUser) {
        if(resultUser.hasErrors()) {
            ModelMap model = new ModelMap();
            model.addAttribute("user", user);
            return new ModelAndView("administrator/update-user-data", model);
        }

        this.userService.updateUser(user);

        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listAdministrators(HttpServletRequest request, Model model) {

        List administrators = this.administratorService.getAllAdministrators();

        model.addAttribute("administrators", administrators);

        return "administrator/list";
    }
}
