package com.spaneos.vb.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spaneos.vb.inf.BikeServiceInf;
import com.spaneos.vb.inf.BrandServiceInf;
import com.spaneos.vb.pojo.Bike;
import com.spaneos.vb.pojo.Brand;
import com.spaneos.vb.service.BikeServiceImp;
import com.spaneos.vb.service.BrandServiceImp;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart/*")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BikeServiceInf bikeServiceImp = BikeServiceImp.getInstance();
	private BrandServiceInf brandServiceImp = BrandServiceImp.getInstance();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();

		if (uri.endsWith("buybike")) {
			HttpSession session = request.getSession();
			
			
			String bikeId = request.getParameter("bikeId");
			if (session.isNew()) {
				List<Bike> bikecart = new ArrayList<Bike>();
				Bike bike = getBikeId(bikeId);
				bikecart.add(bike);
				System.out.println("new session");
				session.setAttribute("bikecart", bikecart);
			} else {
				List<Bike> bikecart = (List<Bike>) session.getAttribute("bikecart");
				boolean exists = false;
				double grandTotal = 0.0d;
				if (bikecart == null)
					bikecart = new ArrayList<Bike>();
				Bike bike = getBikeId(bikeId);

				for (Bike bike1 : bikecart) {
					if (bike1.getBikeId().equals(bike.getBikeId())) {
						int quantity = bike1.getQuantity();
						quantity = quantity + 1;
						bike1.setQuantity(quantity);
						bike1.setTotalPrice(quantity * bike1.getPrice());
						exists = true;
					}
					grandTotal += bike1.getTotalPrice();
					System.out.println(grandTotal);
				}

				if (!exists) {
					int quantity = bike.getQuantity();
					bike.setQuantity(++quantity);
					bike.setTotalPrice(bike.getPrice() * quantity);
					grandTotal += bike.getTotalPrice();
					bikecart.add(bike);
				}

				session.setAttribute("bikecart", bikecart);
				session.setAttribute("grandTotal", grandTotal);
			}

			response.sendRedirect("../showcart.jsp");
		} else if(uri.endsWith("removebike")) {
			String bikeId = request.getParameter("bikeId");
			Bike bike = getBikeId(bikeId);
			HttpSession session = request.getSession(false);
			
			if(session != null) {
				List<Bike> bikecart = (List<Bike>) session.getAttribute("bikecart");
				
				for(int i = 0 ; i < bikecart.size() ; i++) {
					Bike bike1 = bikecart.get(i);
					if(bike.getBikeId().equals(bike1.getBikeId())) {
						if(bike1.getQuantity() > 1) {
							bike1.setTotalPrice(bike1.getTotalPrice() - bike1.getPrice());
							bike1.setQuantity(bike1.getQuantity() - 1);
						} else if(bike1.getQuantity() == 1) {
							bikecart.remove(i);
						}
					}
				}
				response.sendRedirect("../showcart.jsp");
			} else {
				response.sendRedirect("homepage");
			}
		} else if(uri.endsWith("search")) {
			String searchStr = request.getParameter("searchStr");			
			List<Brand> brandsList = brandServiceImp.getBrandsBySearchStr(searchStr);
			System.out.println(brandsList);
			request.setAttribute("brandsList", brandsList);
			request.getRequestDispatcher("../printsearchresult.jsp").forward(request, response);
			
		}
	}

	private Bike getBikeId(String bikeId) {
		List<Bike> bikeslist = bikeServiceImp.getAllBikes();

		for (Bike bike : bikeslist) {
			if (bike.getBikeId().equalsIgnoreCase(bikeId)) {
				
				return bike;
			}
		}
		return null;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
