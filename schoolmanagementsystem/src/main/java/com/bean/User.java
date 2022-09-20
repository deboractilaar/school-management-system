package com.bean;

import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class User {
	private int id;
	private String name;
	private String gender;
	private Date dob;
	private String address;
	private String  email;
	private String phone;
	private String password;
	private String type;
	private Set<Course> courses = new LinkedHashSet<Course>(0);
	private Set<Grade> grades = new LinkedHashSet<Grade>(0);
	private Set<Attendance> attendances = new LinkedHashSet<Attendance>(0);
	private Set<Announcement> announcements = new LinkedHashSet<Announcement>(0);
	private List<Integer> selectedCourseIds;
	private Grade grade;

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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Set<Course> getCourses() {
		return courses;
	}
	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}
	public Set<Grade> getGrades() {
		return grades;
	}
	public void setGrades(Set<Grade> grades) {
		this.grades = grades;
	}
	public Set<Attendance> getAttendances() {
		return attendances;
	}
	public void setAttendances(Set<Attendance> attendances) {
		this.attendances = attendances;
	}
	public Set<Announcement> getAnnouncements() {
		return announcements;
	}
	public void setAnnouncements(Set<Announcement> announcements) {
		this.announcements = announcements;
	}
	public List<Integer> getSelectedCourseIds() {
		return selectedCourseIds;
	}
	public void setSelectedCourseIds(List<Integer> selectedCourseIDs) {
		this.selectedCourseIds = selectedCourseIDs;
	}
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade garde) {
		this.grade = garde;
	}
}
