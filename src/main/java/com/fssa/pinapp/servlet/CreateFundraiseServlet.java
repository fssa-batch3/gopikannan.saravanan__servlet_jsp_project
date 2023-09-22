package com.fssa.pinapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.pin.model.Fundraise;
import com.fssa.pin.model.User;
import com.fssa.pin.service.FundraiseService;
import com.fssa.pin.service.UserService;
import com.fssa.pin.service.exception.ServiceException;

@WebServlet("/CreateFundraiseServlet")
public class CreateFundraiseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String loggedInEmail = (String) session.getAttribute("loggedInEmail");
		String cause = request.getParameter("cause");
		String coverPic = request.getParameter("coverpic");
		String title = request.getParameter("title");
		String story = request.getParameter("story");
		String expectedAmtString = request.getParameter("expectedAmt");
		String document = request.getParameter("document");
		int expectedAmtInt = Integer.parseInt(expectedAmtString);

		try {
			UserService userService = new UserService();
			User user = userService.findUserByEmailService(loggedInEmail);

			if (user.getAccNo() == 0 && user.getIfscNo() == null && user.getAccName() == null) {
				response.sendRedirect(
						request.getContextPath()+"/UserProfileServlet?errorMessage=Account details are null. Please update your profile and create a Fundraise.");
				return;
			}

		
			FundraiseService fundraiseservice = new FundraiseService();
			Fundraise fundraise = new Fundraise();

			user.setUserid(user.getUserid());
			fundraise.setUser(user);

			fundraise.setCause(cause);
			fundraise.setCoverPic(coverPic);
			fundraise.setTitle(title);
			fundraise.setStory(story);
			fundraise.setExpectedAmount(expectedAmtInt);
			fundraise.setDocument(document);
			fundraiseservice.createFundraise(fundraise);

			response.sendRedirect("../pinapp/fundraiser/fundraiser.jsp");
		} catch (ServiceException e) {
		    request.setAttribute("cause", cause);
		    request.setAttribute("coverpic", coverPic);
		    request.setAttribute("title", title);
		    request.setAttribute("story", story);
		    request.setAttribute("expectedAmt", expectedAmtString);
		    request.setAttribute("document", document);
		    request.setAttribute("errorMessage", "Create Fundraise Failed: " + e.getMessage());
		    
		    request.getRequestDispatcher("./fundraiser/basicdetailsfundraiser.jsp").forward(request, response);
		}

	}
}
