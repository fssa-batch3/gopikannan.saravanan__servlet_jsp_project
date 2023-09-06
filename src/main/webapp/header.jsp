<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <style>
        
        header {
            background-color: #9370DB; 
            padding: 10px;
            text-align: center;
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            display: inline;
            margin-right: 20px;
        }

        nav ul li a {
            text-decoration: none;
            color: #FFFFFF; 
            font-weight: bold;
        }

      
        nav ul li a:hover {
            color: #3f3a81;
        }
    </style>
<head>
    <meta charset="ISO-8859-1">
    <title>Pin Home</title>
</head>
<body>
    <header>
       
        <nav>
            <ul>
                <li><a href="GetAllFundrasie">Home</a></li>
                <c:if test="${empty sessionScope.loggedInEmail}">
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="register.jsp">Signup</a></li>
                </c:if>
                <c:if test="${not empty sessionScope.loggedInEmail}">
                    <li><a href="createfundraise.jsp">Create FundRaise campaigns</a></li>
                    <li><a href="UserProfileServlet">Profile page</a></li>
                    <li><a href="ViewUserFundraiseCards">View User Fundraise</a></li>
                    <li><a href="LogoutServlet">Logout</a></li>
                </c:if>
            </ul>
        </nav>
    </header>
</body>
</html>

