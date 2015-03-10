package com.spaneos.vb.daoimp;


import com.spaneos.vb.dao.DaoUtil;
import com.spaneos.vb.pojo.Address;
import com.spaneos.vb.pojo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static com.spaneos.vb.stringcontants.StringConstants.*;


public class UserDaoImp implements UserDaoInf {

	static UserDaoImp userDaoImp=null;
	Connection con=null;
	PreparedStatement pstmt=null;
	Statement stmt=null;
	ResultSet rs=null;
	/*User user=new User();*/
	Address address=null;
	
	public UserDaoImp() {
		
	}
	
	public static UserDaoInf getInstance() {
		if(userDaoImp==null){
			UserDaoImp userDaoImp=new UserDaoImp();
			return userDaoImp;
		}
		return userDaoImp;		
	}
	
	
	@Override
	public boolean addUser(User user,Address address) {
		try{
			con=DaoUtil.getObject().getConnection();
			pstmt=con.prepareStatement(INSERT_USER);
			
			pstmt.setString(1,user.getUserName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setBoolean(4, user.isAdmin());
			
			int i=pstmt.executeUpdate();
			if(i>0){
				pstmt=con.prepareStatement(INSERT_ADDRESS);
				
				pstmt.setString(1,address.getStreet());
				pstmt.setString(2, address.getCity());
				pstmt.setString(3, address.getState());
				pstmt.setString(4, address.getPincode());
				pstmt.setString(5, address.getMobile());
				pstmt.setString(6, address.getEmail());
				
				int j=pstmt.executeUpdate();
				if(j>0){
					return true;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	
	
	public List<Address> getAddresses(String email) {
		List<Address> list=new ArrayList<Address>();
		
		try{
			con=DaoUtil.getObject().getConnection();
			pstmt=con.prepareStatement(GET_USER_DETAILS);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				if(rs.getString("email").equals(email)){
					address = new Address();
					
					address.setStreet(rs.getString(1));
					address.setCity(rs.getString(2));
					address.setState(rs.getString(3));
					address.setPincode(rs.getString(4));
					address.setMobile(rs.getString(5));
					
					list.add(address);
					
				}
			}
			return list;
		}catch(Exception e){
			
		}
		
		return null;
	}

	@Override
	public boolean addAddress(String email, Address address) {
		
		try{
			con=DaoUtil.getObject().getConnection();
			
			pstmt=con.prepareStatement(INSERT_ADDRESS);
			
			pstmt.setString(1,address.getStreet());
			pstmt.setString(2, address.getCity());
			pstmt.setString(3, address.getState());
			pstmt.setString(4, address.getPincode());
			pstmt.setString(5, address.getMobile());
			pstmt.setString(6, address.getEmail());
			
			int j=pstmt.executeUpdate();
			if(j>0){
				return true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public User getUser(String email) {
		
		User user=new User();
		
		try{
			con=DaoUtil.getObject().getConnection();
			
			pstmt=con.prepareStatement(GET_USER);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				user.setUserName(rs.getString("username"));
				user.setEmail(email);
				user.setPassword(rs.getString("password"));
				user.setAdmin(rs.getBoolean("admin"));
				
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return user;
}

	@Override
	public Address getDeilts(String email) {
 Address add=new Address();
		
		try{
			con=DaoUtil.getObject().getConnection();
			
			pstmt=con.prepareStatement("select * from address where email=?");
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				add.setStreet(rs.getString("street"));
				add.setCity(rs.getString("city"));
				add.setState(rs.getString("state"));
				add.setMobile(rs.getString("mobile"));
				add.setPincode(rs.getString("pincode"));
				System.out.println(add);
				
				 
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return add;
		 
}
	
	
	
}
