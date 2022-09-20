package com.dao;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.TypedQuery;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.bean.Attachment;
import com.bean.Course;

public class AttachmentDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	HibernateTemplate template;
	 
	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	@Transactional
	public void saveAttachment(Attachment attachment) {
		attachment.setFileBlob(Hibernate.getLobCreator(sessionFactory.getCurrentSession()).createBlob(attachment.getInputStream(), attachment.getFileSize()));
		template.save(attachment);
	}
	
	@Transactional
	public void updateAttachment(Attachment attachment) {
		template.update(attachment);
	}
	
	@Transactional
	public void deleteAttachment(Attachment attachment) {
		template.delete(attachment);
	}
	
	public Attachment getAttachmentbyId(int id) {
		Attachment attachment = (Attachment) template.get(Attachment.class, id);
		return attachment;
	}
	
	public List<Attachment> getAttachmentList() {
		List<Attachment> list = new ArrayList<Attachment>();
		list = template.loadAll(Attachment.class);
		return list;
	}
	
	public Set<Attachment> getAttachmentListbyCourse(final Course course) {
		Set<Attachment> list = template.execute(new HibernateCallback<Set<Attachment>>() {
			@Override
			public Set<Attachment> doInHibernate(Session session) throws HibernateException {
				TypedQuery<Attachment> query = session.createQuery("select a from Attachment a join a.course c where c.id=:courseId", Attachment.class);
				query.setParameter("courseId", course.getId());
				Set<Attachment> attachments = new LinkedHashSet<Attachment>(query.getResultList());
				return attachments;
			}
		});
		return list;
	}
}