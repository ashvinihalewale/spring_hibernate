package com.ashvini.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ashvini.domain.User;
import com.ashvini.domain.UserType;

@Repository("userDao")
public class UserDaoImpl implements UserDao
{
	@Autowired
	private SessionFactory sessionFactory;
	Session  session  = null;
	@Override
	public void saveUser(User user)
	{
		if(user != null)
		{
			session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			if(user.getId() <= 0)
			{
				session.save(user);
			}
			else
			{
				session.update(user);
			}
			tx.commit();
			session.close();
		}
	}

	@Override
	public List<User> getUsers()
	{
		List<User> users = GenericDao.getAll(User.class);
		return users;
	}

	@Override
	public User getUser(int id)
	{
		User user = null;
		if(id > 0)
		{
			session = sessionFactory.openSession();
			session.beginTransaction();
			user = (User) session.get(User.class, new Integer(id));
			session.close();
		}
		return user;
	}

	@Override
	public void deleteUser(int id)
	{
		if(id > 0)
		{
			session = sessionFactory.openSession();
			Transaction tx  = session.beginTransaction();
			User user = getUser(id);
			session.delete(user);
			tx.commit();
			session.close();
		}		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserType> getUserTypes() 
	{
		List<UserType> userTypes = null;
		session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery("From UserType");
		userTypes = query.list();
		session.close();
		return userTypes;
	}

	@Override
	public UserType getUserType(int id) 
	{
		UserType userType = null;
		if(id > 0)
		{
			session = sessionFactory.openSession();
			session.beginTransaction();
			userType = (UserType) session.get(User.class, new Integer(id));
			session.close();
		}
		return userType;
	}

}
