function initializeIntlNumber() {
	$(".phone_field").intlTelInput({
		formatOnInit: true,
		separateDialCode: true,
		utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/12.1.12/js/utils.js",
		preferredCountries: ['fr', 'gb', 'de', 'ch', 'us', 'it', 'es'],
		initialCountry: 'fr',
		hiddenInput: 'intl_number'
	});
	if ($("[name=attendant[intl_number]]")) {
		const element = document.getElementById('submit_with_phone');
		const $other = $("[name=attendant[intl_number]]")
		convertNumber(element, $other)
	}

	$(".father_phone").intlTelInput({
		formatOnInit: true,
		separateDialCode: true,
		utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/12.1.12/js/utils.js",
		preferredCountries: ['fr', 'gb', 'de', 'ch', 'us', 'it', 'es'],
		initialCountry: 'fr',
		hiddenInput: 'father_intl_number'
	});
	document.getElementById('submit_with_phone').addEventListener('click', (event) => {
		$("[name=attendant[father_intl_number]]").intlTelNumber("getNumber");
	});
	$(".mother_phone").intlTelInput({
		formatOnInit: true,
		separateDialCode: true,
		utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/12.1.12/js/utils.js",
		preferredCountries: ['fr', 'gb', 'de', 'ch', 'us', 'it', 'es'],
		initialCountry: 'fr',
		hiddenInput: 'mother_intl_number'
	});
	document.getElementById('submit_with_phone').addEventListener('click', (event) => {
		$("[name=family[mother_intl_number]]").intlTelNumber("getNumber");
	});
}

function convertNumber(element, $other) {
	element.addEventListener('click', (event, $other) => {
		$other.intlTelNumber("getNumber");
	});
}

export { initializeIntlNumber };