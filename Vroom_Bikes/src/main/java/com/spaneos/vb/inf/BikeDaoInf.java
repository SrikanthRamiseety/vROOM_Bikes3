package com.spaneos.vb.inf;

import java.util.List;

import com.spaneos.vb.pojo.Bike;

public interface BikeDaoInf extends StringConstants{
	boolean addBike(Bike bike);
	boolean deleteBike(String bikeId);
	boolean updateBike(Bike bike);
	List<Bike> getBikesByBrand(String bikeBrand);
	List<Bike> getBikesByBudget(double minPrice, double maxPrice);
	List<Bike> getAllBikes();
	Bike getdetils(String id); 
	List<Bike> getBikesBySearchStr(String searchStr);
}
