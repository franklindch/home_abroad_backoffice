import $ from 'jquery';
import 'select2';

function select2Attendants() {
    $('#travel_group_attendant_ids').select2();
}

function select2PartnerCompanies() {
    $('.oli').select2();
}

export { select2Attendants, select2PartnerCompanies } ;
