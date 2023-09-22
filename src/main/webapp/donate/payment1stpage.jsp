<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PIN(People In Need) My donations</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/payment1stpage.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/universal.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <script type="text/javascript">
      function togglemenu() {
        document.getElementById("sidebar").classList.toggle("active");
      }
    </script>
  </head>
  <body>
    <!--  header starts-->
       <jsp:include page="/components/header1.jsp"></jsp:include>
    <!-- header ends -->

    <div class="paymentpage">Payment Page</div>

    <form id = "form"class="container" action = "../fundraiser/directbanktransfer.jsp">
      <div class="amount">
        <label> Your Contribution :</label>&nbsp;&nbsp;
        <input type="hidden" name="fundraiseid" id="fundraiseid" value="<%= request.getParameter("product_id")%>">
        <input
          id="Contribution"
          type="number"
          name="money"
          currency="INR"
          class="currency"
          min="1"
          placeholder="In INR"
          required
        />
      </div>
 
      <!-- Buttons-sec -->
      <div class="donate-sec">
        <!-- <button id="debit" class="donate-btn">Donate Using Debit Card</button> -->
        <a  id="banktransfer" class="banktransfer">
          Donate Now
        </a>
      </div>
     
    </form>
    

    <!-- Footer  -->
     <jsp:include page="/components/footer.jsp"></jsp:include>


    <!-- footer end -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/payment.js"></script> 
  </body>
</html>
