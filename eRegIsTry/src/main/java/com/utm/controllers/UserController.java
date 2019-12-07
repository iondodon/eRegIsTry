package com.utm.controllers;

import com.utm.dtos.PasswordDto;
import com.utm.entities.User;
import com.utm.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
import java.util.Properties;
import java.util.UUID;


@Controller
@RequestMapping("/user")
public class UserController {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername("iondodon2@gmail.com");
        mailSender.setPassword("Eronat98.");

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        return mailSender;
    }

    private SimpleMailMessage constructResetTokenEmail(String contextPath, String token, User user) {
        String url = "http://localhost:8080" + "/user/checkToken?id=" + user.getId() + "&token=" + token;
        System.out.println(url);
        return constructEmail("Reset Password", url, user);
    }

    private SimpleMailMessage constructEmail(String subject, String body, User user) {
        SimpleMailMessage email = new SimpleMailMessage();
        email.setSubject(subject);
        email.setText(body);
        email.setTo(user.getEmail());
        email.setFrom("eregistry@gmail.com");
        return email;
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
        JavaMailSender mailSender = getJavaMailSender();
        mailSender.send(constructResetTokenEmail(request.getContextPath(), token, user));
        return "redirect:/";
    }

    @RequestMapping(value = "/checkToken", method = RequestMethod.GET)
    public String showChangePasswordPage(Model model, @RequestParam("id") long id, @RequestParam("token") String token) {
        String result = userService.validatePasswordResetToken(id, token);
        if (result != null) {
            return "redirect:/showLoginPage";
        }

        model.addAttribute("passwordDto", new PasswordDto());
        return "/updatePassword";
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
