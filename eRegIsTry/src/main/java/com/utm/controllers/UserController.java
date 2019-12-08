package com.utm.controllers;

import com.utm.dtos.PasswordDto;
import com.utm.entities.User;
import com.utm.services.MailService;
import com.utm.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.UUID;


@Controller
@RequestMapping("/user")
public class UserController {
    private UserService userService;
    private MailService mailService;

    @Autowired
    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
    public String showForgotPasswordPage() {
        return "/forgotPassword";
    }

    @RequestMapping(value = "/createResetPasswordToken", method = RequestMethod.POST)
    public String resetPassword(HttpServletRequest request, @RequestParam("email") String userEmail) throws Exception {
        User user = userService.findUserByEmail(userEmail);
        if (user == null) {
            throw new Exception("User with such email not found. ");
        }
        String token = UUID.randomUUID().toString();
        userService.createPasswordResetTokenForUser(user, token);
        JavaMailSender mailSender = mailService.getJavaMailSender();
        mailSender.send(mailService.constructResetPasswordTokenEmail(request.getContextPath(), token, user));
        return "redirect:/";
    }

    @RequestMapping(value = "/checkForgotPasswordToken", method = RequestMethod.GET)
    public String checkForgotPasswordToken(Model model, @RequestParam("id") long id, @RequestParam("token") String token) {
        String result = userService.validatePasswordResetToken(id, token);
        if (result != null) {
            return "redirect:/showLoginPage";
        }

        model.addAttribute("passwordDto", new PasswordDto());
        return "/updatePassword";
    }

    @RequestMapping(value = "/checkActivateAccountToken", method = RequestMethod.GET)
    public String checkActivateAccountToken(Model model, @RequestParam("id") long id, @RequestParam("token") String token) {
        String result = userService.validateActivateAccountToken(id, token);
        if (result != null) {
            return "redirect:/showLoginPage";
        }

        userService.activateAccount((int)id);

        return "/accountActivated";
    }

    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    public ModelAndView updatePassword(@Valid @ModelAttribute("passwordDto") PasswordDto passwordDto, BindingResult bindingResult) {

        if(!passwordDto.getPassword().equals(passwordDto.getMatchPassword())) {
            bindingResult.rejectValue("password", "password", "Passwords don't match.");
        }

        if(bindingResult.hasErrors()){
            ModelMap model = new ModelMap();
            model.addAttribute("passwordDto", passwordDto);
            return new ModelAndView("/updatePassword", model);
        }

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        userService.changeUserPassword(user, new BCryptPasswordEncoder().encode(passwordDto.getPassword()));

        return new ModelAndView("redirect:/");
    }
}
