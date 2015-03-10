package com.spaneos.vb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.spaneos.vb.inf.OrderDao;
import com.spaneos.vb.pojo.Order;

public class OrderdaoImp implements OrderDao {
	 
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DaoUtil daoUtil = DaoUtil.getObject();
	

	@Override
	public boolean addorder(Order order) {
		con = daoUtil.getConnection();
		try {
			pstmt=con.prepareStatement("insert into order_info(Bikename,price,quantiy,name,place,mobile,totalamount) values(?,?,?,?,?,?,?)");
			 
			pstmt.setString(1, order.getBikename());
			pstmt.setDouble(2, order.getPrice());
			pstmt.setInt(3, order.getQuantiy());
			 
			pstmt.setString(4, order.getName());
			pstmt.setString(5, order.getPlace());
			pstmt.setString(6, order.getMobile());
			pstmt.setDouble(7, order.getTotalprice());
			 
			
		int y=	pstmt.executeUpdate();
			
			if(y>0){
				return true;
			}
			
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		 
		return false;
	}


	@Override
	public List<Order> getAllorder() {
		con = daoUtil.getConnection();
		List<Order> orderlist=new ArrayList<Order>();
	 try {
		pstmt=con.prepareStatement("select * from order_info");
		rs=pstmt.executeQuery();
		while(rs.next()){
			Order order=new Order();
			order.setId(rs.getInt(1));
			order.setBikename(rs.getString(2));
			order.setPrice(rs.getDouble(3));
			order.setQuantiy(rs.getInt(4));
			order.setName(rs.getString(5));
			order.setPlace(rs.getString(6));
			order.setMobile(rs.getString(7));
			order.setTotalprice(rs.getDouble(8));
			orderlist.add(order);
			
		}
	} catch (SQLException e) {
	 
		e.printStackTrace();
	}
	 
		return orderlist;
	}

}
