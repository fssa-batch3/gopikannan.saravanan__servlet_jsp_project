<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PIN(People In Need) My donations</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="<%=request.getContextPath()%>/assets/css/donationdownload.css"
    />

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
  <jsp:include page="/components/loader.jsp"></jsp:include>
    <!--  header starts-->
    
      <jsp:include page="/components/header1.jsp"></jsp:include>
    <!-- header ends -->

    <!-- main content starts -->

    <!-- overall container starts -->
    <div class="maincontainer"></div>

    <button onclick="download()" id="mydonations">My Donations</button>

    <!-- overall container ends -->
    <!-- Footer  -->
     <jsp:include page="/components/footer.jsp"></jsp:include>
    <!-- footer end -->
     <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/donationDownload.js"></script>
  </body>
</html>
