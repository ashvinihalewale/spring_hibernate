package com.ashvini.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ashvini.dao.UserDao;
import com.ashvini.domain.User;
import com.ashvini.domain.UserType;
import com.ashvini.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController
{
	@Autowired
	private UserService userService;
	@RequestMapping(value="/users", method=RequestMethod.GET)
	public String users(ModelMap model)
	{
		model.addAttribute("users", userService.getUsers()); // to send list object to JSP
		
		return "userList"; // jsp page name
	}
	
	@RequestMapping("/adduser")
	public String addEditUser(@ModelAttribute("user") User user, ModelMap model)
	{
		model.addAttribute("userTypes", userService.getUserTypes());
		System.out.println(user.toString());
		return ("userAddEdit");
	}
	
	@RequestMapping(value="/saveuser")
	public void saveUser(@ModelAttribute("user") User user,BindingResult result, HttpServletResponse  httpServletResponse ) throws IOException
	{
		System.out.println(user.toString());
		userService.saveUser(user);
		httpServletResponse.sendRedirect("users");
	}
	
	@RequestMapping(value="/edituser/{id}", method=RequestMethod.GET)
	public String editUser(@PathVariable("id") int id, ModelMap model)
	{
		model.addAttribute("userTypes", userService.getUserTypes());
		model.addAttribute("user", userService.getUser(id));
		return ("userAddEdit");
	}
	
	@RequestMapping(value="/deleteuser/{id}", method=RequestMethod.GET)
	public void deleteUser(@PathVariable("id") int id, HttpServletResponse response) throws IOException
	{
		userService.deleteUser(id);
		response.sendRedirect("users");
	}
}
