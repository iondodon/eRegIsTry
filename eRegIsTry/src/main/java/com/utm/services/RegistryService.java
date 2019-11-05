package com.utm.services;

import com.utm.entities.Lesson;
import com.utm.entities.Registry;
import com.utm.entities.Student;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class RegistryService {
    private SessionService sessionService;

    @Autowired
    public void setSessionService(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    public void createRegistry(Registry formRegistry) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            session.save(formRegistry);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public Registry getRegistryById(int id) {
        Session session = this.sessionService.getSession();
        Registry registry = null;

        try {
            session.beginTransaction();
            registry = session.get(Registry.class, id);
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println(e);
        } finally {
            session.close();
        }

        return registry;
    }

    public List getAllRegistries() {
        Session session = this.sessionService.getSession();
        List registries = null;

        try {
            session.beginTransaction();
            registries = session.createQuery("from Registry").list();
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println(e);
        } finally {
            session.close();
        }

        return registries;
    }

    public void updateRegistry(Registry formRegistry) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            Registry sessionRegistry = session.get(Registry.class, formRegistry.getId());

            sessionRegistry.setMark(formRegistry.getMark());
            sessionRegistry.setAbsent(formRegistry.isAbsent());

            Lesson sessionLesson = session.get(Lesson.class, formRegistry.getLesson().getId());
            Student sessionStudent = session.get(Student.class, formRegistry.getStudent().getId());

            sessionRegistry.setLesson(sessionLesson);
            sessionRegistry.setStudent(sessionStudent);

            session.save(sessionRegistry);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public void deleteRegistry(Registry registry) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            Registry sessionRegistry = session.get(Registry.class, registry.getId());
            session.delete(sessionRegistry);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }
}
