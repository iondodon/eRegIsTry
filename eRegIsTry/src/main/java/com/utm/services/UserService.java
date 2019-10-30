package com.utm.services;

import com.utm.entities.Role;
import com.utm.entities.User;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UserService {

    public User createUser(String username, String password, String firstName, String lastName, List<Role> roles) {
        User user = new User();

        user.setUsername(username);
        user.setPassword(password);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setRoles(roles);

        return user;
    }

}
