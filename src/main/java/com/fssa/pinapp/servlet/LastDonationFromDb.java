package com.fssa.pinapp.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.pin.model.Donate;
import com.fssa.pin.service.DonateService;
import com.fssa.pin.service.exception.ServiceException;

/**
 * Servlet implementation class LastDonationFromDb
 */
@WebServlet("/LastDonationFromDb")
public class LastDonationFromDb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DonateService donateService = new DonateService();

		try {
			List<Donate> getAlldonations = donateService.viewDonationsService();
			
			
			 
			 int lastIndex = getAlldonations.size() - 1;
		        if (lastIndex >= 0) {
		        	Donate lastDonation = getAlldonations.get(lastIndex);
		            int donaterId = lastDonation.getDonaterId(); 
		            String id = ""+donaterId;
		            
				       response.sendRedirect(request.getContextPath()+"/donate/donationdownload.jsp?donaterId="+id);
				    
		        } 

		

		} catch (ServiceException e) {

//			response.sendRedirect(
//					request.getContextPath() + "/fundraiser/fundraise.jsp?errorMessage=View Failed: " + e.getMessage());
		}
	}

	

}
