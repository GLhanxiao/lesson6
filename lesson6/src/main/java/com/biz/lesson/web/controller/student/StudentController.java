package com.biz.lesson.web.controller.student;


import java.util.List;
import java.util.Objects;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.biz.lesson.business.course.CourseService;
import com.biz.lesson.business.student.StudentService;
import com.biz.lesson.exception.ObjectNotExistsException;
import com.biz.lesson.model.Course;
import com.biz.lesson.model.Student;
import com.biz.lesson.model.user.AccessLogPo;
import com.biz.lesson.util.PageControl;
import com.biz.lesson.vo.student.StudentSearchVo;
import com.biz.lesson.vo.student.StudentVo;
import com.biz.lesson.web.controller.BaseController;
@Controller
@RequestMapping("/student/student/")
public class StudentController extends BaseController {
	    @Autowired
	    private StudentService studentService;
	    @Autowired
	    private CourseService courseService;
	    
	    @RequestMapping("list")
	   /* @PreAuthorize("hasAuthority('OPT_STUDENT_STUDENT_LIST')")*/

	    public ModelAndView list(StudentVo vo,BindingResult result, HttpServletRequest request)throws Exception  {
	    	error(result, request);
	        ModelAndView modelAndView = new ModelAndView("student/student/list");
	        PageControl pc = new PageControl(request, 6);
	        modelAndView.addObject("pageControl", pc);
	        PageRequest pageRequest = new PageRequest(pc.getCurrentPage() - 1, pc.getPageSize());
	        Page<Student> student = studentService.findAll(pageRequest);
	        pc.setCount(student.getTotalElements());
	        modelAndView.addObject("student",student);
	        modelAndView.addObject("vo", vo);
	        return modelAndView;
	   }
	    @RequestMapping("/add")
	   /* @PreAuthorize("hasAuthority('OPT_STUDENT_STUDENT_ADD')")*/
	    public ModelAndView add()throws Exception  {
	        ModelAndView view = new ModelAndView("student/student/add");
	        view.addObject("cmd","add");
	        return view;
	   }
	    @RequestMapping("/edit")
	   /* @PreAuthorize("hasAuthority('OPT_STUDENT_STUDENT_EDIT')")*/
	    public ModelAndView edit(String id)throws Exception  {
	        ModelAndView view = new ModelAndView("student/student/add");
	        Student student = studentService.get(id);
	        view.addObject("student", student);
	        view.addObject("cmd", "edit");
	        return view;
	   }
	   
	    @RequestMapping("/detail")
	    /*@PreAuthorize("hasAuthority('OPT_STUDENT_STUDENT_DETAIL')")*/
	    public ModelAndView detail(String id)throws Exception  {
	    	ModelAndView view = new ModelAndView("student/student/detail");
	    	Student student = studentService.get(id);
	    	List<Course> courses = courseService.findAll();
	    	view.addObject("student", student);
	    	view.addObject("courses", courses);
	    	return view;
	    }
	    @RequestMapping("/save_detail")
	    public ModelAndView save_detail(String id,String[] str)throws Exception  {
	    	Student student = studentService.get(id);
	    	List<Course> courses = courseService.findAll(str);
	    	student.setCourses(courses);
	    	studentService.save(student);
	        return new ModelAndView("redirect:/student/student/list.do");
	    }
	    @RequestMapping("/save_delete")
	   /* @PreAuthorize("hasAuthority('OPT_STUDENT_STUDENT_DELETE')")*/
	    @ResponseBody
	    public Boolean delete(String id)throws Exception  {
	      return studentService.delete(id);
	   }
	    @RequestMapping("/save_add")
	    /*@PreAuthorize("hasAuthority('OPT_STUDENT_STUDENT_ADD')")*/
	    public ModelAndView save_add(StudentVo vo,HttpServletRequest request)throws Exception  {
	       Student po = new Student();
	       po.setName(vo.getName());
	       po.setBirthday(vo.getBirthday());
	       po.setCode(vo.getCode());
	       po.setDescription(vo.getDescription());
	       po.setGender(vo.getGender());
	       po=studentService.save(po);
	        return new ModelAndView("redirect:/student/student/list.do");
	   }
	    @RequestMapping("/save_edit")
	    /*@PreAuthorize("hasAuthority('OPT_STUDENT_STUDENT_EDIT')")*/
	    public ModelAndView save_edit(StudentVo vo,HttpServletRequest request)throws Exception  {
	    	Student po = studentService.get(vo.getId());
	    	if(Objects.isNull(po)){
	    		throw new ObjectNotExistsException(vo.getId());
	    	}
	    	po.setName(vo.getName());
	    	po.setBirthday(vo.getBirthday());
	    	po.setCode(vo.getCode());
	    	po.setDescription(vo.getDescription());
	    	po.setGender(vo.getGender());
	    	po=studentService.save(po);
	    	return new ModelAndView("redirect:/student/student/list.do");
	    }
	    @RequestMapping("search")
	    public ModelAndView search(StudentSearchVo ss)throws Exception  {
	    	ModelAndView modelAndView = new ModelAndView("student/student/list");
	        modelAndView.addObject("student",studentService.search(ss));
	        return modelAndView;
	   }
	    @RequestMapping("listByCode")
	    public ModelAndView listByCode(String code)throws Exception  {
	    	ModelAndView modelAndView = new ModelAndView("student/student/list");
	        modelAndView.addObject("student",studentService.listByCode(code));
	        return modelAndView;
	   }
	    @RequestMapping("listLikeName")
	    public ModelAndView listLikeName(String name)throws Exception  {
	    	ModelAndView modelAndView = new ModelAndView("student/student/list");
	        modelAndView.addObject("student",studentService.listByName(name));
	        return modelAndView;
	    }
	 
}
