package com.utm.entities;

import org.hibernate.type.TimeType;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the lessons database table.
 * 
 */
@Entity
@Table(name="lessons")
@NamedQuery(name="Lesson.findAll", query="SELECT l FROM Lesson l")
public class Lesson implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=false)
	private Date datetime;

	@Size(min = 5, max = 200)
	@Column(length=200)
	private String homework;

	@Size(min = 5, max = 200)
	@Column(length=200)
	private String topic;

	//bi-directional many-to-one association to Subject
	@ManyToOne
	@JoinColumn(name="id_subject", nullable=false)
	private Subject subject;

	//bi-directional many-to-one association to Teacher
	@ManyToOne
	@JoinColumn(name="id_teacher", nullable=false)
	private Teacher teacher;

	//bi-directional many-to-one association to Registry
	@OneToMany(mappedBy="lesson")
	private List<Registry> registries;

	public Lesson() {
		this.registries = new ArrayList<>();
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	public String getHomework() {
		return this.homework;
	}

	public void setHomework(String homework) {
		this.homework = homework;
	}

	public String getTopic() {
		return this.topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Teacher getTeacher() {
		return this.teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public List<Registry> getRegistries() {
		return this.registries;
	}

	public void setRegistries(List<Registry> registries) {
		this.registries = registries;
	}

	public Registry addRegistry(Registry registry) {
		getRegistries().add(registry);
		registry.setLesson(this);

		return registry;
	}

	public Registry removeRegistry(Registry registry) {
		getRegistries().remove(registry);
		registry.setLesson(null);

		return registry;
	}

}