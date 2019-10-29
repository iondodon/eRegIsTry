package com.utm.services;

import com.utm.entities.Administrator;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AdministratorService {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService){
        this.userService = userService;
    }


    public Administrator createAdministrator() {


//        User user = this.userService.createUser(username, password, firstName, secondName, List< Role > roles);
//
//        Administrator administrator = new Administrator();
//        administrator.setUser(user);

        return new Administrator();
    }


    public void saveAdministrator(Administrator administrator) {
        SessionFactory sessionFactory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Administrator.class)
                .buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();

        try {
            session.beginTransaction();
            session.save(administrator);
            session.getTransaction().commit();
        }   catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }
}
