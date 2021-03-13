package com.app.bookcart.dao;

import java.util.List;

import com.app.bookcart.entity.Users;




public interface UserDao {

	public void saveUser(Users theUser);
	public List<Users> getUsers();
	public Users getUserbyEmail(String theEmail);
	public Users getUser(String theUserId);

}
