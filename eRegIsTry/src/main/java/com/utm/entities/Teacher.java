package com.utm.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


/**
 * The persistent class for the teachers database table.
 * 
 */
@Entity
@Table(name="teachers")
@NamedQuery(name="Teacher.findAll", query="SELECT t FROM Teacher t")
public class Teacher implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@OneToOne
	@JoinColumn(name = "id_base_subject")
	private Subject baseSubject;

	//bi-directional many-to-one association to Group
	@OneToMany(mappedBy="teacher")
	private List<Group> groups;

	//bi-directional many-to-one association to Lesson
	@OneToMany(mappedBy="teacher")
	private List<Lesson> lessons;

	//bi-directional one-to-one association to User
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_user")
	private User user;

	public Teacher() {
		this.groups = new ArrayList<>();
		this.lessons = new ArrayList<>();
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Subject getBaseSubject() {
		return this.baseSubject;
	}

	public void setBaseSubject(Subject baseSubject) {
		this.baseSubject = baseSubject;
	}

	public List<Group> getGroups() {
		return this.groups;
	}

	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}

	public Group addGroup(Group group) {
		getGroups().add(group);
		group.setTeacher(this);

		return group;
	}

	public Group removeGroup(Group group) {
		getGroups().remove(group);
		group.setTeacher(null);

		return group;
	}

	public List<Lesson> getLessons() {
		return this.lessons;
	}

	public void setLessons(List<Lesson> lessons) {
		this.lessons = lessons;
	}

	public Lesson addLesson(Lesson lesson) {
		getLessons().add(lesson);
		lesson.setTeacher(this);

		return lesson;
	}

	public Lesson removeLesson(Lesson lesson) {
		getLessons().remove(lesson);
		lesson.setTeacher(null);

		return lesson;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}