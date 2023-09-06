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
<link rel="stylesheet" href="./assets/universal.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<h1>Welcome to PIN - People In Need</h1>
	

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
