<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>PIN</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/universal.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/style.css">
<!-- Add your CSS files here -->
</head>
<body onload="getAllAccounts()">
<jsp:include page="components/loader.jsp"></jsp:include>
	<jsp:include page="components/header1.jsp"></jsp:include>
	
	<div id="hello" class="hero-sec">
		<img class="banner" src="./assets/images/Hero Banner (1).png"
			alt="banner" width="100%" />
	</div>
	<div class="side-head">Thousands are fundraising on PIN</div>
	<div class="search">
		<input type="text" placeholder="Search by name, location, cause..."
			name="search" id="search" /> <i class="fa fa-search"
			style="width: 20px;"></i>
	</div>
	<div id="container" class="container"></div>
	<div class="viewmore">
		<img src="./assets/images/arrow-down-sign-to-navigate.png" alt="arrow"
			class="arrow" />
		<div>
			<a href="<%=request.getContextPath()%>/donate/donate.jsp" class="more">View More
				Fundraisers</a>
		</div>
	</div>
	<div class="boxes">
		<p class="heading">Frequently Asked Questions</p>
		<div class="faqs">
			<details>
				<summary>How do I raise funds?</summary>
				<p class="text">
					To Start a Fundraiser, follow the three steps: <br /> 1. Sign up
					on Pin <br /> 2. Fill up the basic fundraise form <br /> 3. Hit
					Submit <br />
				</p>
			</details>
			<details>
				<summary>Can I raise funds for a friend as well?</summary>
				<p class="text">Yes, you can also raise funds for a friend, a
					loved one, or anyone in need during life's crucial moments</p>
			</details>
			<details>
				<summary>Does the raised amount reach the individual
					directly?</summary>
				<p class="text">With Pin, the money you collect goes directly to
					the bank account associated with your fundraising page. Raising
					money has never been easier.</p>
			</details>
			
			<details>
				<summary>I have more questions, who do I write to?</summary>
				<p class="text">Redirect to the contact page and fill the form
					to contact us directly</p>
			</details>
		</div>
	</div>
	<jsp:include page="/components/card.jsp"></jsp:include>
	
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<jsp:include page="components/footer.jsp"></jsp:include>
</body>
</html>
