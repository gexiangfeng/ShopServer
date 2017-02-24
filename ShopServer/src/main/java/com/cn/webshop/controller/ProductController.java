package com.cn.webshop.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

import com.cn.webshop.pojo.entity.Product;
import com.cn.webshop.service.IProductService;

@Controller
public class ProductController {

	@Resource
	private IProductService productService;
	
	@RequestMapping(value = "/product/", method = RequestMethod.GET)
	public ResponseEntity<List<Product>> listAllProducts(@RequestBody String param) {
		List<Product> products = productService.selectSelectives();
		if(products.isEmpty()){
			return new ResponseEntity<List<Product>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Product>>(products,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/product", method = RequestMethod.POST)
    public ResponseEntity<Void> createProduct(@RequestBody Product product,    UriComponentsBuilder ucBuilder) {
    	System.out.println("Creating Product " + product.getName());
    	 	
 
        productService.insertSelective(product);
 
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/product/{id}").buildAndExpand(product.getProductId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
	
	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public ResponseEntity<Product> listProduct(@PathVariable("id") int id,@RequestBody String param) {
		Product product = productService.selectByPrimaryKey(id);
		if(product == null){
			return new ResponseEntity<Product>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Product>(product,HttpStatus.OK);
	}
	
}
