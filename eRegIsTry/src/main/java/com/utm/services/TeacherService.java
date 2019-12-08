package com.utm.services;

import com.utm.entities.Role;
import com.utm.entities.Teacher;
import com.utm.entities.User;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class TeacherService {
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

    public List getAllTeachers() {
        Session session = this.sessionService.getSession();
        List teachers = null;

        try {
            session.beginTransaction();
            teachers = session.createQuery("from Teacher").list();
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println(e);
        } finally {
            session.close();
        }

        return teachers;
    }

    public Teacher createTeacher(User user) {
        Teacher teacher = new Teacher();

        Role teacherRole = this.roleService.getRoleByRoleName("ROLE_TEACHER");
        Role userRole = this.roleService.getRoleByRoleName("ROLE_USER");
        List<Role> roles = user.getRoles();
        roles.add(teacherRole);
        roles.add(userRole);
        user.setRoles(roles);

        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        user.setActive(false);

        teacher.setUser(user);
        return teacher;
    }

    public void saveTeacher(Teacher teacher) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();
            session.save(teacher.getUser());
            session.save(teacher);
            session.getTransaction().commit();
        }   catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public Teacher getTeacherById(int id) {
        Session session = this.sessionService.getSession();
        Teacher teacher = null;

        try {
            session.beginTransaction();
            teacher = session.get(Teacher.class, id);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }

        return teacher;
    }

    public void updateTeacher(Teacher formTeacher) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            Teacher sessionTeacher = session.get(Teacher.class, formTeacher.getId());
            this.copyTeacherFields(sessionTeacher, formTeacher);
            session.save(sessionTeacher);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    private void copyTeacherFields(Teacher sessionTeacher, Teacher formTeacher) {
        sessionTeacher.setBaseSubject(formTeacher.getBaseSubject());
    }
}
