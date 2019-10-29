package com.utm.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the registry database table.
 * 
 */
@Entity
@Table(name="registry")
@NamedQuery(name="Registry.findAll", query="SELECT r FROM Registry r")
public class Registry implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(nullable=false)
	private byte absent;

	private byte mark;

	//bi-directional many-to-one association to Lesson
	@ManyToOne
	@JoinColumn(name="id_lesson", nullable=false)
	private Lesson lesson;

	//bi-directional many-to-one association to Student
	@ManyToOne
	@JoinColumn(name="id_student", nullable=false)
	private Student student;

	public Registry() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public byte getAbsent() {
		return this.absent;
	}

	public void setAbsent(byte absent) {
		this.absent = absent;
	}

	public byte getMark() {
		return this.mark;
	}

	public void setMark(byte mark) {
		this.mark = mark;
	}

	public Lesson getLesson() {
		return this.lesson;
	}

	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

}