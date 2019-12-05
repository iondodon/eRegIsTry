package com.utm.services;

import com.utm.entities.*;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;


@Component
public class UserService {
    private SessionService sessionService;
    private PasswordResetTokenService passwordResetTokenService;

    @Autowired
    public void setSessionService(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    @Autowired
    public void setPasswordResetTokenService(PasswordResetTokenService passwordResetTokenService) {
        this.passwordResetTokenService = passwordResetTokenService;
    }

    public void createPasswordResetTokenForUser(User user, String token) {
        PasswordResetToken myToken = new PasswordResetToken(token, user);
        passwordResetTokenService.save(myToken);
    }

    public User findUserByEmail(String email) {
        Session session = this.sessionService.getSession();
        User user = null;

        try {
            session.beginTransaction();

            user = (User) session
                    .createQuery("from User u where u.email = :email")
                    .setParameter("email", email)
                    .uniqueResult();

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }

        return user;
    }

    public User getUserByUsername(String username) {
        Session session = this.sessionService.getSession();
        User user = null;

        try {
            session.beginTransaction();

            user = (User) session
                    .createQuery("from User u where u.username = :username")
                    .setParameter("username", username)
                    .uniqueResult();

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }

        return user;
    }

    public void updateUser(User formUser) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            User sessionUser = session.get(User.class, formUser.getId());
            this.copyFields(sessionUser, formUser);
            session.update(sessionUser);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public void deleteAdministratorUser(User user) {
        Session session = this.sessionService.getSession();
        try {
            session.beginTransaction();

            User sessionUser = session.get(User.class, user.getId());
            Administrator administrator = session.get(Administrator.class, sessionUser.getAdministrator().getId());
            session.delete(administrator);
            session.delete(sessionUser);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public void deleteTeacherUser(User user) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            User sessionUser = session.get(User.class, user.getId());
            Teacher teacher = session.get(Teacher.class, sessionUser.getTeacher().getId());
            session.delete(teacher);
            session.delete(sessionUser);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public void deleteStudentUser(User user) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            User sessionUser = session.get(User.class, user.getId());
            Student student = session.get(Student.class, sessionUser.getStudent().getId());
            session.delete(student);
            session.delete(sessionUser);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    private void copyFields(User sessionUser, User formUser) {
        sessionUser.setUsername(formUser.getUsername());
        sessionUser.setFirstName(formUser.getFirstName());
        sessionUser.setLastName(formUser.getLastName());
    }
}
