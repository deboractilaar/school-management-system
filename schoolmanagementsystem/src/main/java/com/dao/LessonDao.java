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

import com.bean.Course;
import com.bean.Lesson;

public class LessonDao {
	
	HibernateTemplate template;
	
	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Transactional
	public void saveLesson(Lesson lesson) {
		template.save(lesson);
	}
	
	@Transactional
	public void updateLesson(Lesson lesson) {
		template.update(lesson);
	}
	
	@Transactional
	public void deleteLesson(Lesson lesson) {
		template.delete(lesson);
	}
	
	public Lesson getLessonbyId(int id) {
		Lesson lesson = (Lesson) template.get(Lesson.class, id);
		return lesson;
	}
	
	public List<Lesson> getLessonList() {
		List<Lesson> lessons = template.loadAll(Lesson.class);
		return lessons;
	}
	
	public Set<Lesson> getLessonListbyCourse(final Course course) {
		Set<Lesson> list = template.execute(new HibernateCallback<Set<Lesson>>() {
			@Override
			public Set<Lesson> doInHibernate(Session session) throws HibernateException {
				TypedQuery<Lesson> query = session.createQuery("select l from Lesson l join l.course c where c.id=:courseId", Lesson.class);
				query.setParameter("courseId", course.getId());
				Set<Lesson> lessons = new LinkedHashSet<Lesson>(query.getResultList());
				return lessons;
			}
		});
		return list;
	}
}