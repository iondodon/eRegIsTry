package com.utm.services;

import com.utm.entities.Role;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.criteria.CriteriaBuilder;

@Component
public class RoleService {
    private SessionService sessionService;

    @Autowired
    public void setSessionService(SessionService sessionService){
        this.sessionService = sessionService;
    }

    Role getRoleByRoleName(String roleName) {
        Session session = this.sessionService.getSession();
        Role role = null;

        try {
            session.beginTransaction();

            role = (Role) session
                    .createQuery("from Role r where r.role = :roleName")
                    .setParameter("roleName", roleName)
                    .uniqueResult();

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }

        return role;
    }
}
