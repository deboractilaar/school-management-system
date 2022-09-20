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
import com.bean.User;

public class UserDao {
	
	HibernateTemplate template;
	
	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Transactional
	public void saveUser(User user) {
		template.save(user);
	}
	
	@Transactional
	public void updateUser(User user) {
		template.update(user);
	}
	
	@Transactional
	public void deleteUser(User user) {
		template.delete(user);
	}
	
	public User getUserbyId(int id) {
		User user = (User) template.get(User.class, id);
		return user;
	}
	
	public List<User> getUserList() {
		List<User> list = template.loadAll(User.class);
		return list;
	}
	
	public User authentication(final User user) {
		User userDetail = template.execute(new HibernateCallback<User>() {
			@Override
			public User doInHibernate(Session session) throws HibernateException {
				TypedQuery<User> query = session.createQuery("select u from User u where u.email=:email and u.password=:password", User.class);
				query.setParameter("email", user.getEmail());
				query.setParameter("password", user.getPassword());
				List<User> users = query.getResultList();
				if (users.size() > 0) {
					return users.get(0);
				}
				else {
					return null;
				}
			}
		});
		if (userDetail != null && user.getPassword().equals(userDetail.getPassword())) {
			return userDetail;
		}
		return null;
	}
	
	public Set<User> getUserListbyCourse(final Course course) {
		Set<User> list = template.execute(new HibernateCallback<Set<User>>() {
			@Override
			public Set<User> doInHibernate(Session session) throws HibernateException {
				TypedQuery<User> query = session.createQuery("select u from User u join u.courses c where c.id=:courseId", User.class);
				query.setParameter("courseId", course.getId());
				Set<User> users = new LinkedHashSet<User>(query.getResultList());
				return users;
			}
		});
		return list;
	}
	
	public Set<User> getStudentListbyCourse(final Course course) {
		Set<User> list = template.execute(new HibernateCallback<Set<User>>() {
			@Override
			public Set<User> doInHibernate(Session session) throws HibernateException {
				TypedQuery<User> query = session.createQuery("select u from User u join u.courses c where c.id=:courseId and u.type=:type", User.class);
				query.setParameter("courseId", course.getId());
				query.setParameter("type", "student");
				Set<User> students = new LinkedHashSet<User>(query.getResultList());
				return students;
			}
		});
		return list;
	}
}
