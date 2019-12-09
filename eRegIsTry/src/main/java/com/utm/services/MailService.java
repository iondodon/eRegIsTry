package com.utm.services;

import com.utm.entities.User;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;

import java.util.Properties;

@Component
public class MailService {
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername("eregistry.utm@gmail.com");
        mailSender.setPassword("eronat98");

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        return mailSender;
    }

    public SimpleMailMessage constructResetPasswordTokenEmail(String contextPath, String token, User user) {
        String url = "http://localhost:8080" + "/user/checkForgotPasswordToken?id=" + user.getId() + "&token=" + token;
        System.out.println(url);
        return constructEmail("Reset Password", url, user);
    }

    public SimpleMailMessage constructActivateAccountTokenEmail(String token, User user) {
        String url = "http://localhost:8080" + "/user/checkActivateAccountToken?id=" + user.getId() + "&token=" + token;
        System.out.println(url);
        return constructEmail("Account activation", url, user);
    }

    private SimpleMailMessage constructEmail(String subject, String body, User user) {
        SimpleMailMessage email = new SimpleMailMessage();
        email.setSubject(subject);
        email.setText(body);
        email.setTo(user.getEmail());
        email.setFrom("eregistry.utm@gmail.com");
        return email;
    }
}
