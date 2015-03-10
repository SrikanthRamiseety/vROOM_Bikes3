package com.spaneos.vb.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spaneos.vb.inf.BikeServiceInf;
import com.spaneos.vb.pojo.Bike;
import com.spaneos.vb.service.BikeServiceImp;

/**
 * Servlet implementation class ViewBikesServlet
 */
@WebServlet("/viewbikes")
public class ViewBikesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BikeServiceInf bikeServiceImp = BikeServiceImp.getInstance();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Bike> bikesList = bikeServiceImp.getBikesByBrand(request.getParameter("brandName"));
		
		ServletContext context = getServletContext();
		context.setAttribute("bikesList", bikesList);
		context.setAttribute("brandName", request.getParameter("brandName"));
		response.sendRedirect("viewbikesbybrand.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
