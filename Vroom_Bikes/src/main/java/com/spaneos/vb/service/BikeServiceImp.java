package com.spaneos.vb.service;

import java.util.List;

import com.spaneos.vb.dao.BikeDaoImp;
import com.spaneos.vb.inf.BikeDaoInf;
import com.spaneos.vb.inf.BikeServiceInf;
import com.spaneos.vb.pojo.Bike;

public class BikeServiceImp implements BikeServiceInf {
	private static BikeServiceInf bikeServiceImp = null;
	private BikeDaoInf bikeDaoImp = BikeDaoImp.getInstance();
		
	private BikeServiceImp() {
		
	}
	
	public static BikeServiceInf getInstance() {
		if(bikeServiceImp == null)
			bikeServiceImp = new BikeServiceImp();
		
		return bikeServiceImp;
	}

	public boolean addBike(Bike bike) {
		System.out.println(bike);
		return bikeDaoImp.addBike(bike);
	}

	public boolean deleteBike(String bikeId) {
		return bikeDaoImp.deleteBike(bikeId);
	}

	public boolean updateBike(Bike bike) {
		return bikeDaoImp.updateBike(bike);
	}

	public List<Bike> getBikesByBrand(String bikeBrand) {
		return bikeDaoImp.getBikesByBrand(bikeBrand);
	}

	public List<Bike> getBikesByBudget(double minPrice, double maxPrice) {
		return bikeDaoImp.getBikesByBudget(minPrice, maxPrice);
	}

	public List<Bike> getAllBikes() {
		return bikeDaoImp.getAllBikes();
	}

	public Bike getdetils(String id) {
		 
		return bikeDaoImp.getdetils(id);
	}

	@Override
	public List<Bike> getBikesBySearchStr(String searchStr) {
		return bikeDaoImp.getBikesBySearchStr(searchStr);
	}
}
