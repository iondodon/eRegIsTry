package com.utm.services;

import com.utm.entities.Administrator;
import com.utm.entities.User;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class UserService {
    private SessionService sessionService;

    @Autowired
    public void setSessionService(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    public void updateUser(User formUser) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            User sessionUser = session.get(User.class, formUser.getId());
            this.copyFields(sessionUser, formUser);
            session.update(sessionUser);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public void deleteUser(User user) {
        Session session = this.sessionService.getSession();
        try {
            session.beginTransaction();

            User sessionUser = session.get(User.class, user.getId());
            Administrator administrator = session.get(Administrator.class, sessionUser.getAdministrator().getId());
            session.delete(administrator);
            session.delete(sessionUser);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    private void copyFields(User sessionUser, User formUser) {
        sessionUser.setUsername(formUser.getUsername());
        sessionUser.setFirstName(formUser.getFirstName());
        sessionUser.setLastName(formUser.getLastName());
    }
}
