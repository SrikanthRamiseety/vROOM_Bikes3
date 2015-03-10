package com.spaneos.vb.pojo;

public class Bike {
	
	String bikeId;
	String bikeName;
	String bikeBrand;
	int quantity;

	double price;
	double totalPrice;
	String cc;
	
	public Bike() {
		// TODO Auto-generated constructor stub
	}

	public Bike(String bikeId, String bikeName, String bikeBrand, double price,
			String cc) {
		super();
		this.bikeId = bikeId;
		this.bikeName = bikeName;
		this.bikeBrand = bikeBrand;
		this.price = price;
		this.cc = cc;
	}

	public String getBikeId() {
		return bikeId;
	}

	public void setBikeId(String bikeId) {
		this.bikeId = bikeId;
	}

	public String getBikeName() {
		return bikeName;
	}

	public void setBikeName(String bikeName) {
		this.bikeName = bikeName;
	}

	public String getBikeBrand() {
		return bikeBrand;
	}

	public void setBikeBrand(String bikeBrand) {
		this.bikeBrand = bikeBrand;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getCc() {
		return cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
	}

	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "Bike [bikeId=" + bikeId + ", bikeName=" + bikeName
				+ ", bikeBrand=" + bikeBrand + ", price=" + price + ", cc="
				+ cc + "]";
	}
	
	

}
