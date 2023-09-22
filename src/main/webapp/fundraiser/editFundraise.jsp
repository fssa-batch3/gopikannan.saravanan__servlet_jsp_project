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
    <!--  header starts-->
     <jsp:include page="/components/header1.jsp"></jsp:include>
    <!-- header ends -->
    <div class="details-head">Edit</div>

    <!-- container starts -->
    <div class="container">
      <!-- form start -->

      <form  id="form" method="post" action="/pinapp/UpdateFundraiseServlet">
      
			<% 
       			String errorMessage = (String) request.getAttribute("errorMessage");
    			if (errorMessage != null) { 
				%>
    			<p class='error'><%= errorMessage %></p>
				<% } %>
      <!--   <div class="input-div">
          <label>Name:</label>
          <input
            type="text"
            id="name"
            placeholder="Enter your name"
            pattern="^(?=.{2,50}$)[A-Za-z]+(?:\s[A-Za-z]+){0,3}$"
            required
          />
        </div>
        <div class="input-div">
          <label>Email ID:</label>
          <input
            type="email"
            id="email"
            placeholder="Enter your email id"
            title="Enter the correct email"
          />
        </div>
        <div class="input-div">
          <label>Phone Number:</label>
          <input
            type="tel"
            id="mobileno"
            placeholder="Enter your Ph no"
            pattern="[0-9]{10}"
            required
            title=" Phone number must have 10 digits"
          />
        </div> -->
        <input type="hidden" id="fundraiseid" name="fundraiseid" value="<%= request.getParameter("fundraiseId")%>">
        <div class="input-div">
          <label>I am raising fund for:</label>
          <select name="cause" id="cause">
            <option value="Medical">Medical</option>
            <option value="Educational">Educational</option>
            <option value="Socialcause">Social Cause</option>
          </select>
        </div>
        <!-- <div class="input-div">
          <label>Address:</label
          ><input
            id="address"
            type="text"
            pattern="^(?=.{1,200}$)[A-Za-z0-9!@#$%^&*()_+-={}[\]|\\;:'>,.?/]+[A-Za-z0-9]+(?:\s[A-Za-z0-9\s!@#$%^&*()_+-={}[\]|\\;:'>,.?/]+[A-Za-z0-9]+){0,10}$"
            required
          />
        </div>
 -->
        <div class="input-div">
          <label>Cover Picture:</label>
          <input
            id="image"
            type="url"
            name="coverpic"
            placeholder="place your image url"
            title="enter only image urls"
            required
          />
        </div>
        <div class="input-div">
          <label>Title:</label>
          <input
            id="title"
            type="text"
            name="title"
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
            pattern="^(?=.{4,100}$)[A-Za-z]+(?:\s[A-Za-z]+){0,10}$"
          />
        </div>
        <div class="input-div">
          <label>Location:</label>
          <input
            id="location2"
            type="text"
            required
            placeholder="Hospital,School,organization location"
            pattern="^(?=.{4,100}$)[A-Za-z]+(?:\s[A-Za-z]+){0,10}$"
          />
        </div>
        <div class="input-div">
          <label>Summary:</label>
          <input
            id="summary_stry"
            type="text"
            required
            placeholder="Write your summary of your story"
          />
        </div> -->
        <div class="input-div">
          <label>Write Your Story:</label>
          <textarea
            value="Our school..."
            name="story"
            id="story"
            pattern="^(?=.{0,500}$)[A-Za-z0-9!@#$%^&*()_+-={}[\]|\\;:'>,.?/]+[A-Za-z0-9]+(?:\s[A-Za-z0-9\s!@#$%^&*()_+-={}[\]|\\;:'>,.?/]+[A-Za-z0-9]+){0,50}$"
            rows="5"
            required
            placeholder="Write about who is this fundraiser for How/Why/When  do you need funds what is the purpose..."
          ></textarea>
        </div>
        <div class="input-div">
          <label>Upload Required Documents :</label>
          <input id="image_doc" name="document"type="url" title="enter only image urls" />
        </div>
        <div class="input-div">
          <label>I want to raise the amount Rs:</label>
          <input
            id="amount"
            type="text"
            name="expectedAmt"
            title="Enter only the amount only in numbers"
            pattern="[0-9]{5,20}"
            maxlength="20"
            required
          />
        </div>
        <!-- <div class="input-div">
          <label>Your UPI url:</label>
          <input id="upi" type="text" placeholder="paste your upi url" />
        </div>
 -->
        <!-- <a href="../fundraiser/Fundraiserdetailsform1.html">  -->
        <button type="submit" class="continue">SAVE</button>
      </form>
      <!-- </a>  -->
      <!-- form ends -->
    </div>
    <!-- container ends -->
    <!-- Footer  -->
    <jsp:include page="/components/footer.jsp"></jsp:include>
    <!-- footer end -->

    <script>
    
    
    
    const dropDown = document.getElementById("cause");
    const image = document.getElementById("image");
    const title = document.getElementById("title");
    const story = document.getElementById("story");
    const image_doc = document.getElementById("image_doc");
    const amount = document.getElementById("amount");
    
    
    let check = "";
	
    window.onload=function(){
    	 const urlParams = new URLSearchParams(window.location.search);
         const fundraiseId = urlParams.get('fundraiseId');
    	const url = "/pinapp/UpdateFundraiseServlet?fundraiseid="+fundraiseId;
    	console.log(url);
    	
    	axios.get(url)
    	.then(function(response){
    		 viewFundraise = response.data.fundraise;
    		 console.log(viewFundraise);
    		
    		 

    	      dropDown.value = viewFundraise["cause"];
    	      title.value = viewFundraise["title"];
    	      image.value = viewFundraise["coverPic"];
    	      story.value = viewFundraise["story"];
    	      image_doc.value = viewFundraise["document"];
    	      amount.value = viewFundraise["expectedAmount"];
    	})
    	 .catch(function(error) {
                    console.error('Request failed', error);
          });
    

      
      
      

      
      amount.addEventListener("keyup", function () {
        let valuecontri = parseFloat(amount.value);
        console.log(valuecontri);

        if (valuecontri < viewFundraise["expectedAmount"]) {
          alert(
            "You cannot edit your amount less than your previously expected amount"
          );
          check = "no";
          return;
        } else {
          check = "yes";
        }
      });
      
      document.getElementById("form").addEventListener("submit", function (event) {
    	  if (check === "no") {
    	    event.preventDefault();
    	    alert("Please make sure the amount is valid. It must be more than expected amount"); 
    	    return;
    	  }
    	});
    }

      
      
     /*  let form = document.getElementById("form");

      form.addEventListener("submit", function (event) {
        const dropDown = document.getElementById("cause").value;
        const image = document.getElementById("image").value.trim();
        const title = document.getElementById("title").value.trim();
        const story = document.getElementById("story").value.trim();
        const image_doc = document.getElementById("image_doc").value.trim();
        const amount = document.getElementById("amount").value.trim();
        const fundraiseid = document.getElementById("fundraiseid").value;

        let match = false;

        if (story === "") {
          alert("Detail of your story can't be left empty");
          return;
        } else {
          match = true;
        }

        if (match == true && check == "yes") {
        	 const data = {
                     cause: dropDown,
                     coverpic: image,
                     title: title,
                     story: story,
                     coverPic: image,
                     expectedAmt: amount,
                     fundraiseid : fundraiseid,
                 };
        	 
        	 axios.post('/pinapp/UpdateFundraiseServlet', { data })
             .then(function (response) {
            	 const responseData = response.data;
            	 alert(responseData);
            	 window.location.href = "../fundraiser/fundraiser.jsp";
             })
             .catch(function (error) {
                 console.error(error);
             });
        } 
       
      }); */
      
    </script>
     <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  </body>
</html>
