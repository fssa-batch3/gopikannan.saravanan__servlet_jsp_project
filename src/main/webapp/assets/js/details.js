
const Pid = window.location.search;
const idParams = new URLSearchParams(Pid);
const getIDdetails = idParams.get("product_id");
console.log(getIDdetails);






let mail;
let fundraiseDetails;
function getAllAccounts() {
    const getFundraiseURL = "/pinapp/GetAllFundraise";
    const donationServletURL = "/pinapp/ViewAllDonationsServlet";

    axios.all([
        axios.get(getFundraiseURL),
        axios.get(donationServletURL)
    ])
    .then(axios.spread(function (fundraiseResponse, donationResponse) {
        // Handle the responses here
        const fundraiseData = fundraiseResponse.data;
        const donationData = donationResponse.data;
        
        console.log("Fundraise Data:", fundraiseData);
        console.log("Donation Data:", donationData);
        
        // The rest of your code
        const fundraiseArr = fundraiseData.fundraise;
        /* To set the mail globally */
        mail = fundraiseData.loggedInEmail;
        
        // Find the details of the card by find method
        fundraiseDetails = fundraiseArr.find(function (e) {
            let id = e.fundraiseid;

            if (getIDdetails == id) {
                return true;
            }
        });
         let find_fundraise_donations = donationData.filter((e) => e.fundraise.fundraiseid === parseInt(getIDdetails));
        console.log(find_fundraise_donations);

        displayFundraise(fundraiseDetails);
        addDonatorInfo(find_fundraise_donations); 
    }))
    .catch(function (error) {
        console.log(error);
    });
}

     
function displayFundraise(fundraiseDetails) {
	


   let amount_raised = parseInt(fundraiseDetails.amountReceived);
   let expected_amount = parseInt(fundraiseDetails.expectedAmount);
   let percentage = Math.floor((amount_raised / expected_amount) * 100);

let content;
content = document.createElement("div");
content.setAttribute("class", "content");

let heading;
heading = document.createElement("h4");
heading.innerText = fundraiseDetails.title;
content.append(heading);

let image;
image = document.createElement("img");
image.setAttribute("class", "image");
image.setAttribute("src", fundraiseDetails.coverPic);
image.setAttribute("alt", "fundraiserPic");
content.append(image);

let progress;
progress = document.createElement("div");
progress.setAttribute("class", "progress-sec");
content.append(progress);

let progress_div;
progress_div = document.createElement("div");
progress_div.setAttribute("class", "progressdiv");
progress.append(progress_div);

let para;
para = document.createElement("p");
para.setAttribute("id", "percent");
progress_div.append(para);

let b_tag;
b_tag = percentage + "%";
para.append(b_tag);

let progress_tag;
progress_tag = document.createElement("progress");
progress_tag.setAttribute("id", "file");
progress_tag.setAttribute("value", percentage);
progress_tag.setAttribute("max", "100");
progress_div.append(progress_tag);

let span_like;
span_like = document.createElement("span");
span_like.setAttribute("class", "like");
progress_div.append(span_like);

let span_anchor;
span_anchor = document.createElement("a");
span_anchor.setAttribute("href", "#");
span_like.append(span_anchor);

let share_img;
share_img = document.createElement("img");
share_img.setAttribute("class", "share");
share_img.setAttribute("src", "../assets/images/share (1).png");
share_img.setAttribute("alt", "share");
share_img.setAttribute("width", "30px");
span_anchor.append(share_img);

let amount;
amount = document.createElement("div");
amount.setAttribute("class", "amount");
progress.append(amount);

let amount_txt;
amount_txt = document.createElement("span");
amount_txt.setAttribute("id", "txt-amt");
amount_txt.innerHTML = "Raised:" + "&nbsp";
amount.append(amount_txt);

let amount_count;
amount_count = document.createElement("span");
amount_count.setAttribute("id", "class");
amount_count.innerHTML = ` Rs.<b>${fundraiseDetails.amountReceived}</b> out of <b>${fundraiseDetails.expectedAmount}</b>`;

amount.append(amount_count);

let storybtn;
storybtn = document.createElement("div");
storybtn.setAttribute("class", "story-btn");
storybtn.innerText = "Story";
content.append(storybtn);


const fullstory = fundraiseDetails["story"] ;
const splitIndex = Math.floor(fullstory.length / 4);
const summary = fullstory.substring(0,splitIndex);
const detailedStory = fullstory.substring(splitIndex);



let story;
story = document.createElement("div");
story.setAttribute("class", "story");
story.innerHTML = summary + "&nbsp" + "&nbsp";
content.append(story);

let story_more;
story_more = document.createElement("span");
story_more.setAttribute("id", "more");
story_more.innerText = detailedStory;
story.append(story_more);



let viewmore;
viewmore = document.createElement("div");
viewmore.setAttribute("class", "viewmore");
content.append(viewmore);

let img_document;
img_document = document.createElement("img");
img_document.setAttribute("id", "document");
img_document.setAttribute("style", "display:none;");
img_document.setAttribute("src", fundraiseDetails.document);
story.append(img_document);
let imgArrow;
imgArrow = document.createElement("img");
imgArrow.setAttribute(
  "src",
  "../assets/images/arrow-down-sign-to-navigate.png"
);
imgArrow.setAttribute("alt", "arrow");
imgArrow.setAttribute("class", "arrow");
viewmore.append(imgArrow);

let viewmoreBtn;
viewmoreBtn = document.createElement("div");
viewmoreBtn.setAttribute("style", "z-index: 5;");
viewmore.append(viewmoreBtn);

let btnview;
btnview = document.createElement("button");
btnview.setAttribute("id", "mybtn");
btnview.setAttribute("onclick", "myFunction()");
btnview.innerText = "View More";
viewmoreBtn.append(btnview);

let user1;
user1 = document.createElement("div");
user1.setAttribute("class", "user");
content.append(user1);

let nameLabel;
nameLabel = document.createElement("span");
nameLabel.setAttribute("class", "name-label");
nameLabel.innerHTML = `Created by `;
user1.append(nameLabel);

let userName;
userName = document.createElement("span");
userName.setAttribute("class", "username");
userName.innerHTML = ` <b>${fundraiseDetails.user.username}</b>`;
user1.append(userName);



// UPI box
let donate_Section;
donate_Section = document.createElement("div");
donate_Section.setAttribute("class", "donate-box");



let upibox;
upibox = document.createElement("div");
upibox.setAttribute("class", "upi-box");
donate_Section.append(upibox);


let donateBtn;
donateBtn = document.createElement("div");
donateBtn.setAttribute("class", "donate-btn-sec");
upibox.append(donateBtn);

let donatebutton;
donatebutton = document.createElement("button");
donatebutton.setAttribute("class", "donate-btn");
donatebutton.setAttribute("onclick", "paymentpage()");
donatebutton.innerText = "DONATE NOW";
donateBtn.append(donatebutton);

let carddetail;
carddetail = document.createElement("div");
carddetail.setAttribute("class", "card-detail");
carddetail.innerText = "Donate using Card,netbanking";
upibox.append(carddetail);

let qrimg;
qrimg = document.createElement("div");
qrimg.setAttribute("class", "qr-img");
upibox.append(qrimg);

let imageqr;
imageqr = document.createElement("img");
imageqr.setAttribute("src", "../assets/images/qr.jpg");
imageqr.setAttribute("alt", "Qr");
imageqr.setAttribute("id", "qr");
qrimg.append(imageqr);

let upitxt;
upitxt = document.createElement("div");
upitxt.setAttribute("class", "upi-down-txt");
upitxt.innerText = "Or donate using UPI";
upibox.append(upitxt);

let imgqr;
imgqr = document.createElement("div");
imgqr.setAttribute("class", "img-qr");
upibox.append(imgqr);

let upiimg;
upiimg = document.createElement("img");
upiimg.setAttribute("class", "qr-img");
upiimg.setAttribute("src", "../assets/images/upi-icon.png");
upiimg.setAttribute("alt", "upiimg");
upiimg.setAttribute("width", "60");
upiimg.setAttribute("height", "60");
imgqr.append(upiimg);

let gpay;
gpay = document.createElement("img");
gpay.setAttribute("src", "../assets/images/google-pay-Logo-PNG_awihaa.png");
gpay.setAttribute("alt", "gpay");
gpay.setAttribute("width", "30");
gpay.setAttribute("height", "40");
gpay.setAttribute("class", "gpay");
gpay.setAttribute("style", "padding-bottom: -15px");
imgqr.append(gpay);

document.querySelector(".content-supporter-container").append(content, donate_Section);

let titleDonaterTableSpan;
titleDonaterTableSpan = document.createElement("span");
titleDonaterTableSpan.setAttribute("id", "tableHeadSpan");


let titleDonaterTable;
titleDonaterTable = document.createElement("h3");
titleDonaterTable.setAttribute("id", "tableHead");
titleDonaterTable.innerText = "Donaters who have donated to this fundraise"
titleDonaterTableSpan.append(titleDonaterTable);

document.querySelector(".donate-box").append(titleDonaterTableSpan);



const secondContainer = document.createElement('div');
secondContainer.classList.add('second-container');

const chatBox = document.createElement('div');
chatBox.classList.add('chat-box');

const tableContainer = document.createElement('div');
tableContainer.id = 'table-container';

const table = document.createElement('table');
table.id = 'donatorTable';

const thead = document.createElement('thead');
const headerRow = document.createElement('tr');
const th1 = document.createElement('th');
th1.textContent = 'Donator Name';
const th2 = document.createElement('th');
th2.textContent = 'Contribution';

headerRow.appendChild(th1);
headerRow.appendChild(th2);

thead.appendChild(headerRow);

const tbody = document.createElement('tbody');

table.appendChild(thead);
table.prepend(tbody);

tableContainer.appendChild(table);

chatBox.appendChild(tableContainer);

secondContainer.appendChild(chatBox);

document.body.appendChild(secondContainer);

document.querySelector(".donate-box").append( secondContainer);

}


