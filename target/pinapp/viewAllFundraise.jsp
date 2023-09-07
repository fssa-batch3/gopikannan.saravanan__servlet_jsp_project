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
}

.fundraise-card h2 {
	margin: 0;
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
</style>
</head>
<body>
	<h1>All Fundraise Campaigns</h1>
	<a href="home.jsp">Go Back to Home</a>

	<div class="fundraise-cards" id="fundraiseContainer">
		<c:forEach var="fundraise" items="${requestScope.FUNDRAISE_LIST}">
			<div class="fundraise-card">
				<h2>${fundraise.title}</h2>
				<p>Cause: ${fundraise.cause}</p>
			<img id="coverpic" src="<c:url value='${fundraise.coverPic}'/>"
					alt="Fundraise Cover"> 
			</div>
		</c:forEach>
	</div>
</body>
</html>
