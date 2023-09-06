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
 * Servlet implementation class UserProfileServlet
 */
@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserService userService = new UserService();

		HttpSession session = request.getSession();
		String loggedInEmail = (String) session.getAttribute("loggedInEmail");
		if (loggedInEmail == null) {
			response.sendRedirect("login.jsp?errorMessage=Kindly Login to Continue");
		} else {
			try {
				User user = userService.findUserByEmailService(loggedInEmail);

				request.setAttribute("user", user);

				RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
				dispatcher.forward(request, response);
			} catch (ServiceException e) {
				response.sendRedirect("profile.jsp?errorMessage=User profile view Failed : " + e.getMessage());
			}

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("username").trim();
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		String phone = request.getParameter("phone").trim();
		String accNo = request.getParameter("accno").trim();
		String ifsc = request.getParameter("ifsc").trim();
		String accName = request.getParameter("accountName").trim();
		
		
		  try {
		        UserService userService = new UserService();
		        User user= new User();
		        user.setUsername(name);
		        user.setMail(email);
		        user.setPassword(password);
		        user.setMobileno(phone);
		        long userAccNo = Long.parseLong(accNo);

		        user.setAccNo(userAccNo);
		        user.setIfscNo(ifsc);
		        user.setAccName(accName);
		        
		        userService.updateUser(user);

		        response.sendRedirect("UserProfileServlet");
		    } catch (ServiceException e) {
		        response.sendRedirect("profile.jsp?errorMessage=Update Failed: " + e.getMessage());
		    }
	}

}
