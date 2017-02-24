package com.cn.webshop.dao;

import com.cn.webshop.pojo.entity.Category;

public interface ICategoryDao {
    int deleteByPrimaryKey(Short categoryId);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Short categoryId);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
}