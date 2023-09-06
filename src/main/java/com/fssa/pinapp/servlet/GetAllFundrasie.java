package com.fssa.pinapp.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.pin.model.Fundraise;
import com.fssa.pin.service.FundraiseService;
import com.fssa.pin.service.exception.ServiceException;

@WebServlet("/GetAllFundrasie")
public class GetAllFundrasie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		FundraiseService fundraiseservice = new FundraiseService();

		try {
			List<Fundraise> fundraises = fundraiseservice.viewFundraisesServices();
			request.setAttribute("FUNDRAISE_LIST", fundraises);
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			request.setAttribute("errorMessage", "Error in getting the fundraise: " + e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		}
	}

}
