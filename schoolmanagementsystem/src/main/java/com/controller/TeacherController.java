package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Announcement;
import com.bean.Attachment;
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
public class TeacherController {
	
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
	@RequestMapping(value={"/teacher/homepage"})
	public String index() {
		return "teacher/homepage";
	}
	
//--Student Details--------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/teacher/student-details"})
	public String studentDetails(HttpServletRequest request, Model model) {
		User user = getUserDetail(request);
		Set<Course> courseList = courseDao.getCourseListbyUser(user);
		for (Course course : courseList) {
			course.setUsers(userDao.getStudentListbyCourse(course));
		}
		model.addAttribute("courseList", courseList);
		return "teacher/student-details";
	}

//--Course Materials-------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/teacher/course-materials"})
	public String courseMaterials(HttpServletRequest request, Model model) {
		User user = getUserDetail(request);
		Set<Course> courseList = courseDao.getCourseListbyUser(user);
		for (Course course : courseList) {
			course.setAttachments(attachmentDao.getAttachmentListbyCourse(course));
		}
		model.addAttribute("courseList", courseList);
		return "teacher/course-materials";
	}
	
	@RequestMapping(value={"/teacher/add-material"})
	public String addMaterial(HttpServletRequest request, Model model) {
		User user = getUserDetail(request);
		Set<Course> courseList = courseDao.getCourseListbyUser(user);
		model.addAttribute("courseList", courseList);
		model.addAttribute("attachment", new Attachment());
		return "teacher/add-material";
	}
	
	@RequestMapping(value={"/teacher/add-material-submission"}, method={RequestMethod.POST}, consumes={MediaType.MULTIPART_FORM_DATA_VALUE})
	public String addAttachmentSubmit(@ModelAttribute("attachment") Attachment attachment, @RequestPart("file") MultipartFile[] files) throws IOException {
		for (MultipartFile file : files) {
			attachment.setInputStream(file.getInputStream());
			attachment.setFileSize(file.getSize());
			attachment.setFileMimeType(file.getContentType());
			attachment.setFileName(file.getOriginalFilename());
			attachmentDao.saveAttachment(attachment);
		}
		return "redirect:./course-materials";
	}
	
	@RequestMapping(value={"/teacher/delete-material"})
	public String deleteAttachment(@RequestParam int attachmentId) {
		Attachment attachment = attachmentDao.getAttachmentbyId(attachmentId);
		attachmentDao.deleteAttachment(attachment);
		return "redirect:./course-materials";
	}

//--Lessons----------------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/teacher/lessons"})
	public String lessons(HttpServletRequest request, Model model) {
		User user = getUserDetail(request);
		Set<Course> courseList = courseDao.getCourseListbyUser(user);
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
		return "teacher/lessons";
	}
	
	@RequestMapping(value={"/teacher/update-attendance"})
	public String updateAttendance(@RequestParam int lessonId, Model model) {
		Lesson lesson = lessonDao.getLessonbyId(lessonId);
		lesson.setAttendanceList(new ArrayList<Attendance>(attendanceDao.getAttendanceListbyLesson(lesson)));
		for (Attendance attendance : lesson.getAttendanceList()) {
			attendance.setUser(userDao.getUserbyId(attendance.getUser().getId()));
		}
		model.addAttribute("lesson", lesson);
		return "teacher/update-attendance";
	}

	@RequestMapping(value={"/teacher/update-attendance-submission"}, method={RequestMethod.POST})
	public String updateAttendanceSubmit(@ModelAttribute("lesson") Lesson lesson) {
		for (Attendance attendance : lesson.getAttendanceList()) {
			if (attendance.getValue() == null) {
				attendance.setValue("pending");
			}
			attendanceDao.updateAttendance(attendance);
		}
		return "redirect:./lessons";
	}
	
//--Grades-----------------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/teacher/grades"})
	public String grades(HttpServletRequest request, Model model) {
		User user = getUserDetail(request);
		Set<Course> courseList = courseDao.getCourseListbyUser(user);
		for (Course course : courseList) {
			course.setGrades(gradeDao.getGradeListbyCourse(course));
			for (Grade grade : course.getGrades()) {
				grade.setUser(userDao.getUserbyId(grade.getUser().getId()));
			}
		}
		model.addAttribute("courseList", courseList);
		return "teacher/grades";
	}
	
