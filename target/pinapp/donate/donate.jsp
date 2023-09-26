<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>PIN(People In Need).in</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/donate.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/header.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/footer.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/universal.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/js/donate.js" />

<!-- Add your other links here -->

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<script type="text/javascript">
	function togglemenu() {
		document.getElementById("sidebar").classList.toggle("active");
	}
</script>
</head>
<body onload="getAllAccounts()">
	<!-- header starts -->
	<jsp:include page="/components/loader.jsp"></jsp:include>
	<jsp:include page="/components/header1.jsp"></jsp:include>

	<!-- header end -->

	<!-- search box sec -->
	<div class="search"></div>
	<!-- search box sec -->

	<!-- script for refine search button -->
	<script>
		function myFunction() {
			document.getElementById("myDropdown").classList.toggle("show");
		}

		window.onclick = function(e) {
			if (!e.target.matches(".dropbtn")) {
				let myDropdown = document.getElementById("myDropdown");
				if (myDropdown.classList.contains("show")) {
					myDropdown.classList.remove("show");
				}
			}
		};
	</script>
	<!-- script ends -->
	<div id="container" class="container"></div>
	<jsp:include page="/components/card.jsp"></jsp:include>

	<!-- end container -->

	<div class="viewmore">
	<img
			src="<%=request.getContextPath()%>/assets/images/arrow-down-sign-to-navigate.png"
			alt="arrow" class="arrow" /> 
		<div>
			<a href="#" class="more">View More Fundraisers</a>
		</div>
	</div>

	<!-- Footer  -->
	<jsp:include page="/components/footer.jsp"></jsp:include>

	<!-- footer end -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<script src="<%=request.getContextPath()%>/assets/js/donate.js"></script>
</html>
