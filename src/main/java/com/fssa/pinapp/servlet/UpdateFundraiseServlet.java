package com.fssa.pinapp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.pin.model.Fundraise;
import com.fssa.pin.service.FundraiseService;
import com.fssa.pin.service.exception.ServiceException;

/**
 * Servlet implementation class UpdateFundraiseServlet
 */
@WebServlet("/UpdateFundraiseServlet")
public class UpdateFundraiseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FundraiseService fundraiseService = new FundraiseService();

        String fundraiseIdStr = request.getParameter("fundraiseId");

        try {
            int fundraiseId = Integer.parseInt(fundraiseIdStr);
            Fundraise fundraise = fundraiseService.getFundraiseByIdService(fundraiseId);

            request.setAttribute("fundraise", fundraise);

            RequestDispatcher dispatcher = request.getRequestDispatcher("editfundraise.jsp");
            
            dispatcher.forward(request, response);
        } catch (NumberFormatException | ServiceException e) {
            response.sendRedirect("editfundraise.jsp?errorMessage=Edit Fundraise Failed: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cause = request.getParameter("cause").trim();
        String coverpic = request.getParameter("coverpic").trim();
        String title = request.getParameter("title").trim();
        String story = request.getParameter("story").trim();
        String expectedAmtStr = request.getParameter("expectedAmt").trim();

        try {
            int expectedAmt = Integer.parseInt(expectedAmtStr);
            FundraiseService fundraiseService = new FundraiseService();
            Fundraise fundraise = new Fundraise();
            fundraise.setCause(cause);
            fundraise.setCoverPic(coverpic);
            fundraise.setTitle(title);
            fundraise.setStory(story);
            fundraise.setExpectedAmount(expectedAmt);

            String fundraiseIdStr = request.getParameter("fundraiseId");
            int fundraiseId = Integer.parseInt(fundraiseIdStr);
            fundraise.setFundraiseid(fundraiseId);

            fundraiseService.fundraiseUpdate(fundraise);
            response.sendRedirect("ViewUserFundraiseCards");
        } catch (NumberFormatException | ServiceException e) {
            response.sendRedirect("UpdateFundraiseServlet?errorMessage=Update Failed: " + e.getMessage());
        
        }    }
    



}
