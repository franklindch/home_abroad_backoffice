import $ from "jquery";
import "select2"
import "bootstrap";
import "intl-tel-input";

let Turbolinks = require("turbolinks")
Turbolinks.start()

import { Conditionals } from '../style/conditionals';
import { initializeIntlNumberFamilyFields, initializeIntlNumberPartnerFields, initializeIntlNumberLSFields } from '../libraries/initialize-intl-number';
import { bindSweetAlertButtonDemo } from '../libraries/sweetalert';
import { initAutocomplete } from '../libraries/place_autocomplete';
import { formSubmit, AlertDisa } from '../style/form_submit';
import { travelConditionnal, travelGroupConditionnal } from '../style/conditional_form';
import { autocompleteFamilyFields, autocompleteInvoiceFieldTotal } from '../style/autocomplete_fields';
import { select2Attendants, select2PartnerCompanies } from '../style/select2_attendants';


document.addEventListener("turbolinks:load", () => {
	bindSweetAlertButtonDemo();
	if ($('#invoice_total_price_cents')) {
		autocompleteInvoiceFieldTotal();
	}
	if ($('.google_map')){
		initAutocomplete();
	}
	Conditionals.init();
	formSubmit.init();
	AlertDisa();
  travelGroupConditionnal.init();
  travelConditionnal.init();
  if ($('#travel_group_attendant_ids')) {
    select2Attendants();
  }
  if ($('.oli')) {
		select2PartnerCompanies();
  }
	if($(".father_phone") || ($(".mother_phone"))){
		initializeIntlNumberFamilyFields();
		autocompleteFamilyFields();
	}
	if($(".partner_company_phone_number")){
		initializeIntlNumberPartnerFields();
	}

	if ($('.phone_during_stay')){
		initializeIntlNumberLSFields();
	}
});
