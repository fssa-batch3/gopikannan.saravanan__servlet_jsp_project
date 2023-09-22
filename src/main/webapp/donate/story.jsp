<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PIN(People In Need) story.in</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/story.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/header.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/footer.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/universal.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script type="text/javascript">
      function togglemenu() {
        document.getElementById("sidebar").classList.toggle("active");
      }
    </script>
  </head>
  <body onload="getAllAccounts()">
    <jsp:include page="/components/header1.jsp"></jsp:include>

    <div class="content-supporter-container">
    </div>

    <!-- end supporter contribution section -->

    <div class="second-container">
      <!-- chat box container -->
      <div class="chat-box">
        <div class="chat-head">Comment Box</div>

        <div class="chat">
          <div class="chat-history"></div>
        </div>
      </div>
    </div>

    <!-- end overall div -->

    <!-- Footer  -->

    <!-- footer end -->
   

    <script src="https://momentjs.com/downloads/moment.js" integrity="sha384-mFSRsfjTuXtihSLc/J0LxrFE1H9WRRllwGM6pxxyiYACkVdxRG82d3DQVlq8yXZM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/details.js"></script>
    <jsp:include page="/components/footer.jsp"></jsp:include>
  </body>
</html>
