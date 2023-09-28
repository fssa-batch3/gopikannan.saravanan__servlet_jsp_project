package com.fssa.pinapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			HttpSession session = request.getSession();
			session.setAttribute("loggedInEmail", email);
			session.setAttribute("userId", user.getUserid());
			response.sendRedirect("index.jsp");
		} catch (ServiceException e) {
			request.setAttribute("name", name);
			request.setAttribute("mobileno", mobileno);
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			request.setAttribute("errorMessage" ,"Register User Failed : " + e.getMessage());
			request.getRequestDispatcher("./login-signup/register.jsp").forward(request, response);
		}

	}
}
