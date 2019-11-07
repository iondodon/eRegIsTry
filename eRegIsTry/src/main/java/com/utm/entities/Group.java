package com.utm.entities;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;


/**
 * The persistent class for the groups database table.
 * 
 */
@Entity
@Table(name="groups")
@NamedQuery(name="Group.findAll", query="SELECT g FROM Group g")
public class Group implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@NotNull
	@Size(min = 1, max = 10)
	@Column(nullable=false, length=45)
	private String name;

	//bi-directional many-to-one association to Teacher
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="id_master", nullable=false)
	private Teacher master;

	//bi-directional many-to-one association to Schedule
	@OneToMany(mappedBy="group")
	private List<Schedule> schedules;

	//bi-directional many-to-one association to Student
	@OneToMany(mappedBy="group", fetch = FetchType.EAGER)
	private List<Student> students;

	public Group() {
		this.schedules = new ArrayList<>();
		this.students = new ArrayList<>();
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Teacher getMaster() {
		return this.master;
	}

	public void setMaster(Teacher master) {
		this.master = master;
	}

	public List<Schedule> getSchedules() {
		return this.schedules;
	}

	public void setSchedules(List<Schedule> schedules) {
		this.schedules = schedules;
	}

	public Schedule addSchedule(Schedule schedule) {
		getSchedules().add(schedule);
		schedule.setGroup(this);

		return schedule;
	}

	public Schedule removeSchedule(Schedule schedule) {
		getSchedules().remove(schedule);
		schedule.setGroup(null);

		return schedule;
	}

	public List<Student> getStudents() {
		return this.students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public Student addStudent(Student student) {
		getStudents().add(student);
		student.setGroup(this);

		return student;
	}

	public Student removeStudent(Student student) {
		getStudents().remove(student);
		student.setGroup(null);

		return student;
	}
}