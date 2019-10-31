package com.utm.services;

import com.utm.entities.Group;
import com.utm.entities.Subject;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class GroupService {
    private SessionService sessionService;

    @Autowired
    public void setSessionService(SessionService sessionService){
        this.sessionService = sessionService;
    }

    public List getAllGroups() {
        Session session = this.sessionService.getSession();
        List groups = null;

        try {
            session.beginTransaction();
            groups = session.createQuery("from Group").list();
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println(e);
        } finally {
            session.close();
        }

        return groups;
    }

    public Group getGroupById(int id) {
        Session session = this.sessionService.getSession();
        Group group = null;

        try {
            session.beginTransaction();
            group = session.get(Group.class, id);
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println(e);
        } finally {
            session.close();
        }

        return group;
    }
}
