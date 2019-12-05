package com.utm.controllers;

import com.utm.entities.GenericResponse;
import com.utm.entities.User;
import com.utm.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;
import java.util.UUID;

@Controller
public class PasswordController {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    private SimpleMailMessage constructResetTokenEmail(String contextPath, Locale locale, String token, User user) {
        String url = contextPath + "/user/changePassword?id=" + user.getId() + "&token=" + token;
        String message = messages.getMessage("message.resetPassword", null, locale);
        return constructEmail("Reset Password", message + " \r\n" + url, user);
    }

    private SimpleMailMessage constructEmail(String subject, String body, User user) {
        SimpleMailMessage email = new SimpleMailMessage();
        email.setSubject(subject);
        email.setText(body);
        email.setTo(user.getEmail());
        email.setFrom(env.getProperty("support.email"));
        return email;
    }

    @RequestMapping(value = "/user/changePassword", method = RequestMethod.GET)
    public String showChangePasswordPage(Locale locale, Model model, @RequestParam("id") long id, @RequestParam("token") String token) {
        String result = securityService.validatePasswordResetToken(id, token);
        if (result != null) {
            model.addAttribute("message", messages.getMessage("auth.message." + result, null, locale));
            return "redirect:/login?lang=" + locale.getLanguage();
        }
        return "redirect:/updatePassword.html?lang=" + locale.getLanguage();
    }

    @RequestMapping(value = "/user/resetPassword", method = RequestMethod.POST)
    @ResponseBody
    public GenericResponse resetPassword(HttpServletRequest request, @RequestParam("email") String userEmail) throws Exception {
        User user = userService.findUserByEmail(userEmail);
        if (user == null) {
            throw new Exception("User with such email not found. ");
        }
        String token = UUID.randomUUID().toString();
        userService.createPasswordResetTokenForUser(user, token);
        mailSender.send(constructResetTokenEmail(getAppUrl(request), request.getLocale(), token, user));
        return new GenericResponse(messages.getMessage("message.resetPasswordEmail", null, request.getLocale()));
    }
}
