package com.cn.webshop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cn.webshop.pojo.entity.Product;
@Repository(value="IProductDao")
public interface IProductDao {
    int deleteByPrimaryKey(Integer productId);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer productId);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
    
    List<Product> selectSelectives();
}