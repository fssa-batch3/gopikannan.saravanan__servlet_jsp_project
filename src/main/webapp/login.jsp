<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="./assets/login.css">
</head>
<body>
	<h1>Login Page</h1>

	<div class="h1">Welcome To PIN (People in Need)</div>
	<div class="h1-txt">India's No 1 Crowdfunding Platform</div>

	<div class="main" style="height: 580px">
		<div class="login">


			<form action="login" method="post">
				<label>Login</label>
				<% 
       			String errorMessage = (String) request.getAttribute("errorMessage");
    			if (errorMessage != null) { 
				%>
    			<p class='error'><%= errorMessage %></p>
				<% } %>

				<input id="email" type="email" placeholder="Email" autocomplete="off" name="email" />

				<input type="password" id="password" name="password"
					placeholder="Password" />

				<button type="submit">Login</button>
			
				<br /> <a href="./register.html"
					style="padding-left: 30px; color: blueviolet; text-decoration: none">Don't
					have an account register here</a>
			</form>
		</div>
	</div>
</body>
</html>
