package com.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Announcement;
import com.bean.Attendance;
import com.bean.Course;
import com.bean.Grade;
import com.bean.Lesson;
import com.bean.User;
import com.dao.AnnouncementDao;
import com.dao.AttendanceDao;
import com.dao.CourseDao;
import com.dao.GradeDao;
import com.dao.LessonDao;
import com.dao.UserDao;


@Controller
public class PrincipalController {
	
	@Autowired
	private AnnouncementDao announcementDao;
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
	@RequestMapping(value={"/principal/homepage"})
	public String index() {
		return "principal/homepage";
	}
	
//--Manage Users-----------------------------------------------------------------------------------------------------------	
	@RequestMapping(value={"/principal/manage-users"})
	public String manageUsers(Model model) {
		List<User> principalList = new ArrayList<User>();
		List<User> teacherList = new ArrayList<User>();
		List<User> studentList = new ArrayList<User>();
		LinkedHashMap<String, List<User>> userList = new LinkedHashMap<String, List<User>>();
		List<User> users = userDao.getUserList();
		for (User user: users) {
			if (user.getType().equals("Principal")) {
				principalList.add(user);
			}
			else if (user.getType().equals("Teacher")) {
				teacherList.add(user);
			}
			else {
				studentList.add(user);
			}
		}		
		userList.put("Principal", principalList);
		userList.put("Teacher", teacherList);
		userList.put("Student", studentList);
		model.addAttribute("userList", userList);
		return "principal/manage-users";
	}
	
	@RequestMapping(value={"/principal/add-user"})
	public String addUser(Model model) {
		List<Course> courseList = courseDao.getCourseList();
		model.addAttribute("courseList", courseList);
		model.addAttribute("user", new User());
		return "principal/add-user";
	}
	
	@RequestMapping(value={"/principal/add-user-submission"}, method={RequestMethod.POST})
	public String addUserSubmit(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
		try {
			if (user.getSelectedCourseIds() != null) {
				user = courseDao.setCourseListbyUser(user);
			}
			userDao.saveUser(user);
			if (user.getType().equals("Student")) {
				for (Course course : user.getCourses()) {
					for (Lesson lesson : lessonDao.getLessonListbyCourse(course)) {
						if (lesson.getDate().toLocalDate().isAfter(LocalDate.now())) {
							Attendance attendance = new Attendance();
							attendance.setLesson(lesson);
							attendance.setUser(user);
							attendance.setValue("pending");
							attendanceDao.saveAttendance(attendance);
						}
					}
				}
			}
			return "redirect:./manage-users";
		}
		catch (Exception e) {
			redirectAttributes.addFlashAttribute("fail", true);
			return "redirect:./add-user";
		}
	}
	
	@RequestMapping(value={"/principal/update-user"})
	public String updateUser(@RequestParam int userId, Model model) {
		User user = userDao.getUserbyId(userId);
		user.setSelectedCourseIds(courseDao.getCourseIdListbyUser(user));
		List<Course> courseList = courseDao.getCourseList();
		model.addAttribute("user", user);
		model.addAttribute("courseList", courseList);
		return "principal/update-user";
	}
	
	@RequestMapping(value={"/principal/update-user-submission"}, method={RequestMethod.POST})
	public String updateUserSubmit(@ModelAttribute("user") User user, @RequestParam String action, RedirectAttributes redirectAttributes) {
		try {
			if (user.getSelectedCourseIds() != null) {
				user = courseDao.setCourseListbyUser(user);
			}
			userDao.updateUser(user);
			if (action.equals("profile")) {
				return "redirect:./profile?action=profile";
			}
			return "redirect:./manage-users";
		}
		catch (Exception e) {
			redirectAttributes.addFlashAttribute("fail", true);
			if (action.equals("profile")) {
				return "redirect:./profile?action=update";
			}
			else {
				return "redirect:./update-user?userId="+user.getId();
			}
		}
	}
	
	@RequestMapping(value={"/principal/delete-user"})
	public String deleteUser(@RequestParam int userId) {
		User user = userDao.getUserbyId(userId);
		userDao.deleteUser(user);
		return "redirect:./manage-users";
	}
	
//--Courses----------------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/principal/courses"})
	public String courses(Model model) {
		List<Course> courseList = courseDao.getCourseList();
		model.addAttribute("courseList", courseList);
		return "principal/courses";
	}
	
	@RequestMapping(value={"/principal/add-course"})
	public String addCourse(Model model) {
		model.addAttribute("course", new Course());
		return "principal/add-course-form";
	}
	
	@RequestMapping(value={"/principal/add-course-submission"}, method={RequestMethod.POST})
	public String addCourseSubmit(@ModelAttribute("course") Course course, RedirectAttributes redirectAttributes) {
		try {
			courseDao.saveCourse(course);
			return "redirect:./courses";
		}
		catch (Exception e) {
			redirectAttributes.addFlashAttribute("fail", true);
			return "redirect:./add-course";
		}
	}
	
	@RequestMapping(value={"/principal/update-course"})
	public String updateCourse(@RequestParam int courseId, Model model) {
		Course course = courseDao.getCoursebyId(courseId);
		model.addAttribute("course", course);
		return "principal/update-course";
	}
	
	@RequestMapping(value={"/principal/update-course-submission"}, method={RequestMethod.POST})
	public String updateCourseSubmit(@ModelAttribute("course") Course course, RedirectAttributes redirectAttributes) {
		try {
			course.setUsers(userDao.getUserListbyCourse(course));
			courseDao.updateCourse(course);
			return "redirect:./courses";
		}
		catch (Exception e) {
			redirectAttributes.addFlashAttribute("fail", true);
			return "redirect:./update-course?courseId="+course.getId();
		}
	}
	
