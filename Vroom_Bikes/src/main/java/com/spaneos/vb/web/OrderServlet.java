package com.spaneos.vb.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spaneos.vb.dao.OrderdaoImp;
import com.spaneos.vb.pojo.Address;
import com.spaneos.vb.pojo.Bike;
import com.spaneos.vb.pojo.Order;
import com.spaneos.vb.pojo.User;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	OrderdaoImp imp = new OrderdaoImp();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		List<Bike> bikelist = (List<Bike>) session.getAttribute("bikecart");
		User user = (User) session.getAttribute("user");
		Address address4 = (Address) session.getAttribute("address2");
		/* Address address4= null; */
		/*
		 * for(Address address:add){ address4=address;
		 * 
		 * }
		 */
		Order order = null;

		for (Bike bike : bikelist) {
			order = new Order();
			order.setBikename(bike.getBikeName());
			order.setPrice(bike.getPrice());
			order.setQuantiy(bike.getQuantity());
			order.setTotalprice(bike.getTotalPrice());

			order.setName(user.getUserName());
			order.setPlace(address4.getStreet() + "-" + address4.getCity() + "-" + address4.getState());
			order.setMobile(address4.getMobile());

			imp.addorder(order);
		}

		session.setAttribute("order", order);
		resp.sendRedirect("../confirmorder.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
