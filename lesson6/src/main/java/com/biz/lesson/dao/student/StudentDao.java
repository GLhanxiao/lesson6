package com.biz.lesson.dao.student;

import java.util.List;

import com.biz.lesson.model.Student;
import com.biz.lesson.vo.student.StudentSearchVo;

public interface StudentDao {

	List<Student> search(StudentSearchVo ss);
}
