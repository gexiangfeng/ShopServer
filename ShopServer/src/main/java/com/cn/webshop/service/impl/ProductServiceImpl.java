package com.cn.webshop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.webshop.dao.IProductDao;
import com.cn.webshop.pojo.entity.Product;
import com.cn.webshop.service.IProductService;

@Service("productService")
public class ProductServiceImpl implements IProductService {

	@Resource
	private IProductDao productDao;
	@Override
	public int deleteByPrimaryKey(Integer productId) {
		// TODO Auto-generated method stub
		return this.productDao.deleteByPrimaryKey(productId);
	}

	@Override
	public int insert(Product record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Product record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Product selectByPrimaryKey(Integer productId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Product record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Product record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Product> selectSelectives() {
		// TODO Auto-generated method stub
		return this.productDao.selectSelectives();
	}

}
