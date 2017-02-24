package com.cn.webshop.dao;

import com.cn.webshop.pojo.entity.SellType;

public interface ISellTypeDao {
    int deleteByPrimaryKey(Byte sellTypeId);

    int insert(SellType record);

    int insertSelective(SellType record);

    SellType selectByPrimaryKey(Byte sellTypeId);

    int updateByPrimaryKeySelective(SellType record);

    int updateByPrimaryKey(SellType record);
}