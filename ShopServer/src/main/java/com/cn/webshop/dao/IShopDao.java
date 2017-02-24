package com.cn.webshop.dao;

import com.cn.webshop.pojo.entity.Shop;

public interface IShopDao {
    int deleteByPrimaryKey(Byte shopId);

    int insert(Shop record);

    int insertSelective(Shop record);

    Shop selectByPrimaryKey(Byte shopId);

    int updateByPrimaryKeySelective(Shop record);

    int updateByPrimaryKey(Shop record);
}