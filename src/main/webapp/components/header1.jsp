<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fssa.pin.model.User"%>
<%@ page import="com.fssa.pin.service.UserService"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/header.css" />

</head>
<body>
	<%
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");

	if (loggedInEmail != null) {
		UserService userService = new UserService(); 
        User user = userService.findUserByEmailService(loggedInEmail);
		String username = user.getUsername();
		String userpic = user.getProfilePic();
	%>
	<header>
		<div class="menudiv">
			<a class="menulink" onclick="togglemenu()"> <img class="menu"
				src="<%= request.getContextPath() %>/assets/images/menu (2).png" alt="menu" width="25">
			</a>
		</div>
		<div class="image-txt">
			<span> <img id="logoid"
				src="<%= request.getContextPath() %>/assets/images/business-community.png" 
				alt="group of people" class="logo" id= "logoid">
			</span> <span id="logonameid" class="name">People In Need</span>
		</div>
		<div class="nav" id="sidebar" onclick="togglemenu()">
			<a href="<%= request.getContextPath() %>/index.jsp" class="nav-anchor" id="homeId">Home</a> 
			<a href="<%= request.getContextPath() %>/donate/donate.jsp" class="nav-anchor donate" id="donateid">Donate</a> 
			<a href="<%= request.getContextPath() %>/fundraiser/fundraiser.jsp" class="nav-anchor fundraise" id="fundraiseid">Fundraise</a> 
			<a href="<%= request.getContextPath() %>/header/about.jsp" class="nav-anchor" id="aboutId">About</a> 
			<a href="<%= request.getContextPath() %>/header/contact.jsp" class="nav-anchor" id="contactId">Contact</a> 
		<img class="profile" src=<%=userpic %> alt="Profile" title="profile" id="profileid">
			<div class="profile-opt">
				<%=username%>
				<a href="<%= request.getContextPath() %>/UserProfileServlet">Profile</a> 
				<a href="<%= request.getContextPath()  %>/LogoutServlet">Logout</a>
			</div>
		</div>
	</header>
	<script>
	const profilehover = document.querySelector(".profile");
		  const profileOptions = document.querySelector(".profile-opt");

		  profilehover.addEventListener("click", () => {
		    profileOptions.style.display = "block";
		  });
		  profilehover.addEventListener("mouseout", () => {
		    profileOptions.style.display = "none";
		  });
		  profileOptions.addEventListener("mouseover", () => {
		    profileOptions.style.display = "block";
		  });
		  profileOptions.addEventListener("mouseout", () => {
		    profileOptions.style.display = "none";
		  });
		  </script>
	<%
	} else {
	%>
	<header>
		<div class="menudiv">
			<a class="menulink" onclick="togglemenu()"> <img class="menu"
				src="<%= request.getContextPath() %>/assets/images/menu (2).png" alt="menu" width="25">
			</a>
		</div>
		<div class="image-txt">
			<span> <img id="logoid"
				src="<%= request.getContextPath() %>/assets/images/business-community.png" 
				alt="group of people" class="logo" id= "logoid">
			</span> <span id="logonameid" class="name">People In Need</span>
		</div>
		<div class="nav" id="sidebar" onclick="togglemenu()">
			<a href="<%= request.getContextPath() %>/index.jsp" class="nav-anchor" id="homeId">Home</a> 
			<a href="<%= request.getContextPath() %>/fundraiser/fundraiser.jsp" class="nav-anchor fundraise" id="fundraiseid">Fundraise</a> 
			<a href="<%= request.getContextPath() %>/donate/donate.jsp" class="nav-anchor donate" id="donateid">Donate</a> 
				<a href="<%= request.getContextPath() %>/header/about.jsp" class="nav-anchor" id="aboutId">About</a> 
			<a href="<%= request.getContextPath() %>/header/contact.jsp" class="nav-anchor" id="contactId">Contact</a> 
			<a href="<%= request.getContextPath() %>/login-signup/register.jsp" class="nav-anchor" id="signinId">Signup</a> 
			<a href="<%= request.getContextPath() %>/login-signup/login.jsp" class="nav-anchor" id="loginId">Login</a>
		</div>
	</header>
	<%
	}
	%>


	<script>

 
			function togglemenu() {
				document.getElementById("sidebar").classList.toggle("active");
		}

		function logout() {
			window.location.href = "/LogoutServlet";
		}

		function logo() {
			window.location.href = "<%= request.getContextPath() %>/index.jsp";
		}
		
		document.getElementById("logoid").addEventListener("click", logo);
		
		
	</script>
</body>
</html>
