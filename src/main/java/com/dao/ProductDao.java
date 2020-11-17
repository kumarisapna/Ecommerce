package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;


import com.entity.Product;

@Component
public class ProductDao {
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	
	
	//save product
			@Transactional
			public void createProduct(Product product){
				this.hibernateTemplate.saveOrUpdate(product);
				
			}
			
			//get all products
			
			public List<Product> getProduct(){
				List<Product> products = this.hibernateTemplate.loadAll(Product.class);
				
				return products;
				
				}
			
			
			
		
}
