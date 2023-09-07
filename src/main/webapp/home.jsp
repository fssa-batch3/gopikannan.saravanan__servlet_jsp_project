<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>All Fundraise Campaigns</title>
<style>
.fundraise-card {
	border: 1px solid #ccc;
	padding: 10px;
	margin: 10px;
	max-width: 300px;
	height: auto;
	 background-color: white;
}

.fundraise-card h2 {
	margin: auto;
	font-size:19px;
}

#coverpic {
	max-width: 100%;
	max-height: 200px;
	display: block;
	margin: auto;
}

#fundraiseContainer {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: flex-start;
}

h1,h3{
 text-align: center;}
details {
	padding: 10px 20px;
	border-radius: 7px;
	margin-top: 20px;
	font-family: "Poppins", sans-serif;
	font-size: 17px;
	letter-spacing: 1px;
	font-weight: 400;
	cursor: pointer;
}

details summary {
	outline: none;
	font-size: 19px;
	font-weight: bold;
	
}

.boxes {
	width: 60%;
	margin: 60px auto;
	background: #fff;
	border-radius: 7px;
	box-shadow: 1px 2px 4px rgba(0, 0, 0, 0.3);
}

.boxes .heading {
	background-color: #eee;
	border-radius: 7px 7px 0px 0px;
	padding: 10px;
	color: var(--body-text-color);
	text-align: center;
	font-family: "Poppins", sans-serif;
	font-size: 22px;
	font-weight: bold;
}

.text {
	margin-top: 10px;
	color: #3f3a81;
}
</style>
<link rel="stylesheet" href="./assets/universal.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>Welcome to PIN - People In Need</h1>
	<h3>Together we make a difference</h3>


	<div class="fundraise-cards" id="fundraiseContainer">
		<c:forEach var="fundraise" items="${requestScope.FUNDRAISE_LIST}">
			<div class="fundraise-card">
				<h2>${fundraise.title}</h2>
				<p>Cause: ${fundraise.cause}</p>
				<p>Expected Amount : ${fundraise.expectedAmount}
				<img id="coverpic" src="<c:url value='${fundraise.coverPic}'/>"
					alt="Fundraise Cover">
				
				
			</div>
		</c:forEach>
	</div>


	<div class="boxes">
		<p class="heading">Frequently Asked Questions</p>
		<div class="faqs">
			<details>
				<summary>How do I raise funds?</summary>
				<p class="text">
					To Start a Fundraiser, follow the three steps: <br /> 1. Sign up
					on PIN <br /> 2. Fill up the basic fundraise form <br /> 3. Hit
					Submit <br />
				</p>
			</details>
			<details>
				<summary>Can I raise funds for a friend as well?</summary>
				<p class="text">Yes, you can also raise funds for a friend, a
					loved one or anyone in need during life's crucial moments</p>
			</details>
			<details>
				<summary> Does the raised amount reach the individual
					directly? </summary>
				<p class="text">With PIN, the money you collect goes directly to
					the bank account associated with your fundraising page. Raising
					money for yourself or anyone has never been easier.</p>
			</details>
			<details>
				<summary>Is it safe?</summary>
				<p class="text">Your PIN fundraiser features and donate features
					the very best in secure payment encryption technology.</p>
			</details>

		</div>
	</div>
</body>
</html>