	@RequestMapping(value={"/principal/delete-course"})
	public String deleteCourse(@RequestParam int courseId, Model model) {
		Course course = courseDao.getCoursebyId(courseId);
		courseDao.deleteCourse(course);
		return "redirect:./courses";
	}
	
//--Lessons----------------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/principal/lessons"})
	public String lessons(Model model) {
		List<Lesson> lessonList = lessonDao.getLessonList();
		for (Lesson lesson : lessonList) {
			lesson.setCourse(courseDao.getCoursebyId(lesson.getCourse().getId()));
		}
		model.addAttribute("lessonList", lessonList);
		return "principal/lessons";
	}
	
	@RequestMapping(value={"/principal/add-lesson"})
	public String addLesson(Model model) {
		List<Course> courseList = courseDao.getCourseList();
		model.addAttribute("lesson", new Lesson());
		model.addAttribute("courseList", courseList);
		return "principal/add-lesson-form";
	}
	
	@RequestMapping(value={"/principal/add-lesson-submission"}, method={RequestMethod.POST})
	public String addLessonSubmit(@ModelAttribute("lesson") Lesson lesson, RedirectAttributes redirectAttributes) {
		boolean available = true;
		LocalTime newStartTime = lesson.getStartTime().toLocalTime();
		LocalTime newEndTime = lesson.getEndTime().toLocalTime();
		Set<Lesson> lessonList = lessonDao.getLessonListbyDateClassRoom(lesson);
		if (!lessonList.isEmpty()) {
			for (Lesson lssn :  lessonList) {
				LocalTime lessonStartTime = lssn.getStartTime().toLocalTime();
				LocalTime lessonEndTime = lssn.getEndTime().toLocalTime();
				if ((
						((newStartTime.isAfter(lessonStartTime) || newStartTime.equals(lessonStartTime)) && newStartTime.isBefore(lessonEndTime)) || 
						(newEndTime.isAfter(lessonStartTime) && (newEndTime.isBefore(lessonEndTime) || newEndTime.equals(lessonEndTime))) ||
						((lessonStartTime.isAfter(newStartTime) || lessonStartTime.equals(newStartTime)) && lessonStartTime.isBefore(newEndTime)) || 
						(lessonEndTime.isAfter(newStartTime) && (lessonEndTime.isBefore(newEndTime) || lessonEndTime.equals(newEndTime)))
						)) {
					available = false;
					break;
				}
			}
		}
		
		if (available) {
			lessonDao.saveLesson(lesson);
			Course course = courseDao.getCoursebyId(lesson.getCourse().getId());
			Set<User> studentList = userDao.getStudentListbyCourse(course);
			for (User student : studentList) {
				Attendance attendance = new Attendance();
				attendance.setLesson(lesson);
				attendance.setUser(student);
				attendance.setValue("pending");
				attendanceDao.saveAttendance(attendance);
				return "redirect:./lessons";
			}
		}
		else {
		redirectAttributes.addFlashAttribute("fail", true);
		return "redirect:./add-lesson";
		}
		return null;
	}
	
	@RequestMapping(value={"/principal/update-lesson"})
	public String updateLesson(@RequestParam int lessonId, Model model) {
		Lesson lesson = lessonDao.getLessonbyId(lessonId);
		List<Course> courseList = courseDao.getCourseList();
		model.addAttribute("lesson", lesson);
		model.addAttribute("courseList", courseList);
		return "principal/update-lesson";
	}
	
	@RequestMapping(value={"/principal/update-lesson-submission"}, method={RequestMethod.POST})
	public String updateCourseSubmit(@ModelAttribute("lesson") Lesson lesson) {
		lessonDao.updateLesson(lesson);
		return "redirect:./lessons";
	}
	
	@RequestMapping(value={"/principal/delete-lesson"})
	public String deleteLesson(@RequestParam int lessonId) {
		Lesson lesson = lessonDao.getLessonbyId(lessonId);
		lessonDao.deleteLesson(lesson);
		return "redirect:./lessons";
	}
	
//--Grades-----------------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/principal/grades"})
	public String grades(Model model) {
		List<Grade> gradeList = gradeDao.getGradeList();
		for (Grade grade : gradeList) {
			grade.setCourse(courseDao.getCoursebyId(grade.getCourse().getId()));
			grade.setUser(userDao.getUserbyId(grade.getUser().getId()));
		}
		model.addAttribute("gradeList", gradeList);
		return "principal/grades";
	}
	
//--Attendance-------------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/principal/attendance"})
	public String attendance(Model model) {
		List<Course> courseList = courseDao.getCourseList();
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
		return "principal/attendance";
	}
	
//--Announcement-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/principal/announcements"})
	public String announcements(Model model) {
		List<Announcement> announcementList = announcementDao.getAnnouncementList();
		for (Announcement announcement : announcementList) {
			announcement.setTeacher(userDao.getUserbyId(announcement.getTeacher().getId()));
			announcement.setCourse(courseDao.getCoursebyId(announcement.getCourse().getId()));
		}
		model.addAttribute("announcementList", announcementList);
		return "principal/announcements";
	}
	
//--Profile----------------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/principal/profile"})
	public String profile(HttpServletRequest request, @RequestParam String action, Model model) {
		User user = getUserDetail(request);
		user.setSelectedCourseIds(courseDao.getCourseIdListbyUser(user));
		model.addAttribute("user", user);
		if (action.equals("update")) {
			return "principal/update-profile";
		}
		return "principal/profile";
	}
}