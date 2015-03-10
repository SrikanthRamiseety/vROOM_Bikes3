package com.spaneos.vb.pojo;

public class User {
	
	String userName;
	String email;
	String password;
	boolean admin;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String userName, String email, String password, boolean admin) {
		super();
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.admin = admin;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	

}
