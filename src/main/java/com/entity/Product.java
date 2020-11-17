package com.entity;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "products")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int prodId;
	private String prodName;
	@Column(length = 3000)
	private String prodDesc;
	@Lob
	private byte[] prodPic;
	@Transient
	private String base64Image;
	@Transient
	private int prodPriceAfterDisc;
	private Integer prodPrice;
	private Integer prodDiscount;
	private Integer prodQty;
	@ManyToOne
	@JoinColumn(name = "categoryId")
	private Category category;

	public Product() {
		super();

	}

	/**
	 * @return the prodId
	 */
	public int getProdId() {
		return prodId;
	}

	/**
	 * @param prodId
	 *            the prodId to set
	 */
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}

	/**
	 * @return the prodName
	 */
	public String getProdName() {
		return prodName;
	}

	/**
	 * @param prodName
	 *            the prodName to set
	 */
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	/**
	 * @return the prodDesc
	 */
	public String getProdDesc() {
		return prodDesc;
	}

	/**
	 * @param prodDesc
	 *            the prodDesc to set
	 */
	public void setProdDesc(String prodDesc) {
		this.prodDesc = prodDesc;
	}

	/**
	 * @return the prodPic
	 */
	public byte[] getProdPic() {
		return prodPic;
	}

	/**
	 * @param prodPic
	 *            the prodPic to set
	 */
	public void setProdPic(byte[] prodPic) {
		this.prodPic = prodPic;
	}

	/**
	 * @return the base64Image
	 */
	public String getBase64Image() {
		return base64Image;
	}

	/**
	 * @param base64Image
	 *            the base64Image to set
	 */
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}

	/**
	 * @return the prodPriceAfterDisc
	 */
	public int getProdPriceAfterDisc() {
		return prodPriceAfterDisc;
	}

	/**
	 * @param prodPriceAfterDisc
	 *            the prodPriceAfterDisc to set
	 */
	public void setProdPriceAfterDisc(int prodPriceAfterDisc) {
		this.prodPriceAfterDisc = prodPriceAfterDisc;
	}

	/**
	 * @return the prodPrice
	 */
	public Integer getProdPrice() {
		return prodPrice;
	}

	/**
	 * @param prodPrice
	 *            the prodPrice to set
	 */
	public void setProdPrice(Integer prodPrice) {
		this.prodPrice = prodPrice;
	}

	/**
	 * @return the prodDiscount
	 */
	public Integer getProdDiscount() {
		return prodDiscount;
	}

	/**
	 * @param prodDiscount
	 *            the prodDiscount to set
	 */
	public void setProdDiscount(Integer prodDiscount) {
		this.prodDiscount = prodDiscount;
	}

	/**
	 * @return the prodQty
	 */
	public Integer getProdQty() {
		return prodQty;
	}

	/**
	 * @param prodQty
	 *            the prodQty to set
	 */
	public void setProdQty(Integer prodQty) {
		this.prodQty = prodQty;
	}

	/**
	 * @return the category
	 */
	public Category getCategory() {
		return category;
	}

	/**
	 * @param category
	 *            the category to set
	 */
	public void setCategory(Category category) {
		this.category = category;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Product [prodId=" + prodId + ", prodName=" + prodName + ", prodDesc=" + prodDesc + ", prodPic="
				+ Arrays.toString(prodPic) + ", base64Image=" + base64Image + ", prodPriceAfterDisc="
				+ prodPriceAfterDisc + ", prodPrice=" + prodPrice + ", prodDiscount=" + prodDiscount + ", prodQty="
				+ prodQty + ", category=" + category + "]";
	}

}
