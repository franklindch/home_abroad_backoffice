import $ from "jquery";
import "bootstrap";

let Turbolinks = require("turbolinks")
Turbolinks.start()

import { Conditionals } from '../style/conditionals';
import { calendar, calendarBirthDate } from '../style/flatpicker';
import { initAutocomplete } from '../libraries/place_autocomplete';
import { formSubmit, AlertDisa } from '../style/form_submit';
import { travelSelectConditionnal, travelGroupConditionnal } from '../style/conditional_form';
import { autocompleteFamilyFields, autocompleteInvoiceFieldTotal, f } from '../style/autocomplete_fields';
import { select2Attendants, select2PartnerCompanies } from '../style/select2_attendants';
import { slowAlertDisappears } from '../style/form_submit';

document.addEventListener("turbolinks:load", () => {
  if ($('.calendar_birth_date')) {
    calendarBirthDate();
  }
  if ($('#range_end')) {
    calendar();
  }

  if ($('.alert')) {
    slowAlertDisappears();
  }
  if ($('.google_map')){
    initAutocomplete();
  }
	Conditionals.init();
	formSubmit.init();
	AlertDisa();
  travelGroupConditionnal.init();
  travelSelectConditionnal.init();
  if ($('#travel_group_attendant_ids')) {
    select2Attendants();
  }
  if ($('.oli')) {
		select2PartnerCompanies();
  }
});
