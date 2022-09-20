package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping(value={"/"})
	public String index() {
		return "index";
	}
	
	@RequestMapping(value={"/study-at-lokon"})
	public String studyatlokon() {
		return "study-at-lokon";
	}
	
	@RequestMapping(value={"/about-us"})
	public String aboutus() {
		return "about-us";
	}
	
	@RequestMapping("/contact-us")
	public String contactus() {
		return "contact-us";
	}
	
	@RequestMapping("/research")
	public String research() {
		return "research";
	}
	
	@RequestMapping("/awards")
	public String awards() {
		return "awards";
	}
}
