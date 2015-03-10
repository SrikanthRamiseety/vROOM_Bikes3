package com.spaneos.vb.pojo;

public class Order {
	int id;
	String Bikename;
	double price;
	double totalprice;
	int quantiy;
	double grandprice;
	String name;
	String place;
	String  mobile;
	public String getBikename() {
		return Bikename;
	}
	public void setBikename(String bikename) {
		Bikename = bikename;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}
	public int getQuantiy() {
		return quantiy;
	}
	public void setQuantiy(int quantiy) {
		this.quantiy = quantiy;
	}
	public double getGrandprice() {
		return grandprice;
	}
	public void setGrandprice(double grandprice) {
		this.grandprice = grandprice;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String  mobile) {
		this.mobile = mobile;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", Bikename=" + Bikename + ", price="
				+ price + ", totalprice=" + totalprice + ", quantiy=" + quantiy
				+ ", grandprice=" + grandprice + ", name=" + name + ", place="
				+ place + ", mobile=" + mobile + "]";
	}

}
