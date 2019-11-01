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

    public void createSubject(Subject subject) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();
            session.save(subject);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public void updateSubject(Subject formSubject) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            Subject sessionSubject = session.get(Subject.class, formSubject.getId());
            sessionSubject.setSubject(formSubject.getSubject());
            session.save(sessionSubject);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }
}
