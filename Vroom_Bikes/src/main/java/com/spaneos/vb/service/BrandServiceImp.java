package com.spaneos.vb.service;

import java.util.List;

import com.spaneos.vb.dao.BrandDaoImp;
import com.spaneos.vb.inf.BrandDaoInf;
import com.spaneos.vb.inf.BrandServiceInf;
import com.spaneos.vb.pojo.Brand;

public class BrandServiceImp implements BrandServiceInf {
	private static BrandServiceInf brandServiceImp = null;
	private BrandDaoInf brandDaoImp = BrandDaoImp.getInstance();
	
	private BrandServiceImp() {
		
	}
	
	public static BrandServiceInf getInstance() {
		if(brandServiceImp == null)
			brandServiceImp = new BrandServiceImp();
		
		return brandServiceImp;
	}

	public List<Brand> getAllBrands() {
		return brandDaoImp.getAllBrands();
	}

	public boolean addBrand(Brand brand) {
		return brandDaoImp.addBrand(brand);
	}

	@Override
	public List<Brand> getBrandsBySearchStr(String searchStr) {
		return brandDaoImp.getBrandsBySearchStr(searchStr);
	}

}
