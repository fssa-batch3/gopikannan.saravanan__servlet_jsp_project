
let view;
let mail;
window.onload=function(){
	
	const url = "/pinapp/ViewUserDonations"
	
	axios.get(url)
	.then(function(response){
		 view = response.data.donate;
		 mail = response.data.loggedInEmail;
		 toViewMyDonation(view,mail);
	})
	 .catch(function(error) {
                console.error('Request failed', error);
      });
}


function toViewMyDonation(view,mail){
let container;
let anchor;
let first_span_tag;
let image;
let h4_tag;
let user_div;
let span_name;
let span_fundraiser_name;
let second_box;
let amount_details_head;
let progress_div;
let progress_tag;
let progress_span_tag;
let image_share;
let amount_sec;
let txt_amount;
let cash;
let count;
let hr_tag;
let contribution_head;
let div_class;
let donater_details;
let doanter_img;
let donater_name;
let donater_contribution;

if (mail != null) {
  for (let i = 0; i < view.length; i++) {
	  
   const donation = view[i];
	  const fundraise = donation.fundraise;
      const donaterContribution = donation.donaterContribution;
      const donate_Id = donation.donaterId;
      console.log(donate_Id);
      const user = donation.user;
	
	  
          let amount = parseInt(fundraise.amountReceived);


          let expected_amount = parseInt(fundraise.expectedAmount);

          let percentage = Math.floor((amount / expected_amount) * 100);
          container = document.createElement("div");
          container.setAttribute("class", "first-second-box-container");

          //  <div class="box"></div>

          box = document.createElement("div");
          box.setAttribute("class", "box");
          container.append(box);

          //<a href="./Divyam.html" style="text-decoration: none">

          anchor = document.createElement("a");
          anchor.setAttribute(
            "href",
            "../donate/story.jsp?product_id=" +
              fundraise.fundraiseid +
              "&userid=" +
              fundraise.user.userid
          );
          anchor.setAttribute("style", "text-decoration: none");
          box.append(anchor);

          //<span class="linkspanner"></span>;

          first_span_tag = document.createElement("span");
          first_span_tag.setAttribute("class", "linkspanner");
          anchor.append(first_span_tag);

          //<img class="image" src="../../Assets/images/baby.jpg" height="255" />

          image = document.createElement("img");
          image.setAttribute("class", "image");
          image.setAttribute("height", "255");
          image.setAttribute("src", fundraise["coverPic"]);
          anchor.append(image);

          // <h4>Help Divyam Fight From Leukaemia</h4>
          h4_tag = document.createElement("h4");
          h4_tag.innerText = fundraise["title"];
          anchor.append(h4_tag);

          // <div class="user">

          user_div = document.createElement("div");
          user_div.setAttribute("class", "user");
          anchor.append(user_div);

          //<span class="name-label">Created by</span>
          span_name = document.createElement("span");
          span_name.setAttribute("class", "name-label");
          span_name.innerText = "Created by";
          user_div.append(span_name);

          //<span class="name">Ajay </span>
          span_fundraiser_name = document.createElement("span");
          span_fundraiser_name.setAttribute("class", "name");
          span_fundraiser_name.innerText = fundraise.user.username;
          user_div.append(span_fundraiser_name);

          //   <div class="second-box">
          second_box = document.createElement("div");
          second_box.setAttribute("class", "second-box");
          container.append(second_box);

          //<div class="amountdetails">Amount Details</div>

          amount_details_head = document.createElement("div");
          amount_details_head.setAttribute("class", "amountdetails");
          amount_details_head.innerHTML = "Amount Details";
          second_box.append(amount_details_head);

          // <div class="progress-sec">

          progress_div = document.createElement("div");
          progress_div.setAttribute("class", "progress-sec");
          second_box.append(progress_div);

          let progress_bar_div;
          progress_bar_div = document.createElement("div");
          progress_bar_div.setAttribute("class", "progress_bar_div");
          progress_div.append(progress_bar_div);

          b_tag = document.createElement("b");
          b_tag.innerText = percentage + "%";
          progress_bar_div.append(b_tag);

          //   <progress id="file" value="32" max="100">20%</progress>
          progress_tag = document.createElement("progress");
          progress_tag.setAttribute("id", "file");
          progress_tag.setAttribute("value", percentage);
          progress_tag.setAttribute("max", "100");
          progress_bar_div.append(progress_tag);

          //span
          progress_span_tag = document.createElement("span");
          progress_span_tag.setAttribute("class", "like");
          progress_bar_div.append(progress_span_tag);

          // img
          image_share = document.createElement("img");
          image_share.setAttribute("src", "../assets/images/share (1).png");
          image_share.setAttribute("class", "share");
          image_share.setAttribute("alt", "share");
          image_share.setAttribute("width", "30px");
          progress_span_tag.append(image_share);

          // <div class="amount">
          amount_sec = document.createElement("div");
          amount_sec.setAttribute("class", "amount");
          progress_div.append(amount_sec);

          // <span id="txt-amt"></span>
          txt_amount = document.createElement("span");
          txt_amount.setAttribute("id", "txt-amt");
          txt_amount.innerText = "Raised :";
          amount_sec.append(txt_amount);

          // <span id="cash"></span>
          cash = document.createElement("span");
          cash.setAttribute("id", "cash");
          cash.innerHTML = `RS. <b>${amount}</b> out of <b>${expected_amount}</b>`;
          amount_sec.append(cash);

          let download_button;
          download_button = document.createElement("button");
          download_button.setAttribute("class", "download");
          download_button.innerText = "Donation Reciept";
		  download_button.addEventListener("click", function() {
  window.location.href = "../donate/donationdownload.jsp?donaterId=" + donate_Id;
});

          progress_div.append(download_button);

          //hrtag
          hr_tag = document.createElement("hr");
          second_box.append(hr_tag);

          //   <div class="contribution">Your Contribution</div>
          contribution_head = document.createElement("div");
          contribution_head.setAttribute("class", "contribution");
          contribution_head.innerText = "Your Contribution";
          second_box.append(contribution_head);

          //<div style="display: flex">

          div_class = document.createElement("div");
          div_class.setAttribute("style", "display: flex");
          second_box.append(div_class);

          //<div class="yourdetails">
          donater_details = document.createElement("div");
          donater_details.setAttribute("class", "yourdetails");
          div_class.append(donater_details);

          //<img class="donater_img"></>
         /* doanter_img = document.createElement("img");
          doanter_img.setAttribute("class", "donater_img");
          doanter_img.setAttribute("src", details[i]["donaterpic"]);
          donater_details.append(doanter_img);*/

          donater_name = document.createElement("div");
          donater_name.setAttribute("class", "profile-name");
          donater_name.innerText = user.username;
          div_class.append(donater_name);

          donater_contribution = document.createElement("div");
          donater_contribution.setAttribute("class", "rs");
          donater_contribution.innerHTML =
            "RS:" + "&nbsp" + donaterContribution;
          div_class.append(donater_contribution);

          document.querySelector(".overallcontainer").append(container);
         
         
   function download(donate_Id) {

    window.location.href =
      "../donate/donationdownload.jsp?donaterId=" + donaterId;
  }
    
}
} else {
  let txt;
  txt = document.createElement("h3");
  txt.setAttribute("id","info");
  txt.innerText =
    "You have not contributed to any fundraise campaign kindly login and start your donations";
  document.querySelector(".overallcontainer").append(txt);
}

}