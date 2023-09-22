package com.fssa.pinapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.fssa.pin.model.Donate;
import com.fssa.pin.service.DonateService;
import com.fssa.pin.service.exception.ServiceException;

/**
 * Servlet implementation class ViewUserDonations
 */
@WebServlet("/ViewUserDonations")
public class ViewUserDonations extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewUserDonations() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// instance object for donateservice class and session
		DonateService donateService = new DonateService();
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
//		Getting the logged in mail stored in session
		String loggedInEmail = (String) session.getAttribute("loggedInEmail");

		if (session != null && loggedInEmail != null) {

			try {
				List<Donate> donations = donateService.viewDonationsService();
				
				List<Donate> matchedUserDonations = new ArrayList<>();
				
				for(Donate donate : donations) {
					if(loggedInEmail.equals(donate.getUser().getMail())) {
						matchedUserDonations.add(donate);
				
					}
				}
				JSONObject responseData = new JSONObject();
                responseData.put("donate", new JSONArray(matchedUserDonations));
                responseData.put("loggedInEmail", loggedInEmail);

                
                out.println(responseData.toString());
          
                out.flush();
                out.close();
				
				
				
			} catch (ServiceException e) {
				
				response.sendRedirect(request.getContextPath()+"/donate/mydonations.jsp?errorMessage=View Failed: " + e.getMessage());
			}
		}

	}

}
