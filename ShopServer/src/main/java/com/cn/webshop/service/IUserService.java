package com.cn.webshop.service;

import java.util.List;

import com.cn.webshop.pojo.entity.User;

public interface IUserService {
	
	public User getUserById(int userId);
	
	public List<User> getAllUser();
	
	public int insertUser(User record);

	public boolean isUserExist(User user);

	public void updateUser(User currentUser);

	public void deleteUserById(int id);

}
