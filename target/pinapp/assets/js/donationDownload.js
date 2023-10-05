/**
 * 
 */
      window.onload=function(){
    	  let donateidurl = window.location.search;
          let urlParamsId = new URLSearchParams(donateidurl);
          let donate_Id = urlParamsId.get("donaterId");

    		
    		const url = "/pinapp/ViewUserDonations"
    		
    		axios.get(url)
    		.then(function(response){
    			 view = response.data.donate;
    			 let donate_find = view.find((e) => e.donaterId == donate_Id);
    			  toViewMyDonationReceipt(donate_find); 
    		})
    		 .catch(function(error) {
    	                console.error('Request failed', error);
    	      });
    	}


   
function  toViewMyDonationReceipt(donate_find){
     
      let doc_container;
      doc_container = document.createElement("div");
      doc_container.setAttribute("class", "overallcontainer");

      doc_container.innerHTML = ` <img
        src="../assets/images/pinreciept_page-0001.jpg"
        alt="doc"
        id="doc"
      />
      <span id="txt-box">
      <p id="txt">
       <b> PIN-People In Need </b><br /><br />
        <b> Address: </b> <br />
        11&12 Duraiswamy 1st Street, Venkatraman Nagar, Korattur, Chennai <br />
        Chennai - 600080 <br />
        6374449159 <br /><br />

        <b> Email: </b> <br />
        organizationpin@gmail.com<br /><br />
        <b> Donation Date: </b><br />
        ${donate_find["donationDate"]} <br /><br />
        <b> To: </b><br />
        ${donate_find.user.username}, <br /><br />
        Thank you for your generous donation of <b> RS.${donate_find["donaterContribution"]} </b> to <b>${donate_find.fundraise.user.username}</b>. Your contribution will make a real difference in
        our mission to help the people in need. <br /><br />
        This letter serves as your official receipt for tax purposes. Our Tax
        Identification Number (TIN) is ABCTY1234D and we are a registered
        501(c)3 non profit organization. <br /><br />
        If you have any questions or concerns about your donation or our
        organization, please don't hesitate to contact us. <br /><br />
        Thank you again for your support. <br /><br />
        <br />
        Sincerely, <br />
       <b> Gopikannan Saravanan </b><br />
        PIN-People In Need
      </p></span>`;

      document.querySelector(".maincontainer").append(doc_container);
      
      

    
      
}

 function download() {
	 console.log("")
        window.print();
      }