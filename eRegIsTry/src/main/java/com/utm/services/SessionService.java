package com.utm.services;

import com.utm.entities.*;
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
                .addAnnotatedClass(PasswordResetToken.class)
                .addAnnotatedClass(Group.class)
                .addAnnotatedClass(Lesson.class)
                .addAnnotatedClass(Registry.class)
                .addAnnotatedClass(Schedule.class)
                .addAnnotatedClass(Student.class)
                .addAnnotatedClass(Subject.class)
                .addAnnotatedClass(Teacher.class)
                .addAnnotatedClass(User.class)
                .addAnnotatedClass(Role.class)
                .buildSessionFactory();
    }

    Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }
}
