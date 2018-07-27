import "bootstrap";
import { bindSweetAlertButtonDemo } from '../libraries/sweetalert';
import { initAutocomplete } from '../libraries/place_autocomplete';
import { fillInAddress } from '../libraries/place_autocomplete';
import { activeLink } from '../style/active_link';
import { correspondenceDisplay } from '../style/correspondence_display';
import { formSubmit } from '../style/form_submit';
bindSweetAlertButtonDemo();
initAutocomplete();
fillInAddress();
activeLink();

formSubmit();


if ($('#travel_travel_code')) {
	correspondenceDisplay();
}