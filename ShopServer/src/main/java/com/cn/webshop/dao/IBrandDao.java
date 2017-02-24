package com.cn.webshop.dao;

import com.cn.webshop.pojo.entity.Brand;

public interface IBrandDao {
    int deleteByPrimaryKey(Byte brandId);

    int insert(Brand record);

    int insertSelective(Brand record);

    Brand selectByPrimaryKey(Byte brandId);

    int updateByPrimaryKeySelective(Brand record);

    int updateByPrimaryKey(Brand record);
}