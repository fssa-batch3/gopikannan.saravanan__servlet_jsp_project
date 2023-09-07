<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PIN Register page</title>
<link rel="stylesheet" href="./assets/login.css">
</head>
<body>
	<div class="main">
		<div class="signup">
			<label>Sign up</label>

			<%
			String errorMessage = request.getParameter("errorMessage");
			if (errorMessage != null) {
				out.println("<p class='error'>" + errorMessage + "</p>");
			}
			%>
			<form action="register" method="post">
				<input type="text" id="name" name="username"
					title="Use only alphabets for your name" autocomplete="off" placeholder="User name"
					required /> <input type="text" id="mobileno" name="mobileno"
					placeholder="Mobile number" 
					title="Phone number must have 10 digits" maxlength="10" /> <input
					type="email" id="email" name="email" placeholder="Email"
					title="Enter the correct email" required /> <input type="password"
					id="password" name="password" placeholder="Password" required />

				<button id="log-in" type="submit">Sign up</button>
			</form>
		</div>
	</div>
</body>
</html>
