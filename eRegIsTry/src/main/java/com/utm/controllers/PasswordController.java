package com.utm.controllers;

import com.utm.entities.User;
import com.utm.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Properties;
import java.util.UUID;

@Controller
public class PasswordController {
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

    @RequestMapping(value = "/user/changePassword", method = RequestMethod.GET)
    public String showChangePasswordPage(Model model, @RequestParam("id") long id, @RequestParam("token") String token) {
        String result = userService.validatePasswordResetToken(id, token);
        if (result != null) {
            model.addAttribute("message", "authenticate");
            return "redirect:/login";
        }
        return "redirect:/updatePassword";
    }

    private SimpleMailMessage constructResetTokenEmail(String contextPath, String token, User user) {
        String url = contextPath + "/user/changePassword?id=" + user.getId() + "&token=" + token;
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

    @RequestMapping(value = "/user/resetPassword", method = RequestMethod.POST)
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

    @RequestMapping(value = "/user/forgotPassword", method = RequestMethod.GET)
    public String showForgotPasswordPage() {
        return "/forgotPassword";
    }
}
