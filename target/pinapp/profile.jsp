<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>profile</title>
    <link rel="stylesheet" href="./assets/profile.css">
    <link rel="stylesheet" href="./assets/universal.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
    <h1>User Profile</h1>
	<%
				String errorMessage = request.getParameter("errorMessage");
				if (errorMessage != null) {
					out.println("<p class='error'>" + errorMessage + "</p>");
				}
				%>
	<a href="LogoutServlet">Logout</a>			
    <c:if test="${not empty user}">
        <p>Name: ${user.username}</p>
        <p>Email: ${user.mail}</p>
        <div id="pwdContainer">
            <p id="pwd">Password: ********</p>
            <button id="showpassword" onclick="passwordShow()">Show Password</button>
        </div>
        <p>Phone: ${user.mobileno}</p>
        <p>Account Number: ${user.accNo}</p>
        <p>IFSC code: ${user.ifscNo}</p>
        <p>Account Holder Name: ${user.accName}</p>

        <div id="editForm" style="display: none;">
            <form id ="form" action="UserProfileServlet" method="post">
                <label for="username">Name:</label>
                <input type="text" id="username" name="username" value="${user.username}">
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${user.mail}">
               
                <label for="password">Password</label>
                <input type="password" id="password" name="password" value="${user.password} ">
                
                <label for="phone">Phone:</label>
                <input type="tel" id="phone" name="phone" value="${user.mobileno}">
                
                <label for="accountNo">Account Number:</label>
                <input type="number" id="accno" name="accno" value="${user.accNo}">    
                
                <label for="accountIfsc">Account IFSC:</label>
                <input type="text" id="ifsc" name=ifsc value="${user.ifscNo}">
                
               <label for="accountName">Name:</label>
               <input type="text" id="accountName" name="accountName" value="${user.accName}">
                  
               <button onclick="save()">Save</button>
                
                
                
            </form>
        </div>
        <button onclick="edit()">Edit</button>
        
    </c:if>

    <!-- Display an error message if there was a ServiceException -->
    <c:if test="${not empty errorMessage}">
        <p>Error: ${errorMessage}</p>
    </c:if>

    <script>
        function edit() {
            document.getElementById('editForm').style.display = 'block';
        }

        function save() {
            document.getElementById('editForm').style.display = 'none';
        }

        function passwordShow() {
            let passwordElement = document.getElementById('pwd');
            let showPasswordButton = document.getElementById('showpassword');

            if (passwordElement.textContent === 'Password: ********') {
                passwordElement.textContent = 'Password: ${user.password}';
                showPasswordButton.textContent = 'Hide Password';
            } else {
                passwordElement.textContent = 'Password: ********';
                showPasswordButton.textContent = 'Show Password';
            }
        }
    </script>
</body>
</html>
