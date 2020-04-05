function checkLuhn(value) {
    // remove all non digit characters
    var value = value.replace(/\D/g, '');
    var sum = 0;
    var shouldDouble = false;

    // loop through values starting at the rightmost side
    for (var i = value.length - 1; i >= 0; i--) {
        var digit = parseInt(value.charAt(i));
        
        if (shouldDouble) {
        if ((digit *= 2) > 9) digit -= 9;
        }

        sum += digit;
        shouldDouble = !shouldDouble;
    }

    return (sum % 10) == 0;
}

// Güncel kredi kartı bilgileri 
// https://en.wikipedia.org/wiki/Payment_card_number
var acceptedCardTypes = [
	{	
		"id"		: 1,
		"name"		: "American Express", // Brand
		"logo"		: "amex.png",
		"prefixes"	: // Accepted Card Numbers
		{
	  		"34" : "15", // Card Number Prefix | Card Number Length
	  		"37" : "15"
		}
	},
	{
		"id"		: 2,
		"name"		: "maestro",
		"logo"		: "maestro.png",
		"prefixes"	: 
		{
			"50"	: "12-19",
			"6759"	: "12-19",
			"676770": "12-19",
			"676774": "12-19",
			"56-69"	: "12-19"
		}
	},
	{
		"id"		: 3,
		"name"		: "mastercard",
		"logo"		: "mastercard.png",
		"prefixes"	: 
		{
			"2221-2720" : "16",
			"51-55"	 	: "16"
		}
	},
	{
		"id"		: 4,
		"name"		: "visa",
		"logo"		: "visa.png",
		"prefixes"	: 
		{
			"4" : "13-19"
		}
	},
	{
		"id"		: 5,
		"name"		: "troy",
		"logo"		: "troy.png",
		"prefixes"	: 
		{
			"979200-979289": "16"
		}
	}
];

function checkSupportedCard(cardNumberId, cardLogoId, cardNumber){
	cardNumber = cardNumber.replace(/[^0-9]/g, '');
	var cardNumberLength = cardNumber.length;
	var firstSixDigits = parseInt(cardNumber.substring(0, 6).padEnd(6, 0));
	var prefixId = 0;
	var isValidCard = false;
	var imgSrc = "";
	
	if(cardNumberLength < 2){
		return;
	}

	var jsonData = JSON.parse(JSON.stringify(acceptedCardTypes));
	for (var i = 0; i < jsonData.length; i++) {
		Object.entries(jsonData[i].prefixes).forEach(([key, value]) => {
			var prefix = key;
			var prefixMin = 0;
			var prefixMax = 0;
			var isValidPrefix = false;

			if(prefix.indexOf('-') !== -1) {
				var prefixArray = prefix.split('-');
				prefixMin = parseInt(prefixArray[0].padEnd(6, '0'));
				prefixMax = parseInt(prefixArray[1].padEnd(6, '9'));
			}
			else{
				prefixMin = prefix.padEnd(6, '0');
				prefixMax = prefix.padEnd(6, '9');
			}

			isValidPrefix = firstSixDigits >= prefixMin && firstSixDigits <= prefixMax;

			if(isValidPrefix){
				var length = value;
				var lengthMin = 0;
				var lengthMax = 0;
				prefixId = jsonData[i].id;
				imgSrc = `/Assets/images/${jsonData[i].logo}`;

				if(length.indexOf('-') !== -1){
					var lengthArray = length.split('-');
					lengthMin = parseInt(lengthArray[0]);
					lengthMax = parseInt(lengthArray[1]);

					isValidLength = cardNumberLength >= lengthMin && cardNumberLength <= lengthMax;
				}
				else{
					isValidLength = cardNumberLength == parseInt(length);
				}

				if(isValidLength)
				{
					isValidCard = checkLuhn(cardNumber);
				}
			}
		});
		
		formatCardNumber(cardNumberId, cardLogoId, imgSrc, prefixId, cardNumber);
	}
	
	return isValidCard;
}

function formatCardNumber(cardNumberId, cardLogoId, imgSrc, prefixId, cardNumber){
	var cardNumberLength = cardNumber.length;
	if(cardNumberLength < 2){
		return;
	}

	var block1      = '';
	var block2      = '';
	var block3      = '';
	var block4      = '';
	var formatted   = '';

	block1 = cardNumber.substring(0, 4);
	if (block1.length == 4) { // 4
		block1 = block1 + ' ';
	}

	if (prefixId == 1) {
		// Amex
		block2 = cardNumber.substring(4, 10);
		if (block2.length == 6) {
			block2 = block2 + ' ';
		}

		block3 = cardNumber.substring(10, 15);
		block4 = '';
	}
	else if (prefixId == 3 || prefixId == 4 || prefixId == 5) {
		// Visa - MasterCard - Troy
		block2 = cardNumber.substring(4, 8);
		if (block2.length == 4) {
			block2 = block2 + ' ';
		}

		block3 = cardNumber.substring(8, 12);
		if (block3.length == 4) {
			block3 = block3 + ' ';
		}

		block4 = cardNumber.substring(12, 16);
	}

	formatted = block1 + block2 + block3 + block4;
	document.getElementById(cardNumberId).value = formatted;
	document.getElementById(cardLogoId).src = imgSrc;
}

$("#cc-number").keyup(function creditCardFormatter(event) {
	var cardNumberId = this.id;
	var cardLogoId = "card-logo";

	// Backspace
	if (event.keyCode == 8) {
		return;
	}

	var cardNumber = document.getElementById(cardNumberId).value;
	checkSupportedCard(cardNumberId, cardLogoId, cardNumber);
});