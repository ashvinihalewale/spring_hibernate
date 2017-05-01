package com.ashvini.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

public class GenericDao 
{
	@Autowired
	static SessionFactory sessionFactory;
	
	static Session session = null;
	static Transaction transaction = null;

	public static void saveObject(Object object) 
	{
		if(object != null)
		{
			try
			{
				session = sessionFactory.openSession();
				transaction = session.beginTransaction();
				session.save(object);
				transaction.commit();
			}
			catch (HibernateException he) 
			{
				transaction.rollback();
				he.printStackTrace();
			}
			finally 
			{
				session.close();
			}
		}
	}
	
	public static void updateObject(Object object) 
	{
		if(object != null)
		{
			try
			{
				session = sessionFactory.openSession();
				transaction = session.beginTransaction();
				session.update(object);
				transaction.commit();
			}
			catch (HibernateException he) 
			{
				transaction.rollback();
				he.printStackTrace();
			}
			finally 
			{
				session.close();
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public static List<Object> getObjects(Object object)
	{
		List<Object> objects = null;
		try
		{
			session = sessionFactory.openSession();
			Query query = session.createQuery("from "+object);			
			objects = query.list();
		}
		catch (HibernateException he) 
		{
			he.printStackTrace();
		}
		finally {
			session.close();
		}
		return objects;	
	}
	
	
	// Generic Methods
	@SuppressWarnings("unchecked")
	public static <T> T save(final T object)
	{
		return (T) sessionFactory.getCurrentSession().save(object);
	}
	
	public static void delete(final Object object)
	{
		session = sessionFactory.openSession();
		transaction = session.beginTransaction();
		session.delete(object);
		transaction.commit();
		session.close();
	}
	
	@SuppressWarnings("unchecked")
	public static <T> T get(final Class<T> type, final long id)
	{
		return (T) sessionFactory.getCurrentSession().get(type, id);
	}
	
	@SuppressWarnings("unchecked")
	public static <T> List<T> getAll(final Class<T> type)
	{
		final Session session = sessionFactory.openSession();
		final Criteria criteria = session.createCriteria(type);
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public static <T> T merge(final T object)
	{
		return (T) sessionFactory.getCurrentSession().merge(object);
	}
	
	
	public static <T> void saveUpdate(final T object)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(object);
	}	

}
