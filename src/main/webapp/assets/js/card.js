function getAllAccounts() {
            const url = "/pinapp/GetAllFundraise";
            axios.get(url)
                .then(function (response) {
                    const fundraiseArr = response.data;
                    displayFundraise(fundraiseArr);
                })
                .catch(function (error) {
                    console.log(error);
                });
        }

        function displayFundraise(fundraiseArr) {
            const container = document.getElementById("container");
            const inputSearch = document.getElementById("search");
            for (let i = 0; i < fundraiseArr.length; i++) {
                const fundraiser = fundraiseArr[i];
                console.log(fundraiser);
                
                let card_div;
                let anchor;
                let image;
                let h4_tag;
                let progress_div;
                let b_tag;
                let progress_tag;
                let progress_span_tag;
                let image_share;
                let amount_sec;
                let txt_amount;
                let cash;
                let user_div;
                let user_name;
                let nameFundraise;

                let amount = parseInt(fundraiser.amountReceived);
                let expected_amount = parseInt(fundraiser.expectedAmount);
                let jsonCause = fundraiser.cause;

                let percentage = Math.floor((amount / expected_amount) * 100);
                if (window.location.pathname === '/pinapp/index.jsp') {
                	 if ( percentage >= 40 && amount<expected_amount) {
                         card_div = document.createElement("div");
                         card_div.setAttribute("class", "box");
                         card_div.setAttribute("id", "content");

                         anchor = document.createElement("div");
                         card_div.append(anchor);

                         a = document.createElement("a");
                         const fundraiseid = fundraiser.fundraiseid;
                         const userid = fundraiser.user.userid;
                         const storyUrl = "/pinapp/donate/story.jsp?product_id=" + fundraiseid + "&userid=" + userid;
                         a.setAttribute("href", storyUrl);
                         anchor.append(a);
      
                         console.log(fundraiser.fundraiseid);
                         image = document.createElement("img");
                         image.setAttribute("class", "image");
                         image.setAttribute("src", fundraiser.coverPic);
                         image.setAttribute("alt", "education");
                         a.append(image);

                         h4_tag = document.createElement("h4");
                         h4_tag.innerText = fundraiser.title;
                         anchor.append(h4_tag);

                         progress_div = document.createElement("div");
                         progress_div.setAttribute("class", "progress-sec");
                         anchor.append(progress_div);

                         let progress_bar_div;
                         progress_bar_div = document.createElement("div");
                         progress_bar_div.setAttribute("class", "progress_bar_div");
                         progress_div.append(progress_bar_div);

                         b_tag = document.createElement("b");
                         b_tag.innerText = percentage + "%";
                         progress_bar_div.append(b_tag);

                         progress_tag = document.createElement("progress");
                         progress_tag.setAttribute("id", "file");
                         progress_tag.setAttribute("value", percentage);
                         progress_tag.setAttribute("max", "100");
                         progress_bar_div.append(progress_tag);

                         progress_span_tag = document.createElement("span");
                         progress_span_tag.setAttribute("class", "like");
                         progress_bar_div.append(progress_span_tag);

                         image_share = document.createElement("img");
                         image_share.setAttribute("src", "/assets/images/share (1).png");
                         image_share.setAttribute("class", "share");
                         image_share.setAttribute("alt", "share");
                         image_share.setAttribute("width", "30px");
                         progress_span_tag.append(image_share);

                         amount_sec = document.createElement("div");
                         amount_sec.setAttribute("class", "amount");
                         progress_div.append(amount_sec);

                         txt_amount = document.createElement("span");
                         txt_amount.setAttribute("id", "txt-amt");
                         txt_amount.innerText = "Raised :";
                         amount_sec.append(txt_amount);

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

                         user_div = document.createElement("div");
                         user_div.setAttribute("class", "user");
                         anchor.append(user_div);

                         user_name = document.createElement("span");
                         user_name.setAttribute("class", "name-label");
                         user_name.innerHTML = "Created by" + "&nbsp";
                         user_div.append(user_name);

                         nameFundraise = document.createElement("span");
                         nameFundraise.setAttribute("class", "nameFundraiser");
                         nameFundraise.innerText = fundraiser.user.username;
                         user_div.append(nameFundraise);

                         container.prepend(card_div);

                         const cards = document.getElementsByClassName("box");

                         inputSearch.addEventListener("input", () => {
                             for (let i = 0; i < cards.length; i++) {
                                 const element = cards[i];
                                 if (
                                     element.innerHTML.toLowerCase().includes(inputSearch.value.toLowerCase())
                                 ) {
                                     element.style.display = "block";
                                 } else {
                                     element.style.display = "none";
                                 }
                             }
                         });
                     }
                }
                else{
                	if(amount<expected_amount){
                	 card_div = document.createElement("div");
                     card_div.setAttribute("class", "box");
                     card_div.setAttribute("id", "content");

                     anchor = document.createElement("div");
                     card_div.append(anchor);

                     a = document.createElement("a");
                     const fundraiseid = fundraiser.fundraiseid;
                     const userid = fundraiser.user.userid;
                     const storyUrl = "/pinapp/donate/story.jsp?product_id=" + fundraiseid + "&userid=" + userid;
                     a.setAttribute("href", storyUrl);
                     anchor.append(a);
  
                     console.log(fundraiser.fundraiseid);
                     image = document.createElement("img");
                     image.setAttribute("class", "image");
                     image.setAttribute("src", fundraiser.coverPic);
                     image.setAttribute("alt", "education");
                     a.append(image);

                     h4_tag = document.createElement("h4");
                     h4_tag.innerText = fundraiser.title;
                     anchor.append(h4_tag);

                     progress_div = document.createElement("div");
                     progress_div.setAttribute("class", "progress-sec");
                     anchor.append(progress_div);

                     let progress_bar_div;
                     progress_bar_div = document.createElement("div");
                     progress_bar_div.setAttribute("class", "progress_bar_div");
                     progress_div.append(progress_bar_div);

                     b_tag = document.createElement("b");
                     b_tag.innerText = percentage + "%";
                     progress_bar_div.append(b_tag);

                     progress_tag = document.createElement("progress");
                     progress_tag.setAttribute("id", "file");
                     progress_tag.setAttribute("value", percentage);
                     progress_tag.setAttribute("max", "100");
                     progress_bar_div.append(progress_tag);

                     progress_span_tag = document.createElement("span");
                     progress_span_tag.setAttribute("class", "like");
                     progress_bar_div.append(progress_span_tag);

                     image_share = document.createElement("img");
                     image_share.setAttribute("src", "./assets/images/share (1).png");
                     image_share.setAttribute("class", "share");
                     image_share.setAttribute("alt", "share");
                     image_share.setAttribute("width", "30px");
                     progress_span_tag.append(image_share);

                     amount_sec = document.createElement("div");
                     amount_sec.setAttribute("class", "amount");
                     progress_div.append(amount_sec);

                     txt_amount = document.createElement("span");
                     txt_amount.setAttribute("id", "txt-amt");
                     txt_amount.innerText = "Raised :";
                     amount_sec.append(txt_amount);

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

                     user_div = document.createElement("div");
                     user_div.setAttribute("class", "user");
                     anchor.append(user_div);

                     user_name = document.createElement("span");
                     user_name.setAttribute("class", "name-label");
                     user_name.innerHTML = "Created by" + "&nbsp";
                     user_div.append(user_name);

                     nameFundraise = document.createElement("span");
                     nameFundraise.setAttribute("class", "nameFundraiser");
                     nameFundraise.innerText = fundraiser.user.username;
                     user_div.append(nameFundraise);

                     container.prepend(card_div);

                     const cards = document.getElementsByClassName("box");

                     inputSearch.addEventListener("input", () => {
                         for (let i = 0; i < cards.length; i++) {
                             const element = cards[i];
                             if (
                                 element.innerHTML.toLowerCase().includes(inputSearch.value.toLowerCase())
                             ) {
                                 element.style.display = "block";
                             } else {
                                 element.style.display = "none";
                             }
                         }
                     });
                	
                }}
               
            }
        }