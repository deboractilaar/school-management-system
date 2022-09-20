package com.dao;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.Course;
import com.bean.User;

public class CourseDao {
	
	HibernateTemplate template;
	
	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Transactional
	public void saveCourse(Course course) {
		template.save(course);
	}
	
	@Transactional
	public void updateCourse(Course course) {
		template.update(course);
	}
	
	@Transactional
	public void deleteCourse(Course course) {
		template.delete(course);
	}
	
	public Course getCoursebyId(int id) {
		Course course = (Course) template.get(Course.class, id);
		return course;
	}
	
	public List<Course> getCourseList() {
		List<Course> list = template.loadAll(Course.class);
		return list;
	}
	
	public User setCourseListbyUser(User user) {
		Set<Course> courses = new LinkedHashSet<Course>();
		if (user.getSelectedCourseIds().size() > 0) {
			for (int id : user.getSelectedCourseIds()) {
				Course course = getCoursebyId(id);
				courses.add(course);
			}
		}
		user.setCourses(courses);
		return user;
	}
	
	public List<Integer> getCourseIdListbyUser(final User user) {
		List<Integer> list = template.execute(new HibernateCallback<List<Integer>>() {
			@Override
			public List<Integer> doInHibernate(Session session) throws HibernateException {
				TypedQuery<Course> query = session.createQuery("select c from Course c join c.users u where u.id=:userId", Course.class);
				query.setParameter("userId", user.getId());
				List<Course> courses = query.getResultList();
				List<Integer> courseIds = new ArrayList<Integer>();
				for (Course course : courses) {
					courseIds.add(course.getId());
				}
				return courseIds;
			}
		});
		return list;
	}
	
	public Set<Course> getCourseListbyUser(final User user) {
		Set<Course> list = template.execute(new HibernateCallback<Set<Course>>() {
			@Override
			public Set<Course> doInHibernate(Session session) throws HibernateException {
				TypedQuery<Course> query = session.createQuery("select c from Course c join c.users u where u.id=:userId", Course.class);
				query.setParameter("userId", user.getId());
				Set<Course> courses = new LinkedHashSet<Course>(query.getResultList());
				return courses;
			}
		});
		return list;
	}
}
