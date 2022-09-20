package com.bean;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class Course {
	private int id;
	private String name;
	private String detail;
	private Set<User> users = new LinkedHashSet<User>(0);
	private Set<Grade> grades = new LinkedHashSet<Grade>(0);
	private Set<Lesson> lessons = new LinkedHashSet<Lesson>(0);
	private Set<Announcement> announcements = new LinkedHashSet<Announcement>(0);
	private Set<Attachment> attachments = new LinkedHashSet<Attachment>(0);
	private List<User> studentList;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public Set<Grade> getGrades() {
		return grades;
	}
	public void setGrades(Set<Grade> grades) {
		this.grades = grades;
	}
	public Set<Lesson> getLessons() {
		return lessons;
	}
	public void setLessons(Set<Lesson> lessons) {
		this.lessons = lessons;
	}
	public Set<Announcement> getAnnouncements() {
		return announcements;
	}
	public void setAnnouncements(Set<Announcement> announcements) {
		this.announcements = announcements;
	}
	public Set<Attachment> getAttachments() {
		return attachments;
	}
	public void setAttachments(Set<Attachment> attachments) {
		this.attachments = attachments;
	}
	public List<User> getStudentList() {
		return studentList;
	}
	public void setStudentList(List<User> studentList) {
		this.studentList = studentList;
	}
}
