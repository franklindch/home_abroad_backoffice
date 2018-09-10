function initializeIntlNumberFamilyFields() {
	$(".phone_field").intlTelInput({
		formatOnInit: true,
		separateDialCode: true,
		utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/12.1.12/js/utils.js",
		preferredCountries: ['fr', 'gb', 'de', 'ch', 'us', 'it', 'es'],
		initialCountry: 'fr',
		hiddenInput: 'intl_number',
		placeholderNumberType: 'mobile'
	});

	if(document.getElementById('submit_with_phone')) {
		document.getElementById('submit_with_phone').addEventListener('click', (event) => {
			$("[name=attendant[intl_number]]").intlTelNumber("getNumber");
		});
	}

	$(".father_phone").intlTelInput({
		formatOnInit: true,
		separateDialCode: true,
		utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/12.1.12/js/utils.js",
		preferredCountries: ['fr', 'gb', 'de', 'ch', 'us', 'it', 'es'],
		initialCountry: 'fr',
		hiddenInput: 'father_intl_number',
		placeholderNumberType: 'mobile'
	});

	if(document.getElementById('submit_with_phone')) {
		document.getElementById('submit_with_phone').addEventListener('click', (event) => {
			$("[name=attendant[father_intl_number]]").intlTelNumber("getNumber");
		});
	}	

	$(".mother_phone").intlTelInput({
		formatOnInit: true,
		separateDialCode: true,
		utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/12.1.12/js/utils.js",
		preferredCountries: ['fr', 'gb', 'de', 'ch', 'us', 'it', 'es'],
		initialCountry: 'fr',
		hiddenInput: 'mother_intl_number',
		placeholderNumberType: 'mobile'
	});

	if(document.getElementById('submit_with_phone')) {
		document.getElementById('submit_with_phone').addEventListener('click', (event) => {
			$("[name=family[mother_intl_number]]").intlTelNumber("getNumber");
		});
	}

	$(".mother_office_phone").intlTelInput({
		formatOnInit: true,
		separateDialCode: true,
		utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/12.1.12/js/utils.js",
		preferredCountries: ['fr', 'gb', 'de', 'ch', 'us', 'it', 'es'],
		initialCountry: 'fr',
		hiddenInput: 'mother_office_intl_number',
		placeholderNumberType: 'mobile'
	});

	if(document.getElementById('submit_with_phone')) {
		document.getElementById('submit_with_phone').addEventListener('click', (event) => {
			$("[name=family[mother_office_intl_number]]").intlTelNumber("getNumber");
		});
	}

	$(".father_office_phone").intlTelInput({
		formatOnInit: true,
		separateDialCode: true,
		utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/12.1.12/js/utils.js",
		preferredCountries: ['fr', 'gb', 'de', 'ch', 'us', 'it', 'es'],
		initialCountry: 'fr',
		hiddenInput: 'father_office_intl_number',
		placeholderNumberType: 'mobile'
	});

	if(document.getElementById('submit_with_phone')) {
		document.getElementById('submit_with_phone').addEventListener('click', (event) => {
			$("[name=family[father_office_intl_number]]").intlTelNumber("getNumber");
		});
	}
}

function initializeIntlNumberPartnerFields() {
	$(".phone_number").intlTelInput({
		formatOnInit: true,
		separateDialCode: true,
		utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/12.1.12/js/utils.js",
		preferredCountries: ['fr', 'gb', 'de', 'ch', 'us', 'it', 'es'],
		initialCountry: 'fr',
		hiddenInput: 'intl_number',
		placeholderNumberType: 'mobile'
	});

	if(document.getElementById('submit_with_phone')) {
		document.getElementById('submit_with_phone').addEventListener('click', (event) => {
			$("[name=attendant[intl_number]]").intlTelNumber("getNumber");
		});
	}

	$(".urgence_phone_number").intlTelInput({
		formatOnInit: true,
		separateDialCode: true,
		utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/12.1.12/js/utils.js",
		preferredCountries: ['fr', 'gb', 'de', 'ch', 'us', 'it', 'es'],
		initialCountry: 'fr',
		hiddenInput: 'urgence_intl_phone_number',
		placeholderNumberType: 'mobile'
	});

	if(document.getElementById('submit_with_phone')) {
		document.getElementById('submit_with_phone').addEventListener('click', (event) => {
			$("[name=attendant[urgence_phone_number]]").intlTelNumber("getNumber");
		});
	}
}

function initializeIntlNumberLSFields() {
	$(".phone_during_stay").intlTelInput({
		formatOnInit: true,
		separateDialCode: true,
		utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/12.1.12/js/utils.js",
		preferredCountries: ['fr', 'gb', 'de', 'ch', 'us', 'it', 'es'],
		initialCountry: 'fr',
		hiddenInput: 'intl_number',
		placeholderNumberType: 'mobile'
	});

	if(document.getElementById('submit_with_phone')) {
		document.getElementById('submit_with_phone').addEventListener('click', (event) => {
			$("[name=attendant[intl_number]]").intlTelNumber("getNumber");
		});
	}
}

export { initializeIntlNumberFamilyFields, initializeIntlNumberPartnerFields, initializeIntlNumberLSFields };