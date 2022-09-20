package com.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.User;
import com.dao.UserDao;

@Controller
public class LoginController {
	
	@Autowired
	UserDao userDao;
	
	@RequestMapping("/login")
	public String studentLogin(Model model) {
		model.addAttribute("user", new User());
		return "login";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpServletResponse response, Model model) {
		User userDetail = userDao.authentication(user);
		if (userDetail != null) {
			if ("Student".equals(userDetail.getType())) {
				response.addCookie(new Cookie("userId", Integer.toString(userDetail.getId())));
				return "redirect:student/homepage";
			}
			else if ("Teacher".equals(userDetail.getType())) {
				response.addCookie(new Cookie("userId", Integer.toString(userDetail.getId())));
				return "redirect:teacher/homepage";
			}
			else if ("Principal".equals(userDetail.getType())) {
				response.addCookie(new Cookie("userId", Integer.toString(userDetail.getId())));
				return "redirect:principal/homepage";
			}
		}
		model.addAttribute("fail", true);
		return "login";
	}
}
