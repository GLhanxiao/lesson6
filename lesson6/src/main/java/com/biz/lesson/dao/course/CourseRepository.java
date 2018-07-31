package com.biz.lesson.dao.course;


import org.springframework.stereotype.Repository;

import com.biz.lesson.dao.common.CommonJpaRepository;
import com.biz.lesson.model.Course;

@Repository
public interface CourseRepository extends CommonJpaRepository<Course, String>, CourseDao{




	




}
