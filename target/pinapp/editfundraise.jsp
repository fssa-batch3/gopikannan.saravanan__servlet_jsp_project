<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Fundraise</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
 <h2>Edit FundRaise Campaign</h2>
  <c:if test="${not empty fundraise}">
  <form action="UpdateFundraiseServlet" method="post">
        <input type="hidden" name="fundraiseId" value="${fundraise.fundraiseid}">
        <label for="cause">Cause:</label><br>
        
        <input type="text" id="cause" name="cause"  value="${fundraise.cause}"required><br>
        
        <label for="coverpic">Cover Picture URL:</label><br>
        <input type="text" id="coverpic" name="coverpic"  value="${fundraise.coverPic}" required><br>
        
        <label for="title">Title:</label><br>
        <input type="text" id="title" name="title"  value="${fundraise.title}" required><br>
        
        <label for="story">Story:</label><br>
        <textarea id="story" name="story" rows="4" cols="50"  required>${fundraise.story}</textarea><br>
        
        <label for="expectedAmt">Expected Amount:</label><br>
        <input type="number" id="expectedAmt" name="expectedAmt"value="${fundraise.expectedAmount}" required><br>
        
        <input type="submit" value="Update Fundraise">
    </form>
      </c:if>

    <!-- Display an error message if there was a ServiceException -->
    <c:if test="${not empty errorMessage}">
        <p>Error: ${errorMessage}</p>
    </c:if>
</body>
</html>