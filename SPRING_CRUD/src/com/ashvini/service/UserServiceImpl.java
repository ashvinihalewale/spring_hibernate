package com.ashvini.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ashvini.dao.UserDao;
import com.ashvini.domain.User;
import com.ashvini.domain.UserType;

@Repository("userService")
public class UserServiceImpl implements UserService
{

	@Autowired
	private UserDao userDao;
	@Override
	public void saveUser(User user)
	{
		userDao.saveUser(user);
	}

	@Override
	public List<User> getUsers()
	{
		return userDao.getUsers();
	}

	@Override
	public User getUser(int id)
	{
		return userDao.getUser(id);
	}

	@Override
	public void deleteUser(int id)
	{
		userDao.deleteUser(id);
	}

	@Override
	public List<UserType> getUserTypes() 
	{
		return userDao.getUserTypes();
	}

	@Override
	public UserType getUserType(int id) 
	{
		return userDao.getUserType(id);
	}
}