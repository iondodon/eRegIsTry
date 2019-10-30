package com.utm.services;

import com.utm.entities.Administrator;
import com.utm.entities.Role;
import com.utm.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Component;

@Component
class SessionService {
    private SessionFactory sessionFactory;

    SessionService(){
        this.sessionFactory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Administrator.class)
                .addAnnotatedClass(User.class)
                .addAnnotatedClass(Role.class)
                .buildSessionFactory();
    }

    Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }
}
