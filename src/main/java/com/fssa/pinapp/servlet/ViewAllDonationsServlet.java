package com.fssa.pinapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.fssa.pin.model.Donate;
import com.fssa.pin.service.DonateService;
import com.fssa.pin.service.exception.ServiceException;

/**
 * Servlet implementation class ViewAllDonationsServlet
 */
@WebServlet("/ViewAllDonationsServlet")
public class ViewAllDonationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewAllDonationsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DonateService donateService = new DonateService();
		PrintWriter out = response.getWriter();

		try {
			List<Donate> donations = donateService.viewDonationsService();

			JSONArray arr = new JSONArray(donations);
			out.print(arr.toString());
			out.flush();
			out.close();

		} catch (ServiceException e) {

			response.sendRedirect(
					request.getContextPath() + "/fundraiser/fundraise.jsp?errorMessage=View Failed: " + e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
