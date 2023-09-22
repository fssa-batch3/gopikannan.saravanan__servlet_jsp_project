
  const urlParams = new URLSearchParams(window.location.search);
  const id = urlParams.get("product_id");
  document.getElementById('fundraiseid').value = id;
 



        const url = `/pinapp/TransactionServlet?fundrasieid=${id}`;
        axios.get(url)
            .then(function(response) {
              const   data = response.data;
                console.log(data);
                
                const fundraiseDetails = data.fundraise;
                console.log(fundraiseDetails);
                
               const  userObj = fundraiseDetails[0].user;
               console.log(userObj);
               
               toProcess(fundraiseDetails,userObj);
                
            })
            .catch(function(error) {
                console.error('Request failed', error);
            });

function toProcess(fundraiseDetails){
let expected_amount = fundraiseDetails[0].expectedAmount;
console.log(expected_amount);

let contri = document.getElementById("Contribution");

contri.addEventListener("keyup", function () {
  let valuecontri = parseFloat(contri.value);
  console.log(valuecontri);

  if (valuecontri >= expected_amount) {
    confirm(
      "Are you sure you want to donate more than the expected amount by the fundraiser"
    );
  }
   if (valuecontri < 0) {
      alert("Invalid contribution amount: you cannot enter a negative value");
      contri.value = ""; 
      return;
    }

});

// function to convert into number
function numberToWords(number) {
  const units = [
    "",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
  ];
  const teens = [
    "ten",
    "eleven",
    "twelve",
    "thirteen",
    "fourteen",
    "fifteen",
    "sixteen",
    "seventeen",
    "eighteen",
    "nineteen",
  ];
  const tens = [
    "",
    "",
    "twenty",
    "thirty",
    "forty",
    "fifty",
    "sixty",
    "seventy",
    "eighty",
    "ninety",
  ];

  function convertTwoDigitNumber(number) {
    if (number < 10) {
      return units[number];
    } else if (number < 20) {
      return teens[number - 10];
    } else {
      const tensDigit = Math.floor(number / 10);
      const onesDigit = number % 10;
      return tens[tensDigit] + " " + units[onesDigit];
    }
  }

  function convertThreeDigitNumber(number) {
    const hundredsDigit = Math.floor(number / 100);
    const twoDigitRemainder = number % 100;
    let result = units[hundredsDigit] + " hundred";
    if (twoDigitRemainder !== 0) {
      result += " " + convertTwoDigitNumber(twoDigitRemainder);
    }
    return result;
  }

  function convertNumber(number) {
    if (number < 100) {
      return convertTwoDigitNumber(number);
    } else if (number < 1000) {
      return convertThreeDigitNumber(number);
    } else {
      const suffixes = ["", "thousand", "million", "billion", "trillion"];
      for (let i = 1; i < suffixes.length; i++) {
        const power = Math.pow(1000, i);
        if (number < power * 1000) {
          const quotient = Math.floor(number / power);
          const remainder = number % power;
          return (
            convertNumber(quotient) +
            " " +
            suffixes[i] +
            " " +
            convertNumber(remainder)
          );
        }
      }
    }
    return "Number out of range";
  }

  if (number === 0) {
    return "zero";
  } else if (number < 0) {
    return "minus " + convertNumber(-1 * number);
  } else {
    return convertNumber(number);
  }
}

let directBank = document.getElementById("banktransfer");
directBank.addEventListener("click", function () {
  const donatercontribution = document.getElementById("Contribution");
  if (donatercontribution.value == "" || donatercontribution.value == null) {
    alert("Fill your contribution for the next process");
    return;
  }

  const donatercontributionvalue = donatercontribution.value;

  const number = parseInt(donatercontributionvalue);

  const words = numberToWords(number);

  let conf = confirm(`Are you sure you want to donate Rs: ${words} `);
  console.log(conf);
  if (conf == true) {
	 document.getElementById("form").submit();
  } else {
    return;
  }
});


}
