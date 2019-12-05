package com.utm.services;

import com.utm.entities.PasswordResetToken;
import com.utm.entities.User;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.Calendar;

@Component
public class PasswordResetTokenService {
    private SessionService sessionService;

    @Autowired
    public void setSessionService(SessionService sessionService){
        this.sessionService = sessionService;
    }

    public void save(PasswordResetToken token) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();
            session.save(token);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public PasswordResetToken findByToken(String token) {
        Session session = this.sessionService.getSession();
        PasswordResetToken passwordResetToken = null;

        try {
            session.beginTransaction();

            passwordResetToken = (PasswordResetToken) session
                    .createQuery("from PasswordResetToken prs where prs.token=:token")
                    .setParameter("token", token);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }

        return passwordResetToken;
    }

    public String validatePasswordResetToken(long id, String token) {
        PasswordResetToken passToken = findByToken(token);
        if ((passToken == null) || (passToken.getUser()
                .getId() != id)) {
            return "invalidToken";
        }

        Calendar cal = Calendar.getInstance();
        if ((passToken.getExpiryDate()
                .getTime() - cal.getTime()
                .getTime()) <= 0) {
            return "expired";
        }

        User user = passToken.getUser();
        Authentication auth = new UsernamePasswordAuthenticationToken(
                user, null, Arrays.asList(
                new SimpleGrantedAuthority("CHANGE_PASSWORD_PRIVILEGE"))
        );
        SecurityContextHolder.getContext().setAuthentication(auth);
        return null;
    }
}
