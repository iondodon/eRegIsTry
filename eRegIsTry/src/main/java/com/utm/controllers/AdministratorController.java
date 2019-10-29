package com.utm.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.utm.services.AdministratorService;
import javax.servlet.http.HttpServletRequest;

@Controller
public class AdministratorController {
    private AdministratorService administratorService;

    @Autowired
    public void setAdministratorService(AdministratorService administratorService) {
        this.administratorService = administratorService;
    }

    @RequestMapping("register-administrator")
    public String createAdministrator(HttpServletRequest request, Model model) {

        System.out.println(request.getParameter("submitBtn"));

        return "register-administrator";
    }

}
