package com.controller;

import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.Announcement;
import com.bean.Attendance;
import com.bean.Course;
import com.bean.Grade;
import com.bean.Lesson;
import com.bean.User;
import com.dao.AnnouncementDao;
import com.dao.AttachmentDao;
import com.dao.AttendanceDao;
import com.dao.CourseDao;
import com.dao.GradeDao;
import com.dao.LessonDao;
import com.dao.UserDao;


@Controller
public class StudentController {
	
	@Autowired
	private AnnouncementDao announcementDao;
	@Autowired
	private AttachmentDao attachmentDao;
	@Autowired
	private AttendanceDao attendanceDao;
	@Autowired
	private CourseDao courseDao;
	@Autowired
	private GradeDao gradeDao;
	@Autowired
	private LessonDao lessonDao;
	@Autowired
	private UserDao userDao;
	
	public User getUserDetail(HttpServletRequest request) {
		int userId = 0;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("userId")) {
					userId = Integer.parseInt(cookie.getValue());
				}
			}
		}
		User user = userDao.getUserbyId(userId);
		return user;
	}
	
//--Home Page--------------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/student/homepage"})
	public String index() {
		return "student/homepage";
	}
	
//--Course Materials-------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/student/course-materials"})
	public String courseMaterials(HttpServletRequest request, Model model) {
		User student = getUserDetail(request);
		student.setCourses(courseDao.getCourseListbyUser(student));
		for (Course course : student.getCourses()) {
			course.setAttachments(attachmentDao.getAttachmentListbyCourse(course));
		}
		model.addAttribute("student", student);
		return "student/course-materials";
	}
	
//--Grades-----------------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/student/grades"})
	public String studentGrades(HttpServletRequest request, Model model) {
		User student = getUserDetail(request);
		student.setGrades(gradeDao.getGradeListbyStudent(student));
		for (Grade grade : student.getGrades()) {
			grade.setCourse(courseDao.getCoursebyId(grade.getCourse().getId()));
		}
		model.addAttribute("student", student);
		return "student/grades";
	}
	
//--Attendance-------------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/student/attendance"})
	public String studentAttendance(HttpServletRequest request, Model model) {
		User student = getUserDetail(request);
		Set<Course> courseList = courseDao.getCourseListbyUser(student);
		for (Course course : courseList) {
			course.setLessons(lessonDao.getLessonListbyCourse(course));
			for (Lesson lesson : course.getLessons()) {
				lesson.setAttendances(attendanceDao.getAttendanceListbyLesson(lesson));
				for (Attendance attendance : lesson.getAttendances()) {
					attendance.setUser(userDao.getUserbyId(attendance.getUser().getId()));
				}
			}
		}
		model.addAttribute("courseList", courseList);
		return "student/attendance";
	}
	
//--Announcements----------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/student/announcements"})
	public String studentAnnouncement(HttpServletRequest request, Model model) {
		User user = getUserDetail(request);
		Set<Course> courseList = courseDao.getCourseListbyUser(user);
		for (Course course : courseList) {
			course.setAnnouncements(announcementDao.getAnnouncementListbyCourse(course));
			for (Announcement announcement : course.getAnnouncements()) {
				announcement.setTeacher(userDao.getUserbyId(announcement.getTeacher().getId()));
			}
		}
		model.addAttribute("courseList", courseList);
		return "student/announcements";
	}

//--Profile----------------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/student/profile"})
	public String profile(HttpServletRequest request, @RequestParam String action, Model model) {
		User user = getUserDetail(request);
		user.setSelectedCourseIds(courseDao.getCourseIdListbyUser(user));
		model.addAttribute("user", user);
		if (action.equals("update")) {
			return "student/update-profile";
		}
		return "student/profile";
	}
	
	@RequestMapping(value={"/student/update-user-submission"}, method={RequestMethod.POST})
	public String updateUserSubmit(@ModelAttribute("user") User user, HttpServletRequest request, @RequestParam String action, Model model) {
		user = courseDao.setCourseListbyUser(user);
		userDao.updateUser(user);
		return "redirect:./profile?action=profile";
	}
}
