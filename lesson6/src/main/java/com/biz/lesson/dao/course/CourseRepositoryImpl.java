package com.biz.lesson.dao.course;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;

import com.biz.lesson.dao.common.CommonJpaRepositoryBean;
import com.biz.lesson.model.Course;


public class CourseRepositoryImpl extends CommonJpaRepositoryBean<Course, Long> implements
		CourseDao {

	@Autowired
	public CourseRepositoryImpl(EntityManager em) {
		super(Course.class, em);
	}
	
	
}
