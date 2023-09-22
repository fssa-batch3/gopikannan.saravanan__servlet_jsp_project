<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>profile</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/profile.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/universal.css">
</head>
<body>
   <jsp:include page="/components/header1.jsp"></jsp:include>
	
    <c:if test="${not empty user}">
  
		<div id="profile">
		<%
				String errorMessage = request.getParameter("errorMessage");
				if (errorMessage != null) {
					out.println("<p class='error'>" + errorMessage + "</p>");
				}
				%>
 		<img id="profilepic"src="${user.profilePic}"> 
			<p class="text"><b>Name:</b> ${user.username}</p>
			<p class="text"><b>Email:</b> ${user.mail}</p>
			<div id="pwdContainer">
				<p  class="text" id="pwd"><b>Password:</b> ********</p>
				<button class="save"  id="showpassword" onclick="passwordShow()">Show
					Password</button>
			</div>
			<p class="text"><b>Phone:</b> ${user.mobileno}</p>
			<p class="text"><b>Account Number:</b> ${user.accNo}</p>
			<p class="text"><b>IFSC code:</b> ${user.ifscNo}</p>
			<p class="text"><b>Account Holder Name:</b> ${user.accName}</p>
		</div>
		<div id="editForm" style="display: none;">
            <form class="container"id ="form" action="UserProfileServlet" method="post">
          
            	<label for="profilePic">Profile photo:</label>
                <input type="text" id="profilePic" name="profilePic" value="${user.profilePic}">
                
                <label for="username">Name:</label>
                <input type="text" id="username" name="username" value="${user.username}">
                
                <input hidden type="email" id="email" name="email" value="${user.mail}">
               
                <label for="password">Password</label>
                <input type="password" id="password" name="password" value="${user.password} ">
                
                <label for="phone">Phone:</label>
                <input type="tel" id="phone" name="phone" value="${user.mobileno}">
                
                <label for="accountNo">Account Number:</label>
                <input type="number" id="accno" name="accno" value="${user.accNo}">    
                
                <label for="accountIfsc">Account IFSC:</label>
                <input type="text" id="ifc" name=ifsc value="${user.ifscNo}">
                
            <!--     <label for="accountBankName">Account Bank Name:</label>
                <input type="text" id="accname" name=accname >
                
                <label for="accountBranchName">Account Branch Name:</label>
                <input type="text" id="branchname" name=branchname >
                       -->
               <label for="accountName">Name:</label>
               <input type="text" id="accountName" name="accountName" value="${user.accName}">
                  
               <button class="save" onclick="save()">Save</button>
                
                
                
            </form>
        </div>
        <button class="save" onclick="edit()">Edit</button>
        
    </c:if>

    <!-- Display an error message if there was a ServiceException -->
    <c:if test="${not empty errorMessage}">
        <p>Error: ${errorMessage}</p>
    </c:if>

    <script>
        function edit() {
            document.getElementById('editForm').style.display = 'block';
        }

        function save() {
            document.getElementById('editForm').style.display = 'none';
        }

        function passwordShow() {
            let passwordElement = document.getElementById('pwd');
            let showPasswordButton = document.getElementById('showpassword');

            if (passwordElement.textContent === 'Password: ********') {
                passwordElement.textContent = 'Password: ${user.password}';
                showPasswordButton.textContent = 'Hide Password';
            } else {
                passwordElement.textContent = 'Password: ********';
                showPasswordButton.textContent = 'Show Password';
            }
        }
        
        

        let bankName = document.getElementById("accname");
        let branchName = document.getElementById("branchname");

        // event listener called change to make the users ifsc find and fetch from the api razor api

        document
          .getElementById("ifc")
          .addEventListener("change", function (event) {
            const ifscValue = event.target.value;

            fetch(`https://ifsc.razorpay.com/${ifscValue}`)
              .then((response) => response.json())
              .then((data) => {
                bankName.value = data["BANK"];
                branchName.value = data["BRANCH"];
              })
              .catch((error) => {
                bankName.value = "";
                branchName.value = "";
                console.error("Error:", error);
                alert(
                  "Failed to fetch bank and branch details for the entered IFSC code."
                );
              });
          });
    </script>
    <jsp:include page="/components/footer.jsp"></jsp:include>
</body>
</html>
