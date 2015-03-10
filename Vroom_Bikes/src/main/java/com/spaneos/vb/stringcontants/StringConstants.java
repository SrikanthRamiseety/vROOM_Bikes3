package com.spaneos.vb.stringcontants;

public interface StringConstants {
  String INSERT_USER="insert into user_details values(?,?,?,?)";
  String INSERT_ADDRESS="insert into address value(?,?,?,?,?,?)";
  String GET_USER_DETAILS="select * from address where email=?";
  String GET_USER="select * from user_details where email=?";
}
