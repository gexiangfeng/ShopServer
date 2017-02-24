package com.cn.webshop.dao;

import com.cn.webshop.pojo.entity.ProductStory;

public interface IProductStoryDao {
    int deleteByPrimaryKey(Byte productStoryId);

    int insert(ProductStory record);

    int insertSelective(ProductStory record);

    ProductStory selectByPrimaryKey(Byte productStoryId);

    int updateByPrimaryKeySelective(ProductStory record);

    int updateByPrimaryKey(ProductStory record);
}