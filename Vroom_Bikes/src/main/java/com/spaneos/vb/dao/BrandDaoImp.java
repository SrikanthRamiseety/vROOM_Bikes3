
package com.spaneos.vb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.spaneos.vb.inf.BrandDaoInf;
import com.spaneos.vb.pojo.Brand;

public class BrandDaoImp implements BrandDaoInf {
	private static BrandDaoInf brandDaoImp = null;
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DaoUtil daoUtil = DaoUtil.getObject();
	
	private BrandDaoImp() {
		
	}
	
	public static BrandDaoInf getInstance() {
		if(brandDaoImp == null)
			brandDaoImp = new BrandDaoImp();
		
		return brandDaoImp;
	}

	public List<Brand> getAllBrands() {
		List<Brand> brandsList = new ArrayList<Brand>();
		Brand brand = null;
		
		try {
			con = daoUtil.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(GET_ALL_BRANDS);
			
			while(rs.next()) {
				brand = new Brand();
				
				brand.setBrandId(rs.getString(BRAND_ID));
				brand.setBrandName(rs.getString(BRAND_NAME));
				
				brandsList.add(brand);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return brandsList;
	}

	public boolean addBrand(Brand brand) {
		try {
			con = daoUtil.getConnection();
			pstmt = con.prepareStatement(ADD_BRAND);
			pstmt.setInt(1, Integer.parseInt(brand.getBrandId()));
			pstmt.setString(2, brand.getBrandName());
			
			int rows = pstmt.executeUpdate();
			
			if(rows > 0)
				return true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Brand> getBrandsBySearchStr(String searchStr) {
		List<Brand> brandsList = new ArrayList<Brand>();
		Brand brand = null;

		try {
			con = daoUtil.getConnection();
			pstmt = con.prepareStatement(GET_BRANDS_BY_SEARCH_STR);
			pstmt.setString(1, "%"+searchStr+"%");

			rs = pstmt.executeQuery();

			while(rs.next()) {
				brand = new Brand();
				
				brand.setBrandId(rs.getString(BRAND_ID));
				brand.setBrandName(rs.getString(BRAND_NAME));
				
				brandsList.add(brand);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return brandsList;
	}

}
