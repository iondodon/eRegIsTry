package com.utm.services;

import com.utm.entities.Group;
import com.utm.entities.Schedule;
import com.utm.entities.Subject;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ScheduleService {
    private SessionService sessionService;
    private SubjectService subjectService;
    private GroupService groupService;

    @Autowired
    public void setGroupService(GroupService groupService) {
        this.groupService = groupService;
    }

    @Autowired
    public void setSubjectService(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    @Autowired
    public void setSessionService(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    public void createSchedule(Schedule formSchedule) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            Subject sessionSubject = session.get(Subject.class, formSchedule.getSubject().getId());
            formSchedule.setSubject(sessionSubject);
            Group sessionGroup = session.get(Group.class, formSchedule.getGroup().getId());
            formSchedule.setGroup(sessionGroup);

            session.save(formSchedule);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public Schedule getScheduleById(int id) {
        Session session = this.sessionService.getSession();
        Schedule schedule = null;

        try {
            session.beginTransaction();
            schedule = session.get(Schedule.class, id);
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println(e);
        } finally {
            session.close();
        }

        return schedule;
    }

    public List getAllScheduleRecords() {
        Session session = this.sessionService.getSession();
        List scheduleRecords = null;

        try {
            session.beginTransaction();
            scheduleRecords = session.createQuery("from Schedule").list();
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println(e);
        } finally {
            session.close();
        }

        return scheduleRecords;
    }

    public void updateSchedule(Schedule formSchedule) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            Schedule sessionSchedule = session.get(Schedule.class, formSchedule.getId());

            sessionSchedule.setDay(formSchedule.getDay());
            sessionSchedule.setTime(formSchedule.getTime());

            Group sessionGroup = session.get(Group.class, formSchedule.getGroup().getId());
            sessionSchedule.setGroup(sessionGroup);
            Subject sessionSubject = session.get(Subject.class, formSchedule.getSubject().getId());
            sessionSchedule.setSubject(sessionSubject);

            session.save(sessionSchedule);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public void deleteSchedule(Schedule schedule) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            Schedule sessionSchedule = session.get(Schedule.class, schedule.getId());
            session.delete(sessionSchedule);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }
}
