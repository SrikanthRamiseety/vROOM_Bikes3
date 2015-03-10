package com.spaneos.vb.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spaneos.vb.daoimp.UserDaoImp;
import com.spaneos.vb.pojo.Address;
import com.spaneos.vb.pojo.Bike;
import com.spaneos.vb.pojo.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/userservlet/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String uri = request.getRequestURI();
		User user = new User();
		UserDaoImp userDaoImp = new UserDaoImp();
		Address address = new Address();
		
		PrintWriter out = response.getWriter();

		if (uri.endsWith("Register")) {
			HttpSession session = request.getSession();
			String userName = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String cpassword = request.getParameter("cpassword");
			String street = request.getParameter("street");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String pin = request.getParameter("pin");
			String mobile = request.getParameter("mobile");

			user.setUserName(userName);
			user.setEmail(email);
			user.setPassword(password);
			user.setAdmin(false);
			address.setStreet(street);
			address.setCity(city);
			address.setState(state);
			address.setPincode(pin);
			address.setMobile(mobile);
			address.setEmail(email);

			List<Address> addressList = new ArrayList<Address>();
			addressList.add(address);

			boolean flag = userDaoImp.addUser(user, address);
			if (flag == true) {
				session.setAttribute("user", user);
				session.setAttribute("addressList", addressList);

				response.sendRedirect("../showaddresses.jsp");
			} else {
				request.getRequestDispatcher("").forward(request, response);
			}
		}
		if (uri.endsWith("addaddress")) {
			HttpSession session = request.getSession();
			User user1 = (User) session.getAttribute("user");
			String email = user1.getEmail();
			String street = request.getParameter("street");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String pin = request.getParameter("pin");
			String mobile = request.getParameter("mobile");

			address.setStreet(street);
			address.setCity(city);
			address.setState(state);
			address.setPincode(pin);
			address.setMobile(mobile);
			address.setEmail(email);

			boolean flag = userDaoImp.addAddress(email, address);
			if (flag == true) {
				List<Address> addressList = (List<Address>) session
						.getAttribute("addressList");
				addressList.add(address);
				session.setAttribute("addressList", addressList);
				response.sendRedirect("../showaddresses.jsp");
			} else {
				request.getRequestDispatcher("").forward(request, response);
			}
		}
		if (uri.endsWith("login")) {
			HttpSession session = request.getSession();
			User user1 = userDaoImp.getUser(request.getParameter("email"));

			if (user1.getPassword().equals(request.getParameter("password"))) {

				if (!user1.isAdmin()) {
					List<Address> addressList = userDaoImp.getAddresses(request
							.getParameter("email"));
					ServletContext context = getServletContext();

					session.setAttribute("user", user1);
					session.setAttribute("addressList", addressList);
					response.sendRedirect("../showaddresses.jsp");
				} else {
					response.sendRedirect("../admin/adminhomepage.jsp");
				}
			} else {

				response.sendRedirect("../login.jsp");
			}

		} else if(uri.endsWith("orderplaced")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("../orderplaced.jsp");
		} else if(uri.endsWith("checkout")) {
			HttpSession session = request.getSession();
			
			List<Bike> bikecart = (List<Bike>) session.getAttribute("bikecart");
			
			if(bikecart == null || bikecart.size() == 0)
				response.sendRedirect("../showcart.jsp");
			else
				response.sendRedirect("../login.jsp");
		} else if (uri.endsWith("confirmorder")) {
			HttpSession session = request.getSession();
			String Street = request.getParameter("st");
			String city = request.getParameter("cy");
			String state = request.getParameter("state");
			String mobile = request.getParameter("mob");
			Address address2 = new Address();
			address2.setCity(city);
			address2.setMobile(mobile);
			address2.setStreet(Street);
			address2.setState(state);
			session.setAttribute("address2", address2);
			request.getRequestDispatcher("../order").forward(request,
			 response);

		} else if (uri.endsWith("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("../homepage");
		}
		else if(uri.endsWith("editaddress")){
		String email=request.getParameter("email");
		Address add= userDaoImp.getDeilts(email);
		ServletContext context = getServletContext();
		context.setAttribute("address",add);
 
		response.sendRedirect("../editaddress.jsp");
			
		}
		else if(uri.endsWith("update")){
			 
		}
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
