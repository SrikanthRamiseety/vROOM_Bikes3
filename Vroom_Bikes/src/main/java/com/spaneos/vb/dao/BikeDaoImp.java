package com.spaneos.vb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.spaneos.vb.inf.BikeDaoInf;
import com.spaneos.vb.pojo.Bike;

public class BikeDaoImp implements BikeDaoInf {
	private static BikeDaoInf BikeDaoImp = null;
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DaoUtil daoUtil = DaoUtil.getObject();

	private BikeDaoImp() {

	}

	public static BikeDaoInf getInstance() {
		if (BikeDaoImp == null)
			BikeDaoImp = new BikeDaoImp();

		return BikeDaoImp;
	}

	public boolean addBike(Bike bike) {
		try {
			con = daoUtil.getConnection();
			pstmt = con.prepareStatement(GET_BRAND_ID);
			pstmt.setString(1, bike.getBikeBrand());

			rs = pstmt.executeQuery();
			int bikeBrandId = 0;

			if (rs.next())
				bikeBrandId = rs.getInt(BRAND_ID);

			System.out.println(bikeBrandId);

			pstmt = con.prepareStatement(ADD_BIKE);
			pstmt.setString(1, bike.getBikeId());
			pstmt.setString(2, bike.getBikeName());
			pstmt.setInt(3, bikeBrandId);
			pstmt.setDouble(4, bike.getPrice());
			pstmt.setString(5, bike.getCc());

			int rows = pstmt.executeUpdate();

			if (rows > 0)
				return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	public boolean deleteBike(String bikeId) {
		try {
			con = daoUtil.getConnection();
			pstmt = con.prepareStatement(DELETE_BIKE);
			pstmt.setString(1, bikeId);

			int rows = pstmt.executeUpdate();

			if (rows > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateBike(Bike bike) {
		try {
			con = daoUtil.getConnection();

			pstmt = con.prepareStatement(GET_BRAND_ID);
			pstmt.setString(1, bike.getBikeBrand());
			rs = pstmt.executeQuery();
			int bikeBrandId = 0;

			if (rs.next())
				bikeBrandId = rs.getInt(BRAND_ID);

			pstmt = con.prepareStatement(UPDATE_BIKE);
			pstmt.setString(1, bike.getBikeName());
			pstmt.setInt(2, bikeBrandId);
			pstmt.setDouble(3, bike.getPrice());
			pstmt.setString(4, bike.getCc());
			pstmt.setString(5, bike.getBikeId());

			int rows = pstmt.executeUpdate();

			if (rows > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<Bike> getBikesByBrand(String bikeBrand) {
		List<Bike> bikesList = new ArrayList<Bike>();
		Bike bike = null;

		try {
			con = daoUtil.getConnection();
			pstmt = con.prepareStatement(GET_BIKES_BY_BRAND);
			pstmt.setString(1, bikeBrand);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				bike = new Bike();

				bike.setBikeId(rs.getString(BIKE_ID));
				bike.setBikeName(rs.getString(BIKE_NAME));
				bike.setBikeBrand(rs.getString(BRAND_NAME));
				bike.setPrice(rs.getDouble(BIKE_PRICE));
				bike.setCc(rs.getString(BIKE_CC));

				bikesList.add(bike);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bikesList;
	}

	public List<Bike> getBikesByBudget(double minPrice, double maxPrice) {
		List<Bike> bikesList = new ArrayList<Bike>();
		Bike bike = null;

		try {
			con = daoUtil.getConnection();
			pstmt = con.prepareStatement(GET_BIKES_BY_BUDGET);
			pstmt.setDouble(1, minPrice);
			pstmt.setDouble(2, maxPrice);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				bike = new Bike();

				bike.setBikeId(rs.getString(BIKE_ID));
				bike.setBikeName(rs.getString(BIKE_NAME));
				bike.setBikeBrand(rs.getString(BIKE_BRAND));
				bike.setPrice(rs.getDouble(BIKE_PRICE));
				bike.setCc(rs.getString(BIKE_CC));

				bikesList.add(bike);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bikesList;
	}

	public List<Bike> getAllBikes() {
		List<Bike> bikesList = new ArrayList<Bike>();
		Bike bike = null;
		try {
			con = daoUtil.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(GET_ALL_BIKES);

			while (rs.next()) {
				bike = new Bike();

				bike.setBikeId(rs.getString(BIKE_ID));
				bike.setBikeName(rs.getString(BIKE_NAME));
				bike.setBikeBrand(rs.getString(BRAND_NAME));
				bike.setPrice(rs.getDouble(BIKE_PRICE));
				bike.setCc(rs.getString(BIKE_CC));

				bikesList.add(bike);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bikesList;
	}

	public Bike getdetils(String id) {
		Bike bike = new Bike();

		try {
			con = daoUtil.getConnection();
			pstmt = con.prepareStatement(GET_BIKE_BY_ID);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				bike.setBikeId(rs.getString(BIKE_ID));
				bike.setBikeName(rs.getString(BIKE_NAME));
				bike.setBikeBrand(rs.getString(BRAND_NAME));
				bike.setPrice(rs.getDouble(BIKE_PRICE));
				bike.setCc(rs.getString(BIKE_CC));
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return bike;
	}

	public List<Bike> getBikesBySearchStr(String searchStr) {
		List<Bike> bikesList = new ArrayList<Bike>();
		Bike bike = null;

		try {
			con = daoUtil.getConnection();
			pstmt = con.prepareStatement(GET_BIKES_BY_SEARCH_STR);
			pstmt.setString(1, searchStr);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				bike = new Bike();

				bike.setBikeId(rs.getString(BIKE_ID));
				bike.setBikeName(rs.getString(BIKE_NAME));
				bike.setBikeBrand(rs.getString(BIKE_BRAND));
				bike.setPrice(rs.getDouble(BIKE_PRICE));
				bike.setCc(rs.getString(BIKE_CC));

				bikesList.add(bike);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bikesList;
	}
}
