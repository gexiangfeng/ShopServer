package com.cn.webshop.dao;

import com.cn.webshop.pojo.entity.Supplier;

public interface ISupplierDao {
    int deleteByPrimaryKey(Byte supplierId);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(Byte supplierId);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);
}