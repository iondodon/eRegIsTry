package com.utm.controllers;

import com.utm.entities.Role;
import com.utm.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class UserController {

    @RequestMapping("/create-user")
    public String createUser() {

        SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml")
                .addAnnotatedClass(User.class)
                .buildSessionFactory();

        Session session = sessionFactory.getCurrentSession();


        session.beginTransaction();

        User user = new User();
        user.setFirstName("Ion");
        user.setSecondName("Dodon");
        user.setUsername("iondodon");
        user.setPassword("adasdasd");

        Role role = new Role();
        role.setRole("STUDENT");
        session.save(role);

        List<Role> roles = user.getRoles();
        roles.add(role);
        user.setRoles(roles);

        session.save(user);

        session.getTransaction().commit();

        session.close();


        return "create-user";
    }

}
