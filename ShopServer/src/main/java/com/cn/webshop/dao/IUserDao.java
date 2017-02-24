package com.cn.webshop.dao;

import java.util.List;

import com.cn.webshop.pojo.entity.User;

public interface IUserDao {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	List<User> selectAllUser();
}