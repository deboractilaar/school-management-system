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
import com.bean.Grade;
import com.bean.User;

public class GradeDao {
	
	HibernateTemplate template;
	
	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Transactional
	public void saveGrade(Grade grade) {
		template.save(grade);
	}
	
	@Transactional
	public void updateGrade(Grade grade) {
		template.update(grade);
	}
	
	@Transactional
	public void deleteGrade(Grade grade) {
		template.delete(grade);
	}
	
	public List<Grade> getGradeList() {
		List<Grade> list = template.loadAll(Grade.class);
		return list;
	}
	
	public Set<Grade> getGradeListbyCourse(final Course course) {
		Set<Grade> list = template.execute(new HibernateCallback<Set<Grade>>() {
			@Override
			public Set<Grade> doInHibernate(Session session) throws HibernateException {
				TypedQuery<Grade> query = session.createQuery("select g from Grade g join g.course c where c.id=:courseId", Grade.class);
				query.setParameter("courseId", course.getId());
				Set<Grade> grades = new LinkedHashSet<Grade>(query.getResultList());
				return grades;
			}
		});
		return list;
	}
	
	public Set<Grade> getGradeListbyStudent(final User user) {
		Set<Grade> list = template.execute(new HibernateCallback<Set<Grade>>() {
			@Override
			public Set<Grade> doInHibernate(Session session) throws HibernateException {
				TypedQuery<Grade> query = session.createQuery("select g from Grade g where user_id=:userId", Grade.class);
				query.setParameter("userId", user.getId());
				Set<Grade> grades = new LinkedHashSet<Grade>(query.getResultList());
				return grades;
			}
		});
		return list;
	}
	
	public Grade getGradebyStudentCourse(final User user, final Course course) {
		Grade list = template.execute(new HibernateCallback<Grade>() {
			@Override
			public Grade doInHibernate(Session session) throws HibernateException {
				TypedQuery<Grade> query = session.createQuery("select g from Grade g join g.user u join g.course c where u.id=:userId and c.id=:courseId", Grade.class);
				query.setParameter("userId", user.getId());
				query.setParameter("courseId", course.getId());
				List<Grade> grade = query.getResultList();
				if (grade.size() > 0) {
					return grade.get(0);
				}
				else {
					return null;
				}
			}
		});
		return list;
	}
}