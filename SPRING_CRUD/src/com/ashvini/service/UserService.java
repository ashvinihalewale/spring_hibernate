package com.ashvini.service;

import java.util.List;

import com.ashvini.domain.User;
import com.ashvini.domain.UserType;

public interface UserService
{
	public void saveUser(User user);
	public List<User> getUsers();
	public User getUser(int id);
	public void deleteUser(int id);
	
	public List<UserType> getUserTypes();
	public UserType getUserType(int id);
}
