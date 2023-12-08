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
import com.fssa.pin.model.Fundraise;
import com.fssa.pin.model.User;
import com.fssa.pin.service.DonateService;
import com.fssa.pin.service.FundraiseService;
import com.fssa.pin.service.UserService;
import com.fssa.pin.service.exception.ServiceException;

@WebServlet("/TransactionServlet")
public class TransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fundraiseIdStr = request.getParameter("fundrasieid");
		int fundraiseId = Integer.parseInt(fundraiseIdStr);
		FundraiseService fundraiseService = new FundraiseService();
		JSONObject responseData = new JSONObject();

		try {
			Fundraise fundraise = fundraiseService.getFundraiseByIdService(fundraiseId);

			List<Fundraise> fundraises = fundraiseService.viewFundraisesServices();
			List<Fundraise> matchedFundraise = new ArrayList<>();

			for (Fundraise fundraisenew : fundraises) {
				if (fundraise.getFundraiseUserId() == (fundraisenew.getUser().getUserid())) {
					matchedFundraise.add(fundraisenew);
				}
			}

			List<Fundraise> fundraiseMatchWithFundraiseId = new ArrayList<>();

			for (Fundraise fundraisenew : matchedFundraise) {
				if (fundraiseId == (fundraisenew.getFundraiseid())) {

					fundraiseMatchWithFundraiseId.add(fundraisenew);

				}
			}

			JSONArray fundraisesArray = new JSONArray(fundraiseMatchWithFundraiseId);

			responseData.put("fundraise", fundraisesArray);

			response.setContentType("application/json");

			PrintWriter out = response.getWriter();
			out.println(responseData.toString());
			out.flush();
			out.close();

		} catch (ServiceException e) {
			response.sendRedirect("../fundraiser/directbanktransfer.jsp?errorMessage=View Failed: " + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String loggedInEmail = (String) session.getAttribute("loggedInEmail");
		
		String fundraiseIdStr = request.getParameter("fundraiseid");
		int fundraiseId = Integer.parseInt(fundraiseIdStr);
		String contributionStr = request.getParameter("money");
		int contributionINt = Integer.parseInt(contributionStr);
		Donate donate = new Donate();
		DonateService donateService = new DonateService();

		Integer userId = (Integer) session.getAttribute("userId");
		System.out.print(userId);

		try {
			UserService userService = new UserService();
			User user = userService.findUserByEmailService(loggedInEmail);
			User user1 = new User();
			if (user.getAccNo() == 0 && user.getIfscNo() == null && user.getAccName() == null) {
				response.sendRedirect(
						request.getContextPath()+"/UserProfileServlet?errorMessage=Account details are null. Please update your profile and continue.");
				return;
			}
			else {
			user1.setUserid(userId);
			donate.setUser(user1);
			Fundraise fundraise = new Fundraise();
			fundraise.setFundraiseid(fundraiseId);
			donate.setFundraise(fundraise);
			donate.setDonaterContribution(contributionINt);
			donateService.createDonationService(donate);
			
			response.sendRedirect(request.getContextPath()+"/donate/SuccessfullDonation.jsp");}
		}
		catch (ServiceException e) {
			response.sendRedirect(request.getContextPath()+"/fundraiser/directbanktransfer.jsp?errorMessage=View Failed: " + e.getMessage());
		}

	}
}
