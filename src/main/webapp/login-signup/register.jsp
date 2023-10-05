<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PIN Register page</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/login-signup.css">
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/universal.css">
	
</head>
<body>
	<div class="main">
		<div class="signup">
			<label>Sign up</label>

			<%
				String errorMessage = (String) request.getAttribute("errorMessage");
				if (errorMessage != null) {
				%>
				<p class='error'><%=errorMessage%></p>
				<%
				}
				%>
			<form action="/pinapp/register" method="post">
				<input type="text" 
				id="name" 
				name="username"  
				title="Use only alphabets for your name" 
				autocomplete="off" 
				placeholder="User name" 
				value="${name}"
				required /> 
				
					<input type="text" 
					id="mobileno" 
					pattern="[6-9]{1}[0-9]{9}"
					name="mobileno" 
					placeholder="Mobile number" 
					title="Phone number must have 10 digits" 
					maxlength="10" 
					value="${mobileno}"
					required
					/> 
					
					<input
					type="email" 
					id="email" 
					name="email" 
					pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
					placeholder="Email"
					title="Enter the correct email"
					value="${email}"
					required /> 
					
					<input 
					type="password"
					id="password" 
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!]).{8,}"
					name="password" 
					placeholder="Password" 
					value="${password}"
					required />

				<button id="log-in" type="submit">Sign up</button>
				<a href="./index.jsp">Go Back To Home</a>
			</form>
		</div>
	</div>
</body>
</html>
