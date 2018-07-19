import "bootstrap";
import { bindSweetAlertButtonDemo } from '../libraries/sweetalert';
import { initAutocomplete } from '../libraries/place_autocomplete';
import { fillInAddress } from '../libraries/place_autocomplete';
import { activeLink } from '../style/active_link';
bindSweetAlertButtonDemo();
initAutocomplete();
fillInAddress();
activeLink();