package com.form;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public class CatPrdForm {
	private String category;
	private String operate;
	private int categoryId;
	private String cateTitle;
	private String cateDesc;
	private int prodId;
	private String prodName;
	private String prodDesc;
	private MultipartFile prodPic;
	private Integer prodPrice = 0;
	private Integer prodDiscount = 0;
	private Integer prodQty =0;
	private String base64Image;
	private Map<String, String> cateList = new HashMap<String, String>();
	private String message;

	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}

	/**
	 * @param category
	 *            the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}

	/**
	 * @return the operate
	 */
	public String getOperate() {
		return operate;
	}

	/**
	 * @param operate
	 *            the operate to set
	 */
	public void setOperate(String operate) {
		this.operate = operate;
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
	public MultipartFile getProdPic() {
		return prodPic;
	}

	/**
	 * @param prodPic
	 *            the prodPic to set
	 */
	public void setProdPic(MultipartFile prodPic) {
		this.prodPic = prodPic;
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
	 * @return the cateList
	 */
	public Map<String, String> getCateList() {
		return cateList;
	}

	/**
	 * @param cateList
	 *            the cateList to set
	 */
	public void setCateList(Map<String, String> cateList) {
		this.cateList = cateList;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message
	 *            the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	public void addCateList(String key, String value) {
		if (key != null && value != null)
			this.cateList.put(key, value);
	}

}
