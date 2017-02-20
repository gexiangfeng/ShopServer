package com.cn.webshop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.webshop.dao.IUserDao;
import com.cn.webshop.pojo.User;
import com.cn.webshop.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Resource
	private IUserDao userDao;
	@Override
	public User getUserById(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.selectByPrimaryKey(userId);
	}
	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return this.userDao.selectAllUser();
	}
	@Override
	public int insertUser(User record) {
		// TODO Auto-generated method stub
		return this.userDao.insertSelective(record);
	}
	@Override
	public boolean isUserExist(User user) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public void updateUser(User currentUser) {
		// TODO Auto-generated method stub
		this.userDao.updateByPrimaryKey(currentUser);
	}
	@Override
	public void deleteUserById(int id) {
		// TODO Auto-generated method stub
		this.userDao.deleteByPrimaryKey(id);
	}

}
