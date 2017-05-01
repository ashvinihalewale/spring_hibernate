package com.ashvini.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ashvini.domain.Question;
import com.ashvini.domain.Subject;

@Repository("questionDao")
public class QuestionDaoImpl extends GenericDao implements QuestionDao
{
	@Autowired
	private SessionFactory sessionFactory;
	Session session = null;
	Transaction transaction = null;

	@SuppressWarnings("unchecked")
	@Override
	public List<Subject> getSubjects()
	{
		List<Subject> subjects = null;
		try
		{
			session = sessionFactory.openSession();
			Criteria criteria = session.createCriteria(Subject.class);
			subjects = criteria.list();
		}
		catch (HibernateException he) 
		{
			he.printStackTrace();
		}
		finally {
			session.close();
		}
		return subjects;
	}

	@Override
	public Subject getSubject(int id) 
	{
		Subject subject = null;
		if(id > 0)
		{
			try
			{
				session = sessionFactory.openSession();
				subject = (Subject) session.get(Subject.class, new Integer(id));
			}
			catch (HibernateException he) 
			{
				he.printStackTrace();
			}
			finally {
				session.close();
			}
		}
		return subject;
	}

	@Override
	public void saveQuestion(Question question) 
	{
		if(question != null)
		{
			if(question.getId() <= 0)
			{
				GenericDao.saveObject(question);				
			}
			else
			{
				GenericDao.updateObject(question);
			}
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly=true)
	public List<Question> getQuestions()
	{
	
		List<Question> questions = null;
		try
		{
			session = sessionFactory.openSession();
			Criteria criteria = session.createCriteria(Question.class);			
			questions = criteria.list();
		}
		catch (HibernateException he) 
		{
			he.printStackTrace();
		}
		finally {
			session.close();
		}
		return questions;	
	}
	

	@Override
	public Question getQuestion(int id)
	{
		Question question = get(Question.class, id);
		return question;	
	}

	@Override
	public void deleteQuestion(int id) 
	{ 
		Question question = GenericDao.get(Question.class, id);
		delete(question);
	}
}
