autocompleteFamilyFields = function() {
	$("#family_name").on('change', function(){
	  $("#family_father_name").val($(this).val());
	  $("#family_mother_name").val($(this).val());
	});
	$("#family_email").on('change', function(){
	  $("#family_father_email").val($(this).val());
	  $("#family_mother_email").val($(this).val());
	});
}

autocompleteInvoiceFieldTotal = function() {
	$(document).on("change", "#invoice_application_fee_price_cents", function() {
	  const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 0,
	      languageStayPriceCents = $("#invoice_language_stay_price_cents").val() || 0,
	      TravelPriceCents = $("#invoice_travel_price_cents").val() || 0;
	  const total = parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
	  $("#invoice_total_price_cents").val(total);
	});
	$(document).on("change", "#invoice_language_stay_price_cents", function() {
	  const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 0,
	      languageStayPriceCents = $("#invoice_language_stay_price_cents").val() || 0,
	      TravelPriceCents = $("#invoice_travel_price_cents").val() || 0;
	  const total = parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
	  $("#invoice_total_price_cents").val(total);
	});

	$(document).on("change", "#invoice_travel_price_cents", function() {
	  const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 0,
	      languageStayPriceCents = $("#invoice_language_stay_price_cents").val() || 0,
	      TravelPriceCents = $("#invoice_travel_price_cents").val() || 0;
	  const total = parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
	  $("#invoice_total_price_cents").val(total);
	});
}


// function optionalInvoiceFields() {
// 	if($("#invoice_option_1_price_cents")){

// 	}
// 	if($("#invoice_option_2_price_cents")){

// 	}
// }

export { autocompleteFamilyFields, autocompleteInvoiceFieldTotal }