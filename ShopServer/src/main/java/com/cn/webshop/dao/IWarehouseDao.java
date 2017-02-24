package com.cn.webshop.dao;

import com.cn.webshop.pojo.entity.Warehouse;

public interface IWarehouseDao {
    int deleteByPrimaryKey(Byte warehouseId);

    int insert(Warehouse record);

    int insertSelective(Warehouse record);

    Warehouse selectByPrimaryKey(Byte warehouseId);

    int updateByPrimaryKeySelective(Warehouse record);

    int updateByPrimaryKey(Warehouse record);
}