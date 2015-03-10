package com.spaneos.vb.daoimp;

import java.util.List;

import com.spaneos.vb.pojo.Address;
import com.spaneos.vb.pojo.User;

public interface UserDaoInf {
	
	
	public boolean addAddress(String email,Address address);
	public User getUser(String email);
	boolean addUser(User user, Address address);
	Address getDeilts(String email);
	

}
