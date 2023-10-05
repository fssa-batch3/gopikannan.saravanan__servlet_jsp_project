package com.fssa.pinapp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User();
		user.setMail(email);
		user.setPassword(password);
		UserService userService = new UserService();

		try {
			userService.loginUser(user);
			User user1 = userService.findUserByEmailService(user.getMail());
			HttpSession session = request.getSession();
			session.setAttribute("loggedInEmail", email);
			session.setAttribute("userId", user1.getUserid());
			response.sendRedirect("index.jsp");

		} catch (ServiceException e) {
			request.setAttribute("email", email);
			request.setAttribute("password",password);
			request.setAttribute("errorMessage", "Login Failed : " + e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("./login-signup/login.jsp");
			dispatcher.forward(request, response);
			
		}

	}
}

