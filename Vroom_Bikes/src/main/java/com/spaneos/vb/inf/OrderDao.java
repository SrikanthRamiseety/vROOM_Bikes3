package com.spaneos.vb.inf;

import java.util.List;

import com.spaneos.vb.pojo.Order;

public interface OrderDao {
	boolean addorder(Order order);
	List<Order> getAllorder();

}
