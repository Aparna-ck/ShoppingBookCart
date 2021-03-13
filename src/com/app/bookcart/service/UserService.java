package com.app.bookcart.service;

import java.util.List;

import com.app.bookcart.entity.Users;



public interface UserService {

	public void saveUser(Users theUser);
	public List<Users> getUsers();
	public Users validateUser(Users theUser);
	public Users getUserbyEmail(String theEmail);
	public Users getUser(String theUserId);

}
