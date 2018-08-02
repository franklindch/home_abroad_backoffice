
let Turbolinks = require("turbolinks")
Turbolinks.start()


import $ from "jquery";
import { Conditionals } from '../style/conditionals';
// import { init } from '../style/conditionals';
import "bootstrap";
import { bindSweetAlertButtonDemo } from '../libraries/sweetalert';
import { initAutocomplete } from '../libraries/place_autocomplete';
// import { fillInAddress } from '../libraries/place_autocomplete';
import { activeLink } from '../style/active_link';
import { formSubmit, AlertDisa } from '../style/form_submit';
import { travelConditionnal } from '../style/conditional_form';


document.addEventListener("turbolinks:load", () => {
	bindSweetAlertButtonDemo();
	initAutocomplete();
	// fillInAddress();
	activeLink();
	Conditionals.init(); 
	formSubmit.init();
	AlertDisa();
	travelConditionnal.init();
});