/*To redirect to donation page but with only if login*/
function paymentpage() {
	
  if (mail == null) {
    window.location.href = "../login-signup/login.jsp";
  } else {
    window.location.href = "../donate/payment1stpage.jsp?product_id=" +
      fundraiseDetails["fundraiseid"];
      
  }
}


console.log(fundraiseDetails);
// function to view story and document more and less
 function myFunction() {
    	  
    	  let viewButton= document.getElementById("mybtn");
    	  let content = document.getElementById("more");
    	  
    	  
    	  if(viewButton.textContent==="View More"){
        document.getElementById("more").style.display = "inline";
        document.getElementById("document").style.display = "inline";
        viewButton.textContent = "View Less";
    	  }
    	  else{
    		  
    		  document.getElementById("more").style.display = "none";
    	        document.getElementById("document").style.display = "none";
    	        viewButton.textContent = "View More";
    	  }
        
      }
      
   
   
 
function addDonatorInfo(find_fundraise_donations) {
	console.log(find_fundraise_donations);
    const donatorTable = document.getElementById("donatorTable").getElementsByTagName('tbody')[0]; // Get the table's tbody element

    find_fundraise_donations.forEach(function (donator) {
        const row = donatorTable.insertRow(); // Create a new table row
        const cell1 = row.insertCell(0); // Create the first cell (Donator Name)
        const cell2 = row.insertCell(1); // Create the second cell (Contribution)

        cell1.textContent = donator.user.username;
        cell2.textContent = "RS." + donator.donaterContribution;
        console.log(donator.user.username);
        
    });
}

      
     

