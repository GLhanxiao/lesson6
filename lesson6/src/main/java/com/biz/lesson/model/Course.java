package com.biz.lesson.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
@Table(name = "stu_course")
@Entity
public class Course extends Persistent {
	
	private static final long serialVersionUID = 1162772395262633338L;
	
	@Column(length=50)
	private String name;
	
	@Column(length=50)
	private String description;
	
	@ManyToMany(mappedBy="courses")
	private List<Student> students = new ArrayList();
	
	public String getDescription() {
		return description;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


}
