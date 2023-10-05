  
/*TO do a refine search and filter part script*/
      function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
      }

      window.onclick = function (e) {
        if (!e.target.matches(".dropbtn")) {
          var myDropdown = document.getElementById("myDropdown");
          if (myDropdown.classList.contains("show")) {
            myDropdown.classList.remove("show");
          }
        }
      };

      let search = document.createElement("div");
      search.innerHTML = ` <button id="newFundraise"  class="donation">
        New Fundraise
      </button>

      <i class="fa fa-search" width="20px"></i>
      <input
        type="text"
        placeholder="   Search by name,location,cause..."
        name="search"
        id="search"
      />

      <div class="abc">
        <button class="dropbtn" onclick="myFunction()">
          Filter &nbsp;
          <i class="fa fa-caret-down" style="color: #f9f9f9"></i>
        </button>
        <div class="dropdown-content" id="myDropdown">
          <a href="#">Medical</a>
          <a href="#">Education</a>
          <a href="#">Social cause</a>
        </div>
      </div>`;
      document.querySelector(".search").append(search);


/* To Store the mail globally*/
let mail;

/*To get the axio call response from servlet*/
function getAllUserFundraises() {
    const url = "/pinapp/ViewUserFundraiseCards";
    const url2 = "/pinapp/ViewAllDonationsServlet";

    //  Promise.all make both Axios calls concurrently
    Promise.all([
        axios.get(url),
        axios.get(url2)
    ])
    .then(function (responses) {
        const fundraiseResponse = responses[0];
        const donationsResponse = responses[1];

        const fundraiseArr = fundraiseResponse.data.fundraise;
        mail = fundraiseResponse.data.loggedInEmail;
        console.log(mail);

        const viewDonations = donationsResponse.data;
        console.log(viewDonations);

        // Call the fundraise function with both sets of data
        fundraise(fundraiseArr, mail, viewDonations);
    })
    .catch(function (error) {
        console.log(error);
    });
}
 
 

/*TO redirect to respective pages if login and not login*/
let newFundraise = document.getElementById("newFundraise");

newFundraise.addEventListener("click", function () {
     if (mail == null) {
    window.location.href = "../login-signup/login.jsp";
  } else {
	
	window.location.href = "../fundraiser/basicdetailsfundraiser.jsp";
    
  }
});



