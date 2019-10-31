package com.utm.services;

import com.utm.entities.Subject;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SubjectService {
    private SessionService sessionService;

    @Autowired
    public void setSessionService(SessionService sessionService){
        this.sessionService = sessionService;
    }

    public List getAllSubjects() {
        Session session = this.sessionService.getSession();
        List subjects = null;

        try {
            session.beginTransaction();
            subjects = session.createQuery("from Subject").list();
            System.out.println(subjects);
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println(e);
        } finally {
            session.close();
        }

        return subjects;
    }

    public Subject getSubjectById(int id) {
        Session session = this.sessionService.getSession();
        Subject subject = null;

        try {
            session.beginTransaction();
            subject = session.get(Subject.class, id);
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println(e);
        } finally {
            session.close();
        }

        return subject;
    }
}
