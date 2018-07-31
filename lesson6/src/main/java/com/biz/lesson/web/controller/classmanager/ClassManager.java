package com.biz.lesson.web.controller.classmanager;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.biz.lesson.model.user.User;
import com.biz.lesson.web.controller.BaseController;

@Controller
@RequestMapping("/classm/classm/")
public class ClassManager extends BaseController{
	   @RequestMapping("list")
	   
	   public ModelAndView list() throws Exception {
	        ModelAndView modelAndView = new ModelAndView("classm/class/list");
	        return modelAndView;
	   }
}
