/**
 * 
 */
package com.form;

import java.util.ArrayList;
import java.util.List;

import com.entity.Category;
import com.entity.Product;
import com.entity.User;

/**
 * @author sapna
 *
 */
public class IndexForm {

	private List<Category> categoryList = new ArrayList<Category>();

	private List<Product> productList = new ArrayList<Product>();
	
	private List<Product> getAllProductsById = new  ArrayList<Product>();
	
	private List<User> userList = new ArrayList<User>();
	
	/**
	 * @return the categoryList
	 */
	public List<Category> getCategoryList() {
		return categoryList;
	}

	/**
	 * @param categoryList the categoryList to set
	 */
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	/**
	 * @return the productList
	 */
	public List<Product> getProductList() {
		return productList;
	}

	/**
	 * @param productList the productList to set
	 */
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	/**
	 * @return the getAllProductsById
	 */
	public List<Product> getGetAllProductsById() {
		return getAllProductsById;
	}

	/**
	 * @param getAllProductsById the getAllProductsById to set
	 */
	public void setGetAllProductsById(List<Product> getAllProductsById) {
		this.getAllProductsById = getAllProductsById;
	}

	/**
	 * @return the userList
	 */
	public List<User> getUserList() {
		return userList;
	}

	/**
	 * @param userList the userList to set
	 */
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	
	

}
