<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/login-signup.css">
		<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/universal.css">
</head>
<body>

	<div class="h1">Welcome To PIN (People in Need)</div>
	<div class="h1-txt">India's No 1 Crowdfunding Platform</div>

	<div class="main" style="height: 500px">
		<div class="login">


			<form action="/pinapp/login" method="post">
				<label>Login</label>
				<%
				String errorMessage = (String) request.getAttribute("errorMessage");
				if (errorMessage != null) {
				%>
				<p class='error'><%=errorMessage%></p>
				<%
				}
				%>

				<input id="email" 
				type="email" 
				placeholder="Email"
				autocomplete="off" 
				name="email"
          		pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
                title="Enter the correct email"
                value="${email}"
                required /> 
                
				<input type="password"
				id="password" 
				name="password" 
           		title="Please include at least 1 uppercase letter, 1 lowercase letter, 1 number, and 1 special character (@#$%^&+=!)"
            	placeholder="Password"
            	value="${password}"
            	required />
            	<img id="passwordImage" src="../assets/images/hide.png" onclick="togglePassword()" alt="pwd">
				<button type="submit">Login</button>

				<br /> <a href="<%=request.getContextPath() %>/login-signup/register.jsp"
					style="padding-left: 30px; color: blueviolet; text-decoration: none">Don't
					have an account register here</a>
			</form>
		</div>
	</div>
	
<script>
function togglePassword() {
    const passwordInput = document.getElementById('password');
    const passwordImage = document.getElementById('passwordImage');

    if (passwordInput.type === 'text') {
      passwordInput.type = 'password';
      passwordImage.src = '../assets/images/hide.png';
    } else if (passwordInput.type === 'password') {
      passwordInput.type = 'text';
      passwordImage.src = '../assets/images/view.png';
    }
  }
</script>
</body>
</html>
