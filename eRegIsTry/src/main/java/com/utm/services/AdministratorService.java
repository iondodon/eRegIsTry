package com.utm.services;

import com.utm.entities.Administrator;

import com.utm.entities.Role;
import com.utm.entities.User;
import org.hibernate.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AdministratorService {
    private SessionService sessionService;
    private RoleService roleService;

    @Autowired
    public void setSessionService(SessionService sessionService){
        this.sessionService = sessionService;
    }

    @Autowired
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    public Administrator createAdministrator(User user) {
        Administrator administrator = new Administrator();

        Role administratorRole = this.roleService.getRoleByRoleName("ADMINISTRATOR");
        List<Role> roles = user.getRoles();
        roles.add(administratorRole);
        user.setRoles(roles);

        administrator.setUser(user);
        return administrator;
    }

    public void saveAdministrator(Administrator administrator) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();
            session.save(administrator.getUser());
            session.save(administrator);
            session.getTransaction().commit();
        }   catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public Administrator getAdministratorById(int id) {
        Session session = this.sessionService.getSession();
        Administrator administrator = null;

        try {
            session.beginTransaction();
            administrator = session.get(Administrator.class, id);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }

        return administrator;
    }

    public void updateAdministrator(Administrator formAdministrator) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            Administrator sessionAdministrator = session.get(Administrator.class, formAdministrator.getId());
            this.copyAdministratorFields(sessionAdministrator, formAdministrator);
            session.save(sessionAdministrator);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    private void copyAdministratorFields(Administrator sessionAdministrator, Administrator formAdministrator) {
        sessionAdministrator.setDepartment(formAdministrator.getDepartment());
    }
}
