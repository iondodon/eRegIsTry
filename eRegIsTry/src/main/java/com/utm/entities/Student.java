package com.utm.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the students database table.
 * 
 */
@Entity
@Table(name="students")
@NamedQuery(name="Student.findAll", query="SELECT s FROM Student s")
public class Student implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	//bi-directional many-to-one association to Registry
	@OneToMany(mappedBy="student")
	private List<Registry> registries;

	//bi-directional many-to-one association to Group
	@ManyToOne
	@JoinColumn(name="id_group", nullable=false)
	private Group group;

	//bi-directional one-to-one association to User
	@OneToOne
	@JoinColumn(name = "id_user")
	private User user;

	public Student() {

	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Registry> getRegistries() {
		return this.registries;
	}

	public void setRegistries(List<Registry> registries) {
		this.registries = registries;
	}

	public Registry addRegistry(Registry registry) {
		getRegistries().add(registry);
		registry.setStudent(this);

		return registry;
	}

	public Registry removeRegistry(Registry registry) {
		getRegistries().remove(registry);
		registry.setStudent(null);

		return registry;
	}

	public Group getGroup() {
		return this.group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}