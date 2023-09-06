package com.fssa.pinapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.pin.model.User;
import com.fssa.pin.service.UserService;
import com.fssa.pin.service.exception.ServiceException;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String name = request.getParameter("username");

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String mobileno = request.getParameter("mobileno");

		User user = new User();
		user.setMail(email);
		user.setUsername(name);
		user.setPassword(password);
		user.setMobileno(mobileno);

		UserService userservice = new UserService();
		try {
			userservice.registerUser(user);
			out.append("Registration Successfully");
			response.sendRedirect("login.jsp");
		} catch (ServiceException e) {
			response.sendRedirect("register.jsp?errorMessage=Register User Failed : " + e.getMessage());
			out.println("Registration failed : " + e.getMessage());
		}

	}
}
