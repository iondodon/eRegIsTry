package com.utm.services;

import com.utm.entities.*;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.Calendar;


@Component
public class UserService {
    private SessionService sessionService;

    @Autowired
    public void setSessionService(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    public void createPasswordResetTokenForUser(User user, String token) {
        PasswordResetToken myToken = new PasswordResetToken(token, user);
        savePasswordResetToken(myToken);
    }

    public void createActivateAccountTokenForUser(User user, String token) {
        ActivateAccountToken myToken = new ActivateAccountToken(token, user);
        saveActivateAccountToken(myToken);
    }

    public void changeUserPassword(User user, String newPassword) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            User sessionUser = session.get(User.class, user.getId());
            sessionUser.setPassword(newPassword);
            session.save(sessionUser);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public void activateAccount(int id) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();

            User sessionUser = session.get(User.class, id);
            sessionUser.setActive(true);
            session.save(sessionUser);

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public void saveActivateAccountToken(ActivateAccountToken token) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();
            session.save(token);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public void savePasswordResetToken(PasswordResetToken token) {
        Session session = this.sessionService.getSession();

        try {
            session.beginTransaction();
            session.save(token);
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }
    }

    public PasswordResetToken findByPasswordResetToken(String token) {
        Session session = this.sessionService.getSession();
        PasswordResetToken passwordResetToken = null;

        try {
            session.beginTransaction();

            passwordResetToken = (PasswordResetToken) session
                    .createQuery("from PasswordResetToken prs where prs.token=:token")
                    .setParameter("token", token)
                    .uniqueResult();

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }

        return passwordResetToken;
    }

    public ActivateAccountToken findByActivateAccountToken(String token) {
        Session session = this.sessionService.getSession();
        ActivateAccountToken activateAccountToken = null;

        try {
            session.beginTransaction();

            activateAccountToken = (ActivateAccountToken) session
                    .createQuery("from ActivateAccountToken aat where aat.token=:token")
                    .setParameter("token", token)
                    .uniqueResult();

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            session.close();
        }

        return activateAccountToken;
    }

    public String validatePasswordResetToken(long id, String token) {
        PasswordResetToken passToken = findByPasswordResetToken(token);
        if ((passToken == null) || (passToken.getUser().getId() != id)) {
            return "invalidToken";
        }

        Calendar cal = Calendar.getInstance();
        if ((passToken.getExpiryDate().getTime() - cal.getTime().getTime()) <= 0) {
            return "expired";
        }

        User user = passToken.getUser();
        Authentication auth = new UsernamePasswordAuthenticationToken(
                user, null, Arrays.asList(new SimpleGrantedAuthority("CHANGE_PASSWORD_PRIVILEGE"))
        );
        SecurityContextHolder.getContext().setAuthentication(auth);
        return null;
    }

    public String validateActivateAccountToken(long id, String token) {
        ActivateAccountToken activateAccountToken = findByActivateAccountToken(token);
        if ((activateAccountToken == null) || (activateAccountToken.getUser().getId() != id)) {
            return "invalidToken";
        }

        Calendar cal = Calendar.getInstance();
        if ((activateAccountToken.getExpiryDate().getTime() - cal.getTime().getTime()) <= 0) {
            return "expired";
        }

        return null;
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
