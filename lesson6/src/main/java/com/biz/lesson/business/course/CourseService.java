package com.biz.lesson.business.course;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.lesson.business.BaseService;
import com.biz.lesson.dao.course.CourseRepository;
import com.biz.lesson.model.Course;


@Service("courseService")
public class CourseService extends BaseService {
	@Autowired
	private CourseRepository courseRepository;
	public List<Course> findAll() {
		return courseRepository.findAll();
	}
	public Course get(String id) {
		if(StringUtils.isNotBlank(id)){
			Course Course = courseRepository.findOne(id);
			return Course;
		}else{
			return null;
		}
	}
	public Course save(Course po) {
		return courseRepository.save(po);
	}
	public void delete(String id) {
		  courseRepository.delete(id);
	}
	public List<Course> findAll(String[] str) {
		return courseRepository.findAll(str);
	}
	
	
	
}