function fundraise(fundraiseArr,mail,viewDonations){
/*To show the cards and donor details */

if (mail != null) {
  
  for (let i = 0; i < fundraiseArr.length; i++) {
	 const fundraiser = fundraiseArr[i];
	 console.log(fundraiser);
      let amount_raised = fundraiser["amountReceived"];
      let expected_amount = fundraiser.expectedAmount;
      let percentage = Math.floor((amount_raised / expected_amount) * 100);
      
  /*  let donors = JSON.parse(localStorage.getItem("donerDonatedetails"));*/

    if (
      (amount_raised == expected_amount || amount_raised >= expected_amount) 
    ) {
      
      console.log("get in");
      console.log(fundraiser);
      let box1andbox2;
      box1andbox2 = document.createElement("div");
      box1andbox2.setAttribute("class", "box1-box2-container");

      let box; 
      box = document.createElement("div");
      box.setAttribute("class", "box");
      box.style.backgroundColor = "#ececec";
      box1andbox2.append(box);

      let anchorDonate;
      anchorDonate = document.createElement("div");
      anchorDonate.setAttribute("style", "text-decoration: none");
      anchorDonate.innerHTML = `<span class="textAmt">Expected Amount reached</span>`;
      box.append(anchorDonate);

      let coverimg;
      coverimg = document.createElement("img");
      coverimg.setAttribute("class", "image");
      coverimg.setAttribute("height", "270px");
      coverimg.setAttribute("src", fundraiser.coverPic);
      coverimg.style.opacity = "0.7";
      coverimg.setAttribute("onclick", "direct()");

      coverimg.setAttribute("alt", "wsa we save animals");
      anchorDonate.append(coverimg);

      let title_;
      title_ = document.createElement("h4");
      title_.innerText = fundraiser.title;
      anchorDonate.append(title_);

      let progress_div;
      progress_div = document.createElement("div");
      progress_div.setAttribute("class", "progress-sec");
      anchorDonate.append(progress_div);

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

      let bElement1 = document.createElement("b");
      bElement1.textContent = fundraiser.amountReceived;

      let bElement2 = document.createElement("b");
      bElement2.textContent = fundraiser.expectedAmount;

      cash.textContent = ` RS. `;
      cash.append(bElement1);
      cash.textContent += ` out of `;
      cash.append(bElement2);

      amount_sec.append(cash);


      let user_div;
      user_div = document.createElement("div");
      user_div.setAttribute("class", "user");
      anchorDonate.append(user_div);

      let user_name;
      user_name = document.createElement("span");
      user_name.setAttribute("class", "name-label");
      user_name.innerHTML = "Created by" + "&nbsp";
      user_div.append(user_name);

      let nameFundraise;
      nameFundraise = document.createElement("span");
      nameFundraise.setAttribute("class", "nameFundraiser");
      nameFundraise.innerText = fundraiser.user.username;
      user_div.append(nameFundraise);

      // supporterbox

  let supporterbox;
      supporterbox = document.createElement("div");
      supporterbox.setAttribute("class", "supporters-box");
      supporterbox.innerHTML = `<div class="supporterhead">Donors List</div>`;

      let cardfundraiseid = fundraiser.fundraiseid;
      console.log(cardfundraiseid);

      for (let i = 0; i < viewDonations.length; i++) {
        if (cardfundraiseid == viewDonations[i].fundraise["fundraiseid"]) {
          let supporter = document.createElement("div");
          supporter.innerHTML = ` 
      <span class="supporter-name">${viewDonations[i].user.username}</span>
      <span class="contribution">${viewDonations[i].donaterContribution} RS</span>
    
    <hr />`;
          supporterbox.append(supporter);
        }
      }

      box1andbox2.append(supporterbox);

 document.querySelector(".container").prepend(box1andbox2);
      // searchbar feature function to query search

      let inputSearch = document.getElementById("search");
      const cards = document.getElementsByClassName("box1-box2-container");

      inputSearch.addEventListener("input", () => {
        for (let i = 0; i < cards.length; i++) {
          const element = cards[i];
          if (
            element.innerHTML
              .toLowerCase()
              .includes(inputSearch.value.toLowerCase())
          ) {
            element.style.display = "block";
          } else {
            element.style.display = "none";
          }
        }
      });
    }

    if (amount_raised <= expected_amount ) {
      let box1andbox2;
      box1andbox2 = document.createElement("div");
      box1andbox2.setAttribute("class", "box1-box2-container");

      let box;
      box = document.createElement("div");
      box.setAttribute("class", "box");
      box1andbox2.append(box);

      let anchorDonate;
      anchorDonate = document.createElement("div");
      anchorDonate.setAttribute("style", "text-decoration: none");
      box.append(anchorDonate);

      let anchorimg;
      anchorimg = document.createElement("a");
      anchorimg.setAttribute(
       "href",`../donate/story.jsp?product_id=${fundraiser.fundraiseid}&userid=${fundraiser.user.userid}`
      );
      anchorDonate.append(anchorimg);

      let coverimg;
      coverimg = document.createElement("img");
      coverimg.setAttribute("class", "image");
      coverimg.setAttribute("height", "270px");
      coverimg.setAttribute("src", fundraiser.coverPic);
      coverimg.setAttribute("onclick", "redirect()");
      coverimg.setAttribute("alt", "wsa we save animals");
      anchorimg.append(coverimg);

      let title_;
      title_ = document.createElement("h4");
      title_.innerText = fundraiser.title;
      anchorDonate.append(title_);

      let progress_div;
      progress_div = document.createElement("div");
      progress_div.setAttribute("class", "progress-sec");
      anchorDonate.append(progress_div);

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

      let image_like;
      image_like = document.createElement("img");
      image_like.setAttribute("id", fundraiser.fundraiseid);
      image_like.setAttribute("class", "icon-like");
      image_like.addEventListener("click", function() {
  	  editCard(this.getAttribute("id"));
     });
      image_like.setAttribute("src", "../assets/images/draw (1).png");
      image_like.setAttribute("width", "26px");
      image_like.setAttribute("height", "26px");
      progress_bar_div.append(image_like);
      
         
      

      // img
      image_share = document.createElement("img");
      image_share.setAttribute("src", "../assets/images/share (1).png");
      image_share.setAttribute("class", "share");
      image_share.setAttribute("alt", "share");
      image_share.setAttribute("width", "30px");
      progress_bar_div.append(image_share);

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

      let bElement1 = document.createElement("b");
      bElement1.textContent = fundraiser.amountReceived;

      let bElement2 = document.createElement("b");
      bElement2.textContent = fundraiser.expectedAmount;

      cash.textContent = ` RS. `;
      cash.append(bElement1);
      cash.textContent += ` out of `;
      cash.append(bElement2);

      amount_sec.append(cash);;

      let user_div;
      user_div = document.createElement("div");
      user_div.setAttribute("class", "user");
      anchorDonate.append(user_div);

      let user_name;
      user_name = document.createElement("span");
      user_name.setAttribute("class", "name-label");
      user_name.innerHTML = "Created by" + "&nbsp";
      user_div.append(user_name);

      let nameFundraise;
      nameFundraise = document.createElement("span");
      nameFundraise.setAttribute("class", "nameFundraiser");
      nameFundraise.innerText = fundraiser.user.username;
      user_div.append(nameFundraise);

      // supporterbox
      let supporterbox;
      supporterbox = document.createElement("div");
      supporterbox.setAttribute("class", "supporters-box");
      supporterbox.innerHTML = `<div class="supporterhead">Donors List</div>`;


 let cardfundraiseid = fundraiser.fundraiseid;
let donationsExist = false; // Flag to check if donations exist for this campaign

for (let i = 0; i < viewDonations.length; i++) {
    if (cardfundraiseid == viewDonations[i].fundraise["fundraiseid"]) {
        let supporter = document.createElement("div");
        supporter.innerHTML = ` 
            <span class="supporter-name">${viewDonations[i].user.username}</span>
            <span class="contribution">${viewDonations[i].donaterContribution} RS</span>
            <hr />`;
        supporterbox.append(supporter);
        donationsExist = true; // Donations exist for this campaign
    }
}

if (!donationsExist) {
    let supporter = document.createElement("div");
    supporter.innerHTML = ` 
            <span id="donationinfo">${"Donations not yet received for this campaign"}</span>
            <hr />`;
                supporterbox.append(supporter);
}

box1andbox2.append(supporterbox);


 document.querySelector(".container").prepend(box1andbox2);
      // searchbar feature function to query search

      let inputSearch = document.getElementById("search");
      const cards = document.getElementsByClassName("box1-box2-container");

      inputSearch.addEventListener("input", () => {
        for (let i = 0; i < cards.length; i++) {
          const element = cards[i];
          if (
            element.innerHTML
              .toLowerCase()
              .includes(inputSearch.value.toLowerCase())
          ) {
            element.style.display = "block";
          } else {
            element.style.display = "none";
          }
        }
      });
      // searchbar feature function to query search
      
   
    }
  }

  
} else {
  let info = document.createElement("h3");
 info.setAttribute("id", "info");
  info.innerText =
    "Kindly login if you don't have an account kindly signup and start your fundraise campaign";
  document.querySelector(".container").append(info);
}

}
function direct() {
  alert("Expected Amount Reached");
}


function editCard(e) {
   	  
    
      let fundraiseid = e;
      window.location.href = "../fundraiser/editFundraise.jsp?fundraiseId="+fundraiseid;
    
      console.log(eId); 
     }   

window.onload = function () {
    getAllUserFundraises();
};
