package com.fssa.pinapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.fssa.pin.model.Fundraise;
import com.fssa.pin.service.FundraiseService;
import com.fssa.pin.service.exception.ServiceException;

/**
 * Servlet implementation class GetAllFundraiseJSONServlet
 */
@WebServlet("/GetAllFundraiseJSONServlet")
public class GetAllFundraiseJSONServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();

		if (session != null) {
			String loggedInEmail = (String) session.getAttribute("loggedInEmail");
			if (loggedInEmail == null) {
				response.sendRedirect("login.jsp");
			} else {
				try {
					FundraiseService fundraiseservice = new FundraiseService();
					List<Fundraise> fundraises = fundraiseservice.viewFundraisesServices();
					System.out.println(fundraises);
					request.setAttribute("FUNDRAISE_LIST", fundraises);

					JSONArray arr = new JSONArray(fundraises);
					out.print(arr.toString());
//					RequestDispatcher dispatcher = request.getRequestDispatcher("viewAllFundraise.jsp");
//					dispatcher.forward(request, response);
				} catch (ServiceException e) {
					String errormsg = ("Error in getting the fundraise: " + e.getMessage());
					out.print(errormsg);
				}
			}
		}
	}

//	private List<Fundraise> getFundraises() throws ServiceException {
//		FundraiseService fundraiseservice = new FundraiseService();
//		return fundraiseservice.viewFundraisesServices();
//	}
}
