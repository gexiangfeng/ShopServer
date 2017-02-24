package com.cn.webshop.service;

import java.util.List;

import com.cn.webshop.pojo.entity.Product;

public interface IProductService {
    int deleteByPrimaryKey(Integer productId);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer productId);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
    
    List<Product> selectSelectives();

}
