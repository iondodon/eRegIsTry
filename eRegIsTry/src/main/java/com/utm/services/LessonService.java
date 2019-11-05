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

    public List getAllLessons() {
        Session session = this.sessionService.getSession();
        List lessons = null;

        try {
            session.beginTransaction();
            lessons = session.createQuery("from Lesson").list();
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

    public void updateLesson(Lesson formLesson) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            Lesson sessionLesson = session.get(Lesson.class, formLesson.getId());
            Subject sessionSubject = session.get(Subject.class, formLesson.getSubject().getId());
            Teacher sessionTeacher = session.get(Teacher.class, formLesson.getTeacher().getId());

            sessionLesson.setSubject(sessionSubject);
            sessionLesson.setTeacher(sessionTeacher);

            session.save(sessionLesson);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public void deleteLesson(Lesson lesson) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            Lesson sessionLesson = session.get(Lesson.class, lesson.getId());
            session.delete(sessionLesson);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }
}
