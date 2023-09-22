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

import com.fssa.pin.model.Fundraise;
import com.fssa.pin.model.User;
import com.fssa.pin.service.FundraiseService;
import com.fssa.pin.service.UserService;
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
        String loggedInEmail = (String) session.getAttribute("loggedInEmail");

        if (session != null && loggedInEmail != null) {
                      
           
                try {
                    List<Fundraise> fundraises = fundraiseService.viewFundraisesServices();
                    List<Fundraise> matchedFundraise = new ArrayList<>();
                    for (Fundraise fundraise : fundraises) {
                        if (loggedInEmail.equals(fundraise.getUser().getMail())) {
                            matchedFundraise.add(fundraise);
                        }
                    }

                    UserService userService = new UserService();
                    User user = userService.findUserByEmailService(loggedInEmail);

                    JSONObject responseData = new JSONObject();
                    responseData.put("user", new JSONObject(user));
                    responseData.put("fundraise", new JSONArray(matchedFundraise));
                    responseData.put("loggedInEmail", loggedInEmail);


                    PrintWriter out = response.getWriter();
                    out.println(responseData.toString());
                    out.flush();
                    out.close();
                } catch (ServiceException e) {
                    response.sendRedirect("viewUserFundraise.jsp?errorMessage=View Failed: " + e.getMessage());
                }
            }
        }
	

}
