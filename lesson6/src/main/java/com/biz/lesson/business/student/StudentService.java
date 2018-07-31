package com.biz.lesson.business.student;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.biz.lesson.business.BaseService;
import com.biz.lesson.dao.student.StudentDao;
import com.biz.lesson.dao.student.StudentRepository;
import com.biz.lesson.model.Student;
import com.biz.lesson.vo.student.StudentSearchVo;


@Service("studentService")
public class StudentService extends BaseService {
	@Autowired
	private StudentRepository studentRepository;
	
	public List<Student> findAll() {
		return studentRepository.findAll();
	}
	
	public List<Student> findAll(String[] sid) {
		return studentRepository.findAll(sid);
	}
	
	public Student get(String id) {
		if(StringUtils.isNotBlank(id)){
			Student student = studentRepository.findOne(id);
			return student;
		}else{
			return null;
		}
	}
	public Student save(Student po) {
		return studentRepository.save(po);
	}
	public Boolean delete(String id) {
		  studentRepository.delete(id);
		  return true;
	}
	public List<Student> listByCode(String code) {
		 List<Student> list = studentRepository.findByCode(code);
		 return list;
	}
	public List<Student> listByName(String name) {
		String key = "%"+name+"%";
		List<Student> list = studentRepository.findByNameLike(key);
		return list;
	}
	public List<Student> search(StudentSearchVo vo) {
		return studentRepository.search(vo);
	}

	public Page<Student> findAll(PageRequest pageRequest) {
		return studentRepository.findAll(pageRequest);
	}
	
	
}
