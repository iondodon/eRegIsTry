package com.utm.entities;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;


/**
 * The persistent class for the users database table.
 * 
 */
@Entity
@Table(name="users")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
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

	@Size(min = 5, max = 45)
	@NotNull(message = "is required")
	@Column(nullable=false, length=45)
	private String username;

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
	@ManyToMany
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

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return this.username;
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

}