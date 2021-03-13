package com.app.bookcart.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.bookcart.dao.UserDao;
import com.app.bookcart.entity.Users;



@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;

	@Override
	@Transactional
	public void saveUser(Users theUser) {
		// TODO Auto-generated method stub
		userDao.saveUser(theUser);

	}

	@Override
	@Transactional
	public List<Users> getUsers() {
		// TODO Auto-generated method stub
		return userDao.getUsers();
	}

	@Override
	@Transactional
	public Users validateUser(Users theUser) {
		// TODO Auto-generated method stub
		Users userFound = null;
		System.out.println("username: "+theUser.getUserId()+"password:"+theUser.getPassword());

		List<Users> usersFromDB=userDao.getUsers();
		for(Users user:usersFromDB) {
			if(user.getUserId().equals(theUser.getUserId()) && 
					user.getPassword().equals(theUser.getPassword())) {

				userFound=user;

			}
		}

		return userFound;
	}

	@Override
	@Transactional
	public Users getUser(String  theUserId) {
		// TODO Auto-generated method stub
		return userDao.getUser(theUserId);
	}
	@Override
	@Transactional
	public Users getUserbyEmail(String theEmail) {
		// TODO Auto-generated method stub
		return userDao.getUserbyEmail(theEmail);
	}


}
