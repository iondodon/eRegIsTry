package com.utm.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name="activate_account_token")
public class ActivateAccountToken implements Serializable {
    private static final long serialVersionUID = 1L;
    private static final int EXPIRATION = 24*60*60*1000; // one day

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id;

    private String token;

    @OneToOne(targetEntity = User.class, fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name = "user_id")
    private User user;

    private Date expiryDate;

    public ActivateAccountToken() {
        expiryDate = new Date(new Date().getTime() + EXPIRATION);
    }

    public ActivateAccountToken(String token, User user) {
        expiryDate = new Date(new Date().getTime() + EXPIRATION);
        this.user = user;
        this.token = token;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
