package com.fssa.pinapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.pin.service.FundraiseService;
import com.fssa.pin.service.exception.ServiceException;

/**
 * Servlet implementation class DeleteFundraiseServlet
 */
@WebServlet("/DeleteFundraiseServlet")
public class DeleteFundraiseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		FundraiseService fundraiseService = new FundraiseService();

		String fundraiseIdStr = request.getParameter("fundraiseId");
		int fundraiseId = Integer.parseInt(fundraiseIdStr);
		
		try {
			fundraiseService.fundraiseDelete(fundraiseId);
			 response.sendRedirect("ViewUserFundraiseCards?successMessage=Successfully Deleted Your Fundraise: ");

		} catch (ServiceException e) {
			 response.sendRedirect("ViewUserFundraiseCards?errorMessage=Failed To Delete Your Fundraise: " + e.getMessage());
		}

	}

}
