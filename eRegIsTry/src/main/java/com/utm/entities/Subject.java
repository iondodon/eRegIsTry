package com.utm.entities;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;


/**
 * The persistent class for the subjects database table.
 * 
 */
@Entity
@Table(name="subjects")
@NamedQuery(name="Subject.findAll", query="SELECT s FROM Subject s")
public class Subject implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@NotNull(message = "is required")
	@Size(min = 2, max = 45)
	@Column(nullable=false, length=45)
	private String subject;

	//bi-directional many-to-one association to Lesson
	@OneToMany(mappedBy="subject")
	private List<Lesson> lessons;

	//bi-directional many-to-one association to Schedule
	@OneToMany(mappedBy="subject")
	private List<Schedule> schedules;

	public Subject() {
		this.schedules = new ArrayList<>();
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public List<Lesson> getLessons() {
		return this.lessons;
	}

	public void setLessons(List<Lesson> lessons) {
		this.lessons = lessons;
	}

	public Lesson addLesson(Lesson lesson) {
		getLessons().add(lesson);
		lesson.setSubject(this);

		return lesson;
	}

	public Lesson removeLesson(Lesson lesson) {
		getLessons().remove(lesson);
		lesson.setSubject(null);

		return lesson;
	}

	public List<Schedule> getSchedules() {
		return this.schedules;
	}

	public void setSchedules(List<Schedule> schedules) {
		this.schedules = schedules;
	}

	public Schedule addSchedule(Schedule schedule) {
		getSchedules().add(schedule);
		schedule.setSubject(this);

		return schedule;
	}

	public Schedule removeSchedule(Schedule schedule) {
		getSchedules().remove(schedule);
		schedule.setSubject(null);

		return schedule;
	}
}