package com.utm.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private CustomAuthenticationProvider authProvider;

    @Autowired
    private void setAuthProvider(CustomAuthenticationProvider authProvider) {
        this.authProvider = authProvider;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authProvider);
    }

    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected  void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/home").hasRole("USER")
                .antMatchers("/my-account").hasRole("USER")

                .antMatchers("/administrator/delete**").hasRole("ADMINISTRATOR")
                .antMatchers("/administrator/register").permitAll()
                .antMatchers("/administrator/update**").hasRole("ADMINISTRATOR")
                .antMatchers("/administrator/list").hasRole("ADMINISTRATOR")
                .antMatchers("/administrator/show**").hasRole("ADMINISTRATOR")
                .antMatchers("/administrator/update-user-data**").hasRole("ADMINISTRATOR")

                .antMatchers("/student/create").hasRole("ADMINISTRATOR")
                .antMatchers("/student/delete**").hasRole("ADMINISTRATOR")
                .antMatchers("/student/list").hasRole("USER")
                .antMatchers("/student/show**").hasAnyRole("ADMINISTRATOR", "TEACHER")
                .antMatchers("/student/update**").hasRole("ADMINISTRATOR")
                .antMatchers("/student/update-user-data**").hasRole("ADMINISTRATOR")

                .antMatchers("/teacher/create").hasRole("ADMINISTRATOR")
                .antMatchers("/teacher/delete**").hasRole("ADMINISTRATOR")
                .antMatchers("/teacher/list").hasRole("USER")
                .antMatchers("/teacher/show**").hasRole("ADMINISTRATOR")
                .antMatchers("/teacher/update**").hasRole("ADMINISTRATOR")
                .antMatchers("/teacher/update-user-data**").hasRole("ADMINISTRATOR")

                .antMatchers("/group/create").hasRole("ADMINISTRATOR")
                .antMatchers("/group/delete**").hasRole("ADMINISTRATOR")
                .antMatchers("/group/list").hasRole("USER")
                .antMatchers("/group/show").hasRole("USER")
                .antMatchers("/group/update**").hasRole("ADMINISTRATOR")

                .antMatchers("/lesson/create").hasRole("TEACHER")
                .antMatchers("/lesson/delete**").hasAnyRole( "TEACHER")
                .antMatchers("/lesson/list").hasRole("USER")
                .antMatchers("/lesson/show**").hasRole("USER")
                .antMatchers("/lesson/update**").hasRole("TEACHER")

                .antMatchers("/registry/create").hasRole("TEACHER")
                .antMatchers("/registry/delete**").hasRole("TEACHER")
                .antMatchers("/registry/list").hasAnyRole("ADMINISTRATOR", "TEACHER")
                .antMatchers("/registry/show**").hasAnyRole("ADMINISTRATOR", "TEACHER")
                .antMatchers("/registry/update**").hasRole("TEACHER")

                .antMatchers("/schedule/create").hasRole("ADMINISTRATOR")
                .antMatchers("/schedule/delete**").hasRole("ADMINISTRATOR")
                .antMatchers("/schedule/list").hasAnyRole("USER")
                .antMatchers("/schedule/show**").hasAnyRole("USER")
                .antMatchers("/schedule/update**").hasRole("ADMINISTRATOR")

                .antMatchers("/subject/create").hasRole("ADMINISTRATOR")
                .antMatchers("/subject/delete**").hasRole("ADMINISTRATOR")
                .antMatchers("/subject/list").hasAnyRole("USER")
                .antMatchers("/subject/show**").hasAnyRole("USER")
                .antMatchers("/subject/update**").hasRole("ADMINISTRATOR")

                .antMatchers("/user/updatePassword**").hasAuthority("CHANGE_PASSWORD_PRIVILEGE")

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
