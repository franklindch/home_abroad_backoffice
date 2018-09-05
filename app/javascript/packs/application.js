
let Turbolinks = require("turbolinks")
Turbolinks.start()


import $ from "jquery";
import { Conditionals } from '../style/conditionals';
import { initializeIntlNumber } from '../libraries/initialize-intl-number';
// import { init } from '../style/conditionals';
import "bootstrap";
import "intl-tel-input";
import { bindSweetAlertButtonDemo } from '../libraries/sweetalert';
import { initAutocomplete } from '../libraries/place_autocomplete';
// import { fillInAddress } from '../libraries/place_autocomplete';
import { activeLink } from '../style/active_link';
import { formSubmit, AlertDisa } from '../style/form_submit';
import { travelConditionnal } from '../style/conditional_form';
import { autocompleteField } from '../style/autocomplete_field';


document.addEventListener("turbolinks:load", () => {
	bindSweetAlertButtonDemo();
	if ($('.google_map')){
		initAutocomplete();
	}
	// fillInAddress();
	// activeLink();
	Conditionals.init(); 
	formSubmit.init();
	AlertDisa();
	travelConditionnal.init();
	if($(".father_phone") || ($(".mother_phone"))){
		initializeIntlNumber();
		autocompleteField();
	}
});