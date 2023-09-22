package com.fssa.pinapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

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

        String fundraiseIdStr = request.getParameter("fundraiseid");
        PrintWriter out = response.getWriter();

        try {
            int fundraiseId = Integer.parseInt(fundraiseIdStr);
            Fundraise fundraise = fundraiseService.getFundraiseByIdService(fundraiseId);

            JSONObject responseData = new JSONObject();
            responseData.put("fundraise", new JSONObject(fundraise));
            out.print(responseData);
			out.flush();
			out.close();

        } catch (NumberFormatException | ServiceException e) {
            response.sendRedirect("../fundraiser/editFundraise.jsp?errorMessage=Edit Fundraise Failed: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cause = request.getParameter("cause");
        String coverpic = request.getParameter("coverpic");
        String title = request.getParameter("title");
        String story = request.getParameter("story");
        String expectedAmtStr = request.getParameter("expectedAmt");
        String document = request.getParameter("document");
        String fundraiseIdStr = request.getParameter("fundraiseid");
        int fundraiseId = Integer.parseInt(fundraiseIdStr);
        
        try {
            int expectedAmt = Integer.parseInt(expectedAmtStr);
            FundraiseService fundraiseService = new FundraiseService();
            Fundraise fundraise = new Fundraise();
            fundraise.setCause(cause);
            fundraise.setCoverPic(coverpic);
            fundraise.setTitle(title);
            fundraise.setStory(story);
            fundraise.setExpectedAmount(expectedAmt);
            fundraise.setDocument(document);

            fundraise.setFundraiseid(fundraiseId);

            fundraiseService.fundraiseUpdate(fundraise);
            response.sendRedirect(request.getContextPath()+"/fundraiser/fundraiser.jsp");
            
        } catch (NumberFormatException | ServiceException e) {
            response.sendRedirect(request.getContextPath()+"/fundraiser/editFundraise.jsp?errorMessage=Update Failed: " + e.getMessage());
        }
    }

    



}
