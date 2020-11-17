package com.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryId;
	private String cateTitle;
	private String cateDesc;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "category")
	private List<Product> products = new ArrayList<Product>();

	public Category() {
		super();

	}

	public Category(int categoryId, String cateTitle, String cateDesc, List<Product> products) {
		super();
		this.categoryId = categoryId;
		this.cateTitle = cateTitle;
		this.cateDesc = cateDesc;
		this.products = products;
	}

	/**
	 * @return the categoryId
	 */
	public int getCategoryId() {
		return categoryId;
	}

	/**
	 * @param categoryId
	 *            the categoryId to set
	 */
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * @return the cateTitle
	 */
	public String getCateTitle() {
		return cateTitle;
	}

	/**
	 * @param cateTitle
	 *            the cateTitle to set
	 */
	public void setCateTitle(String cateTitle) {      
		this.cateTitle = cateTitle;
	}

	/**
	 * @return the cateDesc
	 */
	public String getCateDesc() {
		return cateDesc;
	}

	/**
	 * @param cateDesc
	 *            the cateDesc to set
	 */
	public void setCateDesc(String cateDesc) {
		this.cateDesc = cateDesc;
	}

	/**
	 * @return the products
	 */
	public List<Product> getProducts() {
		return products;
	}

	/**
	 * @param products
	 *            the products to set
	 */
	public void setProducts(List<Product> products) {
		this.products = products;
	}

}
