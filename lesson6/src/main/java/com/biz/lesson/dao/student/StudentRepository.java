package com.biz.lesson.dao.student;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.biz.lesson.dao.common.CommonJpaRepository;
import com.biz.lesson.model.Student;
import com.biz.lesson.vo.student.StudentSearchVo;

@Repository
public interface StudentRepository extends CommonJpaRepository<Student, String>, StudentDao{


	List<Student> findByCode(String code);

	List<Student> findByNameLike(String key);

	




}
