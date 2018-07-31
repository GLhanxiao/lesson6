package com.biz.lesson.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "stu_student")
public class Student extends Persistent {

    private static final long serialVersionUID = -6082508344655756691L;

    @Column(length = 50)
    private String code;
    
    @Column(length = 50)
    private String name;

    @Column
    private Date birthday;

    @Column
    private Integer gender;

    @Column(length = 255)
    private String description;
    
    @JoinTable(name="student_course",
    		   joinColumns={@JoinColumn(name="student_id")},
    		   inverseJoinColumns={@JoinColumn(name="course_id")}
    		)
    @ManyToMany
    private List<Course> courses = new ArrayList();
    
	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
