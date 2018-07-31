package com.biz.lesson.web.controller.course;


import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.biz.lesson.business.course.CourseService;
import com.biz.lesson.business.student.StudentService;
import com.biz.lesson.exception.ObjectNotExistsException;
import com.biz.lesson.model.Course;
import com.biz.lesson.model.Student;
import com.biz.lesson.web.controller.BaseController;
@Controller
@RequestMapping("/course/course/")
public class CourseController extends BaseController {
	    @Autowired
	    private CourseService courseService;
	    @Autowired
	    private StudentService studentService;
	    
	    @RequestMapping("list")
	   /* @PreAuthorize("hasAuthority('OPT_COURSE_COURSE_LIST')")*/
	    public ModelAndView list()throws Exception  {
	        ModelAndView modelAndView = new ModelAndView("course/course/list");
	        modelAndView.addObject("course",courseService.findAll());
	        return modelAndView;
	   }
	   @RequestMapping("/add")
	  /* @PreAuthorize("hasAuthority('OPT_COURSE_COURSE_ADD')")*/
	   public ModelAndView add()throws Exception  {
	        ModelAndView view = new ModelAndView("course/course/add");
	        view.addObject("cmd","add");
	        return view;
	   }
	    @RequestMapping("/edit")
	    /*@PreAuthorize("hasAuthority('OPT_COURSE_COURSE_EDIT')")*/
	    public ModelAndView edit(String id)throws Exception  {
	        ModelAndView view = new ModelAndView("course/course/add");
	        Course course = courseService.get(id);
	        view.addObject("course", course);
	        view.addObject("cmd", "edit");
	        return view;
	   }
	    @RequestMapping("/detail")
	   /* @PreAuthorize("hasAuthority('OPT_COURSE_COURSE_DETAIL')")*/
	    public ModelAndView detail(String id)throws Exception  {
	    	ModelAndView view = new ModelAndView("course/course/detail");
	    	Course course = courseService.get(id);
	    	List<Student> students = studentService.findAll();
	    	view.addObject("students", students);
	    	view.addObject("course", course);
	    	return view;
	    }
	    @RequestMapping("/save_detail")
	    public ModelAndView save_detail(String id,String[] str)throws Exception  {
	    	Course course = courseService.get(id);
	    	List<Student> students = studentService.findAll(str);
	    	course.setStudents(students);
	    	courseService.save(course);
	        return new ModelAndView("redirect:/course/course/list.do");
	    }
	    @RequestMapping("/save_delete")
	   /* @PreAuthorize("hasAuthority('OPT_COURSE_COURSE_DELETE')")*/
	    @ResponseBody
	    public ModelAndView delete(String id)throws Exception  {
	       courseService.delete(id);
	       ModelAndView view = new ModelAndView("course/course/list");
	        return view;
	   }
	    @RequestMapping("/save_add")
	    /*@PreAuthorize("hasAuthority('OPT_COURSE_COURSE_ADD')")*/
	    public ModelAndView save_add(Course co,HttpServletRequest request)throws Exception  {
	       Course course = new Course();
	       course.setName(co.getName());
	       course.setDescription(co.getDescription());
	       course=courseService.save(course);
	        return new ModelAndView("redirect:/course/course/list.do");
	   }
	    @RequestMapping("/save_edit")
	    /*@PreAuthorize("hasAuthority('OPT_course_course_EDIT')")*/
	    public ModelAndView save_edit(Course co,HttpServletRequest request)throws Exception  {
	    	Course course = courseService.get(co.getId());
	    	if(Objects.isNull(course)){
	    		throw new ObjectNotExistsException(course.getId());
	    	}
	    	course.setName(co.getName());
	    	course.setDescription(co.getDescription());
	    	course=courseService.save(course);
	    	return new ModelAndView("redirect:/course/course/list.do");
	    }
	 
}
