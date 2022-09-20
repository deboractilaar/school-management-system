package com.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.Announcement;
import com.bean.Course;

public class AnnouncementDao {

	HibernateTemplate template;
	
	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Transactional
	public void saveAnnouncement(Announcement announcement) {
		template.save(announcement);
	}
	
	@Transactional
	public void updateAnnouncement(Announcement announcement) {
		template.update(announcement);
	}
	
	@Transactional
	public void deleteAnnouncement(Announcement announcement) {
		template.delete(announcement);
	}
	
	public Announcement getAnnouncementbyId(int id) {
		Announcement announcement = (Announcement) template.get(Announcement.class, id);
		return announcement;
	}
	
	public List<Announcement> getAnnouncementList() {
		List<Announcement> list = template.loadAll(Announcement.class);
		return list;
	}
	
	public Set<Announcement> getAnnouncementListbyCourse(final Course course) {
		Set<Announcement> list = template.execute(new HibernateCallback<Set<Announcement>>() {
			@Override
			public Set<Announcement> doInHibernate(Session session) throws HibernateException {
				TypedQuery<Announcement> query = session.createQuery("select a from Announcement a join a.course c where c.id=:courseId", Announcement.class);
				query.setParameter("courseId", course.getId());
				Set<Announcement> announcements = new HashSet<Announcement>(query.getResultList());
				return announcements;
			}
		});
		return list;
	}
}
