package com.spaneos.vb.inf;

import java.util.List;

import com.spaneos.vb.pojo.Bike;
import com.spaneos.vb.pojo.Brand;

public interface BrandServiceInf extends StringConstants {
	List<Brand> getAllBrands();

	boolean addBrand(Brand brand);
	
	List<Brand> getBrandsBySearchStr(String searchStr);
}
