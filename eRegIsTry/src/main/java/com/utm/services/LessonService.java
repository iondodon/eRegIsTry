package com.utm.services;

import com.utm.entities.Lesson;
import com.utm.entities.Subject;
import com.utm.entities.Teacher;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class LessonService {
    private SessionService sessionService;

    @Autowired
    public void setSessionService(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    public List getAllPastLessons() {
        Session session = this.sessionService.getSession();
        List lessons = null;

        try {
            session.beginTransaction();
            lessons = session.createQuery("from Lesson where datetime <= current_date ").list();
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println(e);
        } finally {
            session.close();
        }

        return lessons;
    }

    public Lesson getLessonById(int id) {
        Session session = this.sessionService.getSession();
        Lesson lesson = null;

        try {
            session.beginTransaction();
            lesson = session.get(Lesson.class, id);
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println(e);
        } finally {
            session.close();
        }

        return lesson;
    }

    public void createLesson(Lesson lesson) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            Subject sessionSubject = session.get(Subject.class, lesson.getSubject().getId());
            Teacher sessionTeacher = session.get(Teacher.class, lesson.getTeacher().getId());

            lesson.setSubject(sessionSubject);
            lesson.setTeacher(sessionTeacher);

            session.save(lesson);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }
}
