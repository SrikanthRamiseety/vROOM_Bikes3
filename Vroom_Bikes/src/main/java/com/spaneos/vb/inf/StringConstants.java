package com.spaneos.vb.inf;

public interface StringConstants {
	String GET_ALL_BRANDS = "select * from brand";
	String GET_BRAND_ID = "select brandId from brand where brandName =?";
	String ADD_BRAND = "insert into brand(brandId,brandName) values (?,?)";
	String GET_BRANDS_BY_SEARCH_STR = "select * from brand where brandName like ?";
	
	String GET_ALL_BIKES = "select bi.bikeId,bi.bikeName,br.brandName,bi.bikePrice,bi.cc from bike bi, brand br where bi.bikeBrand = br.BrandId";
	String GET_BIKES_BY_BRAND = "select bi.bikeId,bi.bikeName,br.brandName,bi.bikePrice,bi.cc from bike bi, brand br where bi.bikeBrand = br.BrandId and br.brandName = ?";
	String ADD_BIKE = "insert into bike(bikeId,bikeName,bikeBrand,bikePrice,cc) values (?,?,?,?,?)";
	String DELETE_BIKE = "delete from bike where bikeId = ?";
	String UPDATE_BIKE = "update bike set bikeName = ?, bikeBrand = ?, bikePrice = ?, cc = ? where bikeId = ?";
	String GET_BIKES_BY_BUDGET = "select bi.bikeId,bi.bikeName,br.brandName,bi.bikePrice,bi.cc from bike bi, brand br where bi.bikeBrand = br.BrandId and bi.bikePrice > ? and bi.price < ?";
	String GET_BIKE_BY_ID="select bi.bikeId,bi.bikeName,br.brandName,bi.bikePrice,bi.cc from bike bi, brand br where bi.bikeBrand = br.BrandId and bi.bikeId=?";
	String GET_BIKES_BY_SEARCH_STR = "select bi.bikeId,bi.bikeName,br.brandName,bi.bikePrice,bi.cc from bike bi, brand br where bi.bikeBrand = br.BrandId and bi.bikeName like %?%";
	
	String BIKE_ID = "bikeId";
	String BIKE_NAME = "bikeName";
	String BIKE_BRAND = "bikeBrand";
	String BIKE_PRICE = "bikePrice";
	String BIKE_CC = "cc";
	
	String BRAND_ID = "brandId";
	String BRAND_NAME = "brandName";
}
