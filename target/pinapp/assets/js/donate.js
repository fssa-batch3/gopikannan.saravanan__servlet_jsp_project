let searchDiv;
searchDiv = document.createElement("span");
searchDiv.setAttribute("class", "search");

// URL PARAMS CODE TO SHOW THE AND FIND THE FILTER CONTENT

const cause = window.location.search;
const causeParams = new URLSearchParams(cause);
const getcause = causeParams.get("cause");
console.log(getcause);

let anchordrop;
anchordrop = document.createElement("a");
anchordrop.setAttribute("href", "../donate/mydonations.jsp");
document.querySelector(".search").append(anchordrop);

let donationBtn;
donationBtn = document.createElement("button");
donationBtn.setAttribute("class", "donation");
donationBtn.innerText = "My Donation";
anchordrop.append(donationBtn);

let search;
search = document.createElement("i");
search.setAttribute("class", "fa fa-search");
search.setAttribute("width", "20px");
document.querySelector(".search").append(search);

/* <i class="fa fa-search" width="20px"></i> */

let inputSearch;
inputSearch = document.createElement("input");
inputSearch.setAttribute("type", "text");
inputSearch.setAttribute("id","inputId")
inputSearch.setAttribute("placeholder", "Search by name,location,cause...");
inputSearch.setAttribute("name", "search");
document.querySelector(".search").append(inputSearch);

let dropDiv;
dropDiv = document.createElement("div");
dropDiv.setAttribute("class", "abc");
document.querySelector(".search").append(dropDiv);

let dropBtn;
dropBtn = document.createElement("button");
dropBtn.setAttribute("class", "dropbtn");
dropBtn.setAttribute("onclick", "myFunction()");
dropBtn.innerHTML = "Filter" + "&nbsp";
dropDiv.append(dropBtn);

let cartDownArrow;
cartDownArrow = document.createElement("i");
cartDownArrow.setAttribute("class", "fa fa-caret-down");
cartDownArrow.setAttribute("style", "color: #f9f9f9");
dropBtn.append(cartDownArrow);

let dropdowncontentDiv;
dropdowncontentDiv = document.createElement("div");
dropdowncontentDiv.setAttribute("class", "dropdown-content");
dropdowncontentDiv.setAttribute("id", "myDropdown");
dropDiv.append(dropdowncontentDiv);

let anchorMedical;
anchorMedical = document.createElement("a");
anchorMedical.setAttribute(
  "href",
  "../donate/donate.jsp?cause=" + "Medical"
);
anchorMedical.innerText = "Medical";
dropdowncontentDiv.append(anchorMedical);

let anchorEducation;
anchorEducation = document.createElement("a");
anchorEducation.setAttribute(
  "href",
  "../donate/donate.jsp?cause=" + "Educational"
);
anchorEducation.innerText = "Education";
dropdowncontentDiv.append(anchorEducation);

let anchorSocial;
anchorSocial = document.createElement("a");
anchorSocial.setAttribute(
  "href",
  "../donate/donate.jsp?cause=" + "Socialcause"
);
anchorSocial.innerText = "Social";
dropdowncontentDiv.append(anchorSocial);
