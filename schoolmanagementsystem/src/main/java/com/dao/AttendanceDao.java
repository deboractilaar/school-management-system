package com.dao;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.Attendance;
import com.bean.Lesson;
import com.bean.User;

public class AttendanceDao {
	
	HibernateTemplate template;
	
	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Transactional
	public void saveAttendance(Attendance attendance) {
		template.save(attendance);
	}
	
	@Transactional
	public void updateAttendance(Attendance attendance) {
		template.update(attendance);
	}
	
	@Transactional
	public void deleteAttendance(Attendance attendance) {
		template.delete(attendance);
	}
	
	public Attendance getAttendancebyId(int id) {
		Attendance attendance = (Attendance) template.get(Attendance.class, id);
		return attendance;
	}
	
	public List<Attendance> getAttendanceList() {
		List<Attendance> list = template.loadAll(Attendance.class);
		return list;
	}
	
	public Set<Attendance> getAttendanceListbyLesson(final Lesson lesson) {
		Set<Attendance> list = template.execute(new HibernateCallback<Set<Attendance>>() {
			@Override
			public Set<Attendance> doInHibernate(Session session) throws HibernateException {
				TypedQuery<Attendance> query = session.createQuery("select a from Attendance a join a.lesson l where l.id=:lessonId", Attendance.class);
				query.setParameter("lessonId", lesson.getId());
				Set<Attendance> attendances = new LinkedHashSet<Attendance>(query.getResultList());
				return attendances;
			}
		});
		return list;
	}
	
	public Set<Attendance> getAttendanceListbyLessonStudent(final Lesson lesson, final User student) {
		Set<Attendance> list = template.execute(new HibernateCallback<Set<Attendance>>() {
			@Override
			public Set<Attendance> doInHibernate(Session session) throws HibernateException {
				TypedQuery<Attendance> query = session.createQuery("select a from Attendance a join a.lesson l join a.user u where l.id=:lessonId and u.id=:userId", Attendance.class);
				query.setParameter("lessonId", lesson.getId());
				query.setParameter("userId", student.getId());
				Set<Attendance> attendances = new LinkedHashSet<Attendance>(query.getResultList());
				return attendances;
			}
		});
		return list;
	}
}