	@RequestMapping(value={"/teacher/update-grades"})
	public String updateGrades(@RequestParam int courseId, Model model) {
		Course course = courseDao.getCoursebyId(courseId);
		course.setStudentList(new ArrayList<User>(userDao.getStudentListbyCourse(course)));
		for (User student : course.getStudentList()) {
			Grade grade = gradeDao.getGradebyStudentCourse(student, course);
			if (grade != null ) {
				student.setGrade(grade);
			}
			else {
				grade = new Grade();
				grade.setCourse(course);
				grade.setUser(student);
				gradeDao.saveGrade(grade);
				student.setGrade(grade);
			}
		}
		model.addAttribute("course", course);
		return "teacher/update-grades";
	}
	
	@RequestMapping(value={"/teacher/update-grades-submission"}, method={RequestMethod.POST})
	public String updateGradesSubmit(@ModelAttribute("course") Course course) {
		for (User student : course.getStudentList()) {
			gradeDao.updateGrade(student.getGrade());
		}
		return "redirect:./grades";
	}
	
//--Announcements----------------------------------------------------------------------------------------------------------	
	@RequestMapping(value={"/teacher/announcements"})
	public String announcements(HttpServletRequest request, Model model) {
		User user = getUserDetail(request);
		Set<Course> courseList = courseDao.getCourseListbyUser(user);
		for (Course course : courseList) {
			course.setAnnouncements(announcementDao.getAnnouncementListbyCourse(course));
		}
		model.addAttribute("courseList", courseList);
		return "teacher/announcements";
	}
	
	@RequestMapping(value={"/teacher/add-announcement"})
	public String postAnnouncement(HttpServletRequest request, Model model) {
		User user = getUserDetail(request);
		Set<Course> courseList = courseDao.getCourseListbyUser(user);
		Announcement announcement = new Announcement();
		announcement.setTeacher(user);
		model.addAttribute("courseList", courseList);
		model.addAttribute("announcement", announcement);
		return "teacher/add-announcement";
	}
	
	@RequestMapping(value={"/teacher/add-announcement-submission"}, method={RequestMethod.POST})
	public String addAnnouncementSubmit(@ModelAttribute("announcement") Announcement announcement) {
		announcementDao.saveAnnouncement(announcement);
		return "redirect:./announcements";
	}
	
	@RequestMapping(value={"/teacher/update-announcement"})
	public String updateAnnouncement(@RequestParam int announcementId, Model model) {
		Announcement announcement = announcementDao.getAnnouncementbyId(announcementId);
		Set<Course> courseList = courseDao.getCourseListbyUser(announcement.getTeacher());
		model.addAttribute("announcement", announcement);
		model.addAttribute("courseList", courseList);
		return "teacher/update-announcement";
	}
	
	@RequestMapping(value={"/teacher/update-announcement-submission"}, method={RequestMethod.POST})
	public String updateAnnouncementSubmit(@ModelAttribute("announcement") Announcement announcement) {;
		announcementDao.updateAnnouncement(announcement);
		return "redirect:./announcements";
	}
	
	@RequestMapping(value={"/teacher/delete-announcement"})
	public String deleteAnnouncement(@RequestParam int announcementId) {
		Announcement announcement = announcementDao.getAnnouncementbyId(announcementId);
		announcementDao.deleteAnnouncement(announcement);
		return "redirect:./announcements";
	}
	
//--Profile----------------------------------------------------------------------------------------------------------------
	@RequestMapping(value={"/teacher/profile"})
	public String profile(HttpServletRequest request, @RequestParam String action, Model model) {
		User user = getUserDetail(request);
		user.setSelectedCourseIds(courseDao.getCourseIdListbyUser(user));
		model.addAttribute("user", user);
		if (action.equals("update")) {
			return "teacher/update-profile";
		}
		return "teacher/profile";
	}
	
	@RequestMapping(value={"/teacher/update-user-submission"}, method={RequestMethod.POST})
	public String updateUserSubmit(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
		try {
			if (user.getSelectedCourseIds() != null) {
				user = courseDao.setCourseListbyUser(user);
			}
			userDao.updateUser(user);
			return "redirect:./profile?action=profile";
		}
		catch (Exception e) {
			redirectAttributes.addFlashAttribute("fail", true);
			return "redirect:./profile?action=update";
		}
	}
}