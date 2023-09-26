<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PIN(People In Need) My donations</title>
    <link
      rel="stylesheet"
      href="<%= request.getContextPath() %>/assets/css/basicdetailsfunddraiser.css"
    />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/header.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/footer.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/universal.css" />
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
    <div class="details-head">Fundraiser Basic Details</div>

    <!-- container starts -->
    <div class="container">
      <!-- form start -->

      <form id="form" method="post" action="<%= request.getContextPath() %>/CreateFundraiseServlet">
      <% 
       			String errorMessage = (String) request.getAttribute("errorMessage");
    			if (errorMessage != null) { 
				%>
    			<p class='error'><%= errorMessage %></p>
				<% } %>
     
        
   <!--      <div class="input-div">
          <label>I am raising fund for:</label>
          <select name="fundraisefor" id="fundraisefor">
            <option value="Myself">Myself</option>
            <option value="Others">Others</option>
          </select>
        </div>
         -->
        
        
        
        <div class="input-div">
          <label>Cause:</label>
          <select name="cause" id="cause">
            <option value="Medical">Medical</option>
            <option value="Educational">Educational</option>
            <option value="Socialcause">Social Cause</option>
          </select>
        </div>
       <!-- <!--  <div class="input-div">
          <label>Address:</label
          ><input
            id="address"
            required
            type="text"
            title="Enter your full address where you live"
            pattern="^(?=.{0,200}$)[A-Za-z0-9!@#$%^&*()_+-={}[\]|\\;:'>,.?/]+[A-Za-z0-9]+(?:\s[A-Za-z0-9\s!@#$%^&*()_+-={}[\]|\\;:'>,.?/]+[A-Za-z0-9]+){0,10}$"
            required
          />
        </div> --> 

        <div class="input-div">
          <label>Cover Picture:</label>

          <input
            id="image"
            type="url"
            placeholder="place your image url"
            name="coverpic" 
            value="${coverpic}"
            title="enter only image urls"
            required
          />
        </div>
        <div class="input-div">
          <label>Title:</label>
          <input
            id="title"
            type="text"
            title="Enter the title of your card with only alphabets"
            name="title" value="${title}"
            required
            pattern="^(?=.{4,100}$)[A-Za-z]+(?:\s[A-Za-z]+){0,10}$"
          />
        </div>
        <!-- <div class="input-div">
          <label>Name:</label>
          <input
            id="name_hos"
            type="text"
            required
            placeholder="Hospital,School,organization name"
            title="Enter the input with only alphabets with spaces optional"
            pattern="^(?=.{4,100}$)[A-Za-z]+(?:\s[A-Za-z]+){0,10}$"
          />
        </div> -->
       <!--  <div class="input-div">
          <label>Location:</label>
          <input
            id="location2"
            type="text"
            required
            placeholder="Hospital,School,organization location"
            title="Enter the input with only alphabets with spaces optional"
            pattern="^(?=.{4,100}$)[A-Za-z]+(?:\s[A-Za-z]+){0,10}$"
          />
        </div>
        -->
        <div class="input-div">
          <label>Write Your Detail Story:</label>
          <textarea
            value="Our school..."
            name="story" 
            id="story"
            pattern="^(?=.{10,500}$)[A-Za-z0-9!@#$%^&*()_+-={}[\]|\\;:'>,.?/]+[A-Za-z0-9]+(?:\s[A-Za-z0-9\s!@#$%^&*()_+-={}[\]|\\;:'>,.?/]+[A-Za-z0-9]+){0,50}$"
            rows="5"
            cols="50" 
            required
            title="Enter the details of your story with alphabets,numbers,special characters"
            placeholder="Write about who is this fundraiser for How/Why/When  do you need funds what is the purpose..."
          >${story}</textarea>
        </div>
        <div class="input-div">
          <label>Upload Required Documents :</label>
          <input id="image_doc" type="url" name="document" value="${document}"title="enter only image urls" />
        </div> 
        <div class="input-div">
          <label>I want to raise the amount Rs:</label>
          <input
            id="amount"
            type="text"
            placeholder="Expected amount"
            title="Enter only the amount only in numbers"
             name="expectedAmt" value="${expectedAmt}"
            pattern="[0-9]{5,20}"
            maxlength="20"
            required
          />
        </div>

        <!-- <div class="input-div">
          <label>Your UPI url:</label>
          <input
            id="upi"
            type="url"
            placeholder="paste your upi url"
            title="enter only image urls"
          />
        </div> -->

        <!-- <a href="../fundraiser/Fundraiserdetailsform1.html">  -->
        <button type="submit" class="continue">Continue</button>
      </form>
      <!-- </a>  -->
      <!-- form ends -->
    </div>
    <!-- container ends -->
    
    <!-- Footer  -->
   <jsp:include page="/components/footer.jsp"></jsp:include>
    <!-- footer end -->

<!--     <script>
      const form = document.getElementById("form");

      form.addEventListener("submit", function (event) {
        event.preventDefault();
        let userid = JSON.parse(
          window.localStorage.getItem("userCheckdetails")
        );
        let arr = [];

        if (localStorage.getItem("carddetails") != null) {
          arr = JSON.parse(localStorage.getItem("carddetails"));
        }
        console.log(arr);

        const name = document.getElementById("name").value.trim();
        const mail = document.getElementById("email").value.trim();
        const dropDown = document.getElementById("cause").value;
        const mobileno = document.getElementById("mobileno").value.trim();
        const address = document.getElementById("address").value.trim();
        const image = document.getElementById("image").value;
        const title = document.getElementById("title").value.trim();
        const name_hosp = document.getElementById("name_hos").value.trim();
        const location = document.getElementById("location2").value.trim();
        const storySum = document.getElementById("storySum").value.trim();
        const story = document.getElementById("story").value.trim();
        const image_doc = document.getElementById("image_doc").value;
        const amount = document.getElementById("amount").value.trim();
        // const amount_raised = document.getElementById("amount_raised").value;
        const upi = document.getElementById("upi").value.trim();

        const product_id = Date.now();

        let match = false;

        if (story === "") {
          alert("Detail of your story can't be left empty");
          return;
        } else {
          match = true;
        }

        if (match == true) {
          // return;
          let object = {
            fundraiser: name,
            mail: mail,
            drop: dropDown,
            phno: mobileno,
            address: address,
            img: image,
            title: title,
            alt: name_hosp,
            location: location,
            storySum: storySum,
            story: story,
            image_doc: image_doc,
            expected_amt: amount,
            amount_raised: "0",
            product_id: product_id,
            upiUrl: upi,
            userId: userid["userid"],
            amout: "unreach",
          };

          console.log(object);

          arr.push(object);

          window.localStorage.setItem("carddetails", JSON.stringify(arr));
          alert("Successfully Added your fundraise card");
          window.location.href =
            "../../webpage/fundraiser/fundraiser.html?userid=" +
            userid["userid"];
        } else {
          alert("Your input might doesn't match the pattern");
          return;
        }
      });
    </script> -->
  
  </body>
</html>
