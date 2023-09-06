package com.fssa.pinapp.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.pin.model.Fundraise;
import com.fssa.pin.service.FundraiseService;
import com.fssa.pin.service.exception.ServiceException;

/**
 * Servlet implementation class ViewUserFundraiseCards
 */
@WebServlet("/ViewUserFundraiseCards")
public class ViewUserFundraiseCards extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		FundraiseService fundraiseService = new FundraiseService();
		if (session != null) {
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");
			if (loggedInEmail == null) {
				response.sendRedirect("login.jsp");
			} else {
				try {
					List<Fundraise> fundraises = fundraiseService.viewFundraisesServices();
					List<Fundraise> matchedFundraise = new ArrayList<>();
					for (Fundraise fundraise : fundraises) {
						if (loggedInEmail.equals(fundraise.getUser().getMail())) {
							matchedFundraise.add(fundraise);
						}
					}

					request.setAttribute("FUNDRAISE", matchedFundraise);
					RequestDispatcher dispatcher = request.getRequestDispatcher("viewUserFundraise.jsp");
					dispatcher.forward(request, response);
				} catch (ServiceException e) {
					response.sendRedirect("viewUserFundraise.jsp?errorMessage=View Failed: " + e.getMessage());

				}
			}
		}
	}

}
