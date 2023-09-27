
window.onload = function() {
        const urlParams = new URLSearchParams(window.location.search);
        const fundraiseId = urlParams.get('fundraiseid');
        const contribution = urlParams.get('money');

        const url = `/pinapp/TransactionServlet?fundrasieid=${fundraiseId}&money=${contribution}`;
        axios.get(url)
            .then(function(response) {
                const data = response.data;
                
                const arr = data.fundraise;
                
                const userObj = arr[0].user;
                
              document.getElementById("bankname").value = userObj.accName;
       		  document.getElementById("accno").value = userObj.accNo;
              document.getElementById("ifsc").value = userObj.ifscNo;
              document.getElementById("phno").value = userObj.mobileno; 
            })
            .catch(function(error) {
                console.error('Request failed', error);
            });
    };
 



