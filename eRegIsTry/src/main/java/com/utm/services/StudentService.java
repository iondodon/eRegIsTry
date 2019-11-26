package com.utm.services;

import com.utm.entities.Group;
import com.utm.entities.Role;
import com.utm.entities.Student;
import com.utm.entities.User;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class StudentService {
    private SessionService sessionService;
    private RoleService roleService;
    private GroupService groupService;

    @Autowired
    public void setSessionService(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    @Autowired
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    @Autowired
    public void setGroupService(GroupService groupService) {
        this.groupService = groupService;
    }

    public List getAllStudents() {
        Session session = this.sessionService.getSession();
        List students = null;

        try {
            session.beginTransaction();
            students = session.createQuery("from Student").list();
            session.getTransaction().commit();
        } catch (Exception e){
            System.out.println(e);
        } finally {
            session.close();
        }

        return students;
    }

    public Student createStudent(User user) {
        Student student = new Student();

        Role studentRole = this.roleService.getRoleByRoleName("ROLE_STUDENT");
        Role userRole = this.roleService.getRoleByRoleName("ROLE_USER");
        List<Role> roles = user.getRoles();
        roles.add(studentRole);
        roles.add(userRole);
        user.setRoles(roles);

        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));

        Group group = this.groupService.getGroupById(user.getStudent().getGroup().getId());
        student.setGroup(group);

        student.setUser(user);
        return student;
    }

    public void saveStudent(Student student) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();
            session.save(student.getUser());
            session.save(student);
            session.getTransaction().commit();
        }   catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public Student getStudentById(int id) {
        Session session = this.sessionService.getSession();
        Student student = null;

        try {
            session.beginTransaction();
            student = session.get(Student.class, id);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }

        return student;
    }

    public void updateStudent(Student formStudent) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            Student sessionStudent = session.get(Student.class, formStudent.getId());
            Group group = session.get(Group.class, formStudent.getGroup().getId());
            sessionStudent.setGroup(group);
            session.save(sessionStudent);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }
}
