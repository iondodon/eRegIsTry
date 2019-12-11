package com.utm.entities;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


/**
 * The persistent class for the users database table.
 * 
 */
@Entity
@Table(name="users")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable, UserDetails {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Size(min = 2, max = 20)
	@NotNull(message = "is required")
	@Column(name="first_name", nullable=false, length=45)
	private String firstName;

	@Size(min = 2, max = 20)
	@NotNull(message = "is required")
	@Column(name="last_name", nullable=false, length=45)
	private String lastName;

	@Column(nullable=false, length=100)
	private String password;

	@Transient
	private String passwordConfirmation;

	@Size(min = 5, max = 45)
	@NotNull(message = "is required")
	@Column(nullable=false, length=45)
	private String username;

	@Pattern(regexp = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)])", message = "doesn't match email pattern")
	@NotNull(message = "is required")
	@Column(nullable=false, length=100)
	private String email;

	//bi-directional one-to-one association to Administrator
	@OneToOne(mappedBy = "user", fetch = FetchType.EAGER)
	private Administrator administrator;

	//bi-directional one-to-one association to Student
	@OneToOne(mappedBy = "user", fetch = FetchType.EAGER)
	private Student student;

	//bi-directional one-to-one association to Teacher
	@OneToOne(mappedBy = "user", fetch = FetchType.EAGER)
	private Teacher teacher;

	//bi-directional many-to-many association to Role
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
		name="users_roles"
		, joinColumns={
			@JoinColumn(name="id_user", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="id_role", nullable=false)
			}
		)
	private List<Role> roles;

	@NotNull
	@Column(nullable=false)
	private boolean active;

	public User() {
		this.roles = new ArrayList<>();
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Administrator getAdministrator() {
		return this.administrator;
	}

	public void setAdministrator(Administrator administrator) {
		this.administrator = administrator;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Teacher getTeacher() {
		return this.teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public List<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return this.username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<SimpleGrantedAuthority> grantedAuthorities = new ArrayList<>();
		for (Role role: roles) {
			grantedAuthorities.add(new SimpleGrantedAuthority(role.getRole()));
		}
		return grantedAuthorities;
	}

	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}

	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
}