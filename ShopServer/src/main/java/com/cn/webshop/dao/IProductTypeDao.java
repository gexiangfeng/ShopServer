package com.cn.webshop.dao;

import com.cn.webshop.pojo.entity.ProductType;

public interface IProductTypeDao {
    int deleteByPrimaryKey(Byte productTypeId);

    int insert(ProductType record);

    int insertSelective(ProductType record);

    ProductType selectByPrimaryKey(Byte productTypeId);

    int updateByPrimaryKeySelective(ProductType record);

    int updateByPrimaryKey(ProductType record);
}