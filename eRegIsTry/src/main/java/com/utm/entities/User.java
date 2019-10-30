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

	@Size(min = 5, max = 20)
	@NotNull(message = "is required")
	@Column(nullable=false, length=45)
	private String username;

	@Size(min = 6, max = 100)
	@NotNull(message = "is required")
	@Column(nullable=false, length=100)
	private String password;

	@Size(min = 2, max = 20)
	@NotNull(message = "is required")
	@Column(name="first_name", nullable=false, length=45)
	private String firstName;

	@Size(min = 2, max = 20)
	@NotNull(message = "is required")
	@Column(name="second_name", nullable=false, length=45)
	private String secondName;

	//bi-directional many-to-one association to Administrator
	@OneToMany(mappedBy="user")
	private List<Administrator> administrators;

	//bi-directional many-to-one association to Student
	@OneToMany(mappedBy="user")
	private List<Student> students;

	//bi-directional many-to-one association to Teacher
	@OneToMany(mappedBy="user")
	private List<Teacher> teachers;

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
		this.teachers = new ArrayList<>();
		this.students = new ArrayList<>();
		this.administrators = new ArrayList<>();
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

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSecondName() {
		return this.secondName;
	}

	public void setSecondName(String secondName) {
		this.secondName = secondName;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Administrator> getAdministrators() {
		return this.administrators;
	}

	public void setAdministrators(List<Administrator> administrators) {
		this.administrators = administrators;
	}

	public Administrator addAdministrator(Administrator administrator) {
		getAdministrators().add(administrator);
		administrator.setUser(this);

		return administrator;
	}

	public Administrator removeAdministrator(Administrator administrator) {
		getAdministrators().remove(administrator);
		administrator.setUser(null);

		return administrator;
	}

	public List<Student> getStudents() {
		return this.students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public Student addStudent(Student student) {
		getStudents().add(student);
		student.setUser(this);

		return student;
	}

	public Student removeStudent(Student student) {
		getStudents().remove(student);
		student.setUser(null);

		return student;
	}

	public List<Teacher> getTeachers() {
		return this.teachers;
	}

	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}

	public Teacher addTeacher(Teacher teacher) {
		getTeachers().add(teacher);
		teacher.setUser(this);

		return teacher;
	}

	public Teacher removeTeacher(Teacher teacher) {
		getTeachers().remove(teacher);
		teacher.setUser(null);

		return teacher;
	}

	public List<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

}