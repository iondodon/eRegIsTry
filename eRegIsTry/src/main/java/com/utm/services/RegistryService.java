package com.utm.services;

import com.utm.entities.Registry;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
}
