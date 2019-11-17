package com.utm.security.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        User.UserBuilder users = User.withDefaultPasswordEncoder();

        auth.inMemoryAuthentication()
                .withUser(users.username("john").password("test123").roles("USER", "STUDENT"))
                .withUser(users.username("ana").password("test123").roles("USER", "TEACHER"))
                .withUser(users.username("maria").password("test123").roles("USER", "ADMINISTRATOR"));
    }

    @Override
    protected  void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/").hasRole("USER")
                .antMatchers("/home").hasRole("USER")
                .antMatchers("/my-account").hasRole("USER")
                .antMatchers("/administrator/delete**").hasRole("ADMINISTRATOR")
                .antMatchers("/administrator/register").hasRole("ADMINISTRATOR")
                .antMatchers("/administrator/update**").hasRole("ADMINISTRATOR")
                .antMatchers("/administrator/update-user-data**").hasRole("ADMINISTRATOR")

            .and()
            .formLogin()
                .loginPage("/showLoginPage")
                .loginProcessingUrl("/authenticateTheUser")
                .permitAll()
            .and()
            .logout().permitAll()
                .and().exceptionHandling().accessDeniedPage("/access-denied");
    }
}
