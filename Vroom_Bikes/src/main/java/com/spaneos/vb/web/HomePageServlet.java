package com.spaneos.vb.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spaneos.vb.dao.BikeDaoImp;
import com.spaneos.vb.dao.BrandDaoImp;
import com.spaneos.vb.inf.BikeDaoInf;
import com.spaneos.vb.inf.BrandDaoInf;
import com.spaneos.vb.pojo.Bike;
import com.spaneos.vb.pojo.Brand;

/**
 * Servlet implementation class HomePageServlet
 */
@WebServlet("/homepage")
public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BikeDaoInf bikeDaoImp = BikeDaoImp.getInstance();
	private BrandDaoInf brandDaoImp = BrandDaoImp.getInstance();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Bike> bikesList = bikeDaoImp.getAllBikes();
		List<Brand> brandsList = brandDaoImp.getAllBrands();
				
		ServletContext context = getServletContext();
		context.setAttribute("bikesList", bikesList);
		context.setAttribute("brandsList", brandsList);
		
		response.sendRedirect("homepage.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
