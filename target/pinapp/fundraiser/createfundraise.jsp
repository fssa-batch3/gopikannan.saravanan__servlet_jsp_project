<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Fundraise</title>
    <link rel="stylesheet" href="./assets/css/universal.css">
</head>
<body>
    <h2>Create a FundRaise Campaign</h2>
    
			<% 
       			String errorMessage = (String) request.getAttribute("errorMessage");
    			if (errorMessage != null) { 
				%>
    			<p class='error'><%= errorMessage %></p>
				<% } %>
    <form action="<%= request.getContextPath() %>/CreateFundraiseServlet" method="post">
        <label for="cause">Cause:*</label><br>
        <input type="text" id="cause" name="cause"  autocomplete="off" value="${cause}" required><br>
        
        <label for="coverpic">Cover Picture URL:*</label><br>
        <input type="text" id="coverpic" name="coverpic" value="${coverpic}" required><br>
        
        <label for="title">Title:*</label><br>
        <input type="text" id="title" name="title" value="${title}" required><br>
        
        <label for="story">Story:*</label><br>
        <textarea id="story" name="story" rows="4" cols="50"  required>${story}</textarea><br>
        
        <label for="expectedAmt">Expected Amount:*</label><br>
        <input type="number" min = 1 id="expectedAmt" name="expectedAmt" value="${expectedAmt}"required><br>
        
        <input type="submit" value="Create Fundraiser">
    </form>
</body>
</html>
