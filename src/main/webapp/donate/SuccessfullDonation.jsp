<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You for Your Donation</title>
    <link rel="stylesheet"
    href="<%=request.getContextPath()%>/assets/css/universal.css">
    <style>
      #success {
        text-align: center;
        margin-top: 30px;
      }

      #head {
        display: flex;
        justify-content: center;
        align-items: center;
      }

      #tick {
      	width:60px;
        padding-top: 30px;
        padding-left: 10px;
      }

      .container {
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: rgb(180, 193, 255) 4px 4px 4px;
        padding: 20px;
        margin: 20px auto;
        margin-top: 15px;
        font-size: 20px;
        line-height: 1.5;
        max-width: 400px;
        text-align: justify;
      }

      #title {
        color: var(--body-text-color);
        text-align: center;
        font-weight: bold;
        font-size: 26px;
        padding-bottom: 15px;
      }

      .btn {
        width: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        text-decoration: none;
        margin: auto;
        height: 40px;
        border-radius: 10px;
        background-color: var(--body-text-color);
        color: var(--toggle-color);
        cursor: pointer;
        font-weight: 600;
        font-size: 16px;
        border: none;
        margin-bottom: 30px;
        margin-top: 20px;
      }

      .btn:hover {
        background-color: var(--primary-color);
      }
    </style>
</head>
<body>
 <jsp:include page="/components/header1.jsp"></jsp:include>
 <span id="head">
 <h1 id="success">Donation Successful</h1>
 <img id="tick" src="../assets/images/heart-tick.png">
 </span>
    <div class="container">
   
        <p id="title">Thank You for Your Donation!</p>
        We wanted to say a big thank you for your recent donation. Your support means a lot to us, and we're truly grateful.

        Your donation is helping us do important work, and we appreciate it very much. If you'd like a receipt for your donation, you can get it by clicking the button below.
        Once again, thank you for making a difference with your support. We truly appreciate it.
        <a href="<%= request.getContextPath() %>/LastDonationFromDb" class="btn">Download Receipt</a>
    </div>
    
    <jsp:include page="/components/footer.jsp"></jsp:include>
</body>
</html>
