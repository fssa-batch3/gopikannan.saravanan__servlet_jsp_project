<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Fundraise</title>
    <link rel="stylesheet" href="./assets/universal.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
    <h2>Create a FundRaise Campaign</h2>
    
			<%
			String errorMessage = request.getParameter("errorMessage");
			if (errorMessage != null) {
				out.println("<p class='error'>" + errorMessage + "</p>");
			}
			%>
    <form action="CreateFundraiseServlet" method="post">
        <label for="cause">Cause:</label><br>
        <input type="text" id="cause" name="cause" autocomplete="off" required><br>
        
        <label for="coverpic">Cover Picture URL:</label><br>
        <input type="text" id="coverpic" name="coverpic" required><br>
        
        <label for="title">Title:</label><br>
        <input type="text" id="title" name="title" required><br>
        
        <label for="story">Story:</label><br>
        <textarea id="story" name="story" rows="4" cols="50" required></textarea><br>
        
        <label for="expectedAmt">Expected Amount:</label><br>
        <input type="number" id="expectedAmt" name="expectedAmt" required><br>
        
        <input type="submit" value="Create Fundraiser">
    </form>
</body>
</html>
