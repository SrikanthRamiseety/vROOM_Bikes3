package com.spaneos.vb.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spaneos.vb.dao.OrderdaoImp;
import com.spaneos.vb.inf.BikeServiceInf;
import com.spaneos.vb.inf.BrandServiceInf;
import com.spaneos.vb.pojo.Bike;
import com.spaneos.vb.pojo.Brand;
import com.spaneos.vb.pojo.Order;
import com.spaneos.vb.service.BikeServiceImp;
import com.spaneos.vb.service.BrandServiceImp;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/admin/*")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BikeServiceInf bikeServiceImp = BikeServiceImp.getInstance();
	private BrandServiceInf brandServiceImp = BrandServiceImp.getInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");

		String uri = req.getRequestURI();
		if (uri.endsWith("addbike")) {
			Bike b = new Bike();
			b.setBikeId(getBikeId(req.getParameter("bikebrand")));
			b.setBikeName(req.getParameter("bikename"));
			b.setBikeBrand(req.getParameter("bikebrand"));
			double price = Double.parseDouble(req.getParameter("bikeprice"));
			b.setPrice(price);
			b.setCc(req.getParameter("bikecc"));

			if (bikeServiceImp.addBike(b)) {
				String message = "Bike added successfully";
				/*
				 * req.setAttribute("message", message);
				 * req.getRequestDispatcher("../adminhomepage.jsp").include(req,
				 * resp);
				 */
				resp.sendRedirect("../adminhomepage.jsp");

			} else {
				resp.sendRedirect("../error.jsp");
			}

		} else if (uri.endsWith("viewbikes")) {
			List<Bike> list = bikeServiceImp.getAllBikes();
			System.out.println(list);
			int pageNumber = Integer.parseInt(req.getParameter("pagenumber"));
			req.setAttribute("bikes", list);

			req.getRequestDispatcher("../viewbikes.jsp").forward(req, resp);

		} else if (uri.endsWith("editbike")) {
			String id = req.getParameter("bikeId");
			Bike bike = bikeServiceImp.getdetils(id);
			ServletContext context = getServletContext();
			context.setAttribute("bikes", bike);

			// req.getRequestDispatcher("../editbike.jsp").forward(req, resp);
			resp.sendRedirect("../editbike.jsp");

		} else if (uri.endsWith("updatebike")) {
			Bike b = new Bike();

			b.setBikeId(req.getParameter("bikeid"));
			b.setBikeName(req.getParameter("bikename"));
			b.setBikeBrand(req.getParameter("bikebrand"));
			double price = Double.parseDouble(req.getParameter("bikeprice"));
			b.setPrice(price);
			b.setCc(req.getParameter("bikecc"));

			if (bikeServiceImp.updateBike(b)) {
				resp.sendRedirect("../success.jsp");
			} else {
				resp.sendRedirect("../../error.jsp");
			}

		} else if (uri.endsWith("removebike")) {
			String id = req.getParameter("bikeId");
			if (bikeServiceImp.deleteBike(id)) {
				resp.sendRedirect("../success.jsp");

			} else {
				resp.sendRedirect("../error.jsp");
			}

		} else if (uri.endsWith("addbrand")) {
			Brand brand = new Brand(req.getParameter("bid"),
					req.getParameter("bname"));

			if (brandServiceImp.addBrand(brand)) {
				resp.sendRedirect("../success.jsp");
			}

		} else if (uri.endsWith("getbrands")) {
			List<Brand> brandsList = brandServiceImp.getAllBrands();

			req.setAttribute("brandsList", brandsList);
			req.getRequestDispatcher("../addbike.jsp").forward(req, resp);
		} else if(uri.endsWith("viewbrands")) {
			List<Brand> brandslist=BrandServiceImp.getInstance().getAllBrands();
			req.setAttribute("brands", brandslist);
			req.getRequestDispatcher("../viewbrands.jsp").forward(req, resp);
				 
			 
		} else if (uri.endsWith("vieworder")) {
			OrderdaoImp oImp = new OrderdaoImp();
			List<Order> orderlist = oImp.getAllorder();
			req.setAttribute("order", orderlist);

			req.getRequestDispatcher("../vieworder.jsp").forward(req, resp);

		}

	}

	private String getBikeId(String bikeBrand) {
		List<Bike> bikesList = bikeServiceImp.getBikesByBrand(bikeBrand);

		String lastBikeId = bikesList.get(bikesList.size() - 1).getBikeId();
		int bikeId = Integer.parseInt(lastBikeId.substring(2));
		String newBikeId = lastBikeId.substring(0, 2) + (++bikeId);
		/* System.out.println(newBikeId); */

		return newBikeId;
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
