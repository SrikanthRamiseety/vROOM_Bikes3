package com.spaneos.vb.pojo;

public class PurchaseDetails {
	
	String orderId;
	String productName;
	String userName;
	String address;
	String date;
	
	public PurchaseDetails() {
		// TODO Auto-generated constructor stub
	}

	public PurchaseDetails(String orderId, String productName, String userName,
			String address, String date) {
		super();
		this.orderId = orderId;
		this.productName = productName;
		this.userName = userName;
		this.address = address;
		this.date = date;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	

}
