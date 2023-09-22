package com.fssa.pinapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.fssa.pin.model.Fundraise;
import com.fssa.pin.service.FundraiseService;
import com.fssa.pin.service.exception.ServiceException;

@WebServlet("/GetAllFundraise")
public class GetAllFundraise extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		FundraiseService fundraiseservice = new FundraiseService();
		try {
			
			HttpSession session = request.getSession(false);
	        String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	        
			List<Fundraise> fundraises = fundraiseservice.viewFundraisesServices();
			/* JSONArray arr = new JSONArray(fundraises); */
			JSONObject responseData = new JSONObject();
			 responseData.put("fundraise", new JSONArray(fundraises));
             responseData.put("loggedInEmail", loggedInEmail);
			 
			PrintWriter out = response.getWriter();
			out.println(responseData.toString());
			out.flush();
			out.close();
		} catch (ServiceException e) {
			request.setAttribute("errorMessage", "Error in getting the fundraise: " + e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		}
	}

}
