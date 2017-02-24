package com.cn.webshop.dao;

import com.cn.webshop.pojo.entity.ProductStyle;

public interface IProductStyleDao {
    int deleteByPrimaryKey(Byte productStyleId);

    int insert(ProductStyle record);

    int insertSelective(ProductStyle record);

    ProductStyle selectByPrimaryKey(Byte productStyleId);

    int updateByPrimaryKeySelective(ProductStyle record);

    int updateByPrimaryKey(ProductStyle record);
}