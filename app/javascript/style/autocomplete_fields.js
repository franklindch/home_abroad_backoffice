function autocompleteFamilyFields() {
	$("#family_name").on('change', function(){
	  $("#family_father_name").val($(this).val());
	  $("#family_mother_name").val($(this).val());
	});
	$("#family_email").on('change', function(){
	  $("#family_father_email").val($(this).val());
	  $("#family_mother_email").val($(this).val());
	});
}

function autocompleteInvoiceFieldTotal() {
  if($("#invoice_option_1_price_cents") && $("#invoice_option_2_price_cents") && $("#invoice_transfer_price_cents")){
    a();
  }
  if($("#invoice_option_1_price_cents") && $("#invoice_option_2_price_cents")){
    b();
  }
  if($("#invoice_option_1_price_cents")){
    c();
  }
  if($("#invoice_transfer_price_cents")) {
    d();
  }
  if(("#invoice_application_fee_price_cents") && $("#invoice_travel_price_cents") && $("#invoice_language_stay_price_cents")) {
    e();
  }
}

function a() {
	$(document).on("change", "#invoice_application_fee_price_cents", function() {
	  const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val(),
    option2PriceCents = $("#invoice_option_2_price_cents").val(),
    TransferPriceCents = $("#invoice_transfer_price_cents").val();
	  const total = parseInt(option2PriceCents) + parseInt(option1PriceCents) + parseInt(TransferPriceCents) + parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
	  $("#invoice_total_price_cents").val(total);
	});
	$(document).on("change", "#invoice_language_stay_price_cents", function() {
	  const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val(),
    option2PriceCents = $("#invoice_option_2_price_cents").val(),
    TransferPriceCents = $("#invoice_transfer_price_cents").val();
	  const total = parseInt(option2PriceCents) + parseInt(option1PriceCents) + parseInt(TransferPriceCents) + parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
	  $("#invoice_total_price_cents").val(total);
	});

	$(document).on("change", "#invoice_travel_price_cents", function() {
	  const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val(),
    option2PriceCents = $("#invoice_option_2_price_cents").val(),
    TransferPriceCents = $("#invoice_transfer_price_cents").val();
	  const total = parseInt(option1PriceCents) + parseInt(option2PriceCents) + parseInt(TransferPriceCents) + parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
	  $("#invoice_total_price_cents").val(total);
	});

	$(document).on("change", "#invoice_option_1_price_cents", function() {
	  const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val(),
    option2PriceCents = $("#invoice_option_2_price_cents").val(),
    TransferPriceCents = $("#invoice_transfer_price_cents").val();
	  const total = parseInt(TransferPriceCents) + parseInt(applicationFeePriceCents) + parseInt(option2PriceCents) + parseInt(option1PriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
	  $("#invoice_total_price_cents").val(total);
	});

	$(document).on("change", "#invoice_option_2_price_cents", function() {
	  const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val(),
    option2PriceCents = $("#invoice_option_2_price_cents").val(),
    TransferPriceCents = $("#invoice_transfer_price_cents").val();
	  const total = parseInt(TransferPriceCents) + parseInt(applicationFeePriceCents) + parseInt(option2PriceCents) + parseInt(option1PriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
	  $("#invoice_total_price_cents").val(total);
	});

  $(document).on("change", "#invoice_transfer_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
     languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
     TravelPriceCents = $("#invoice_travel_price_cents").val(),
     option1PriceCents = $("#invoice_option_1_price_cents").val(),
     option2PriceCents = $("#invoice_option_2_price_cents").val(),
     TransferPriceCents = $("#invoice_transfer_price_cents").val();
    const total = parseInt(TransferPriceCents) + parseInt(applicationFeePriceCents) + parseInt(option2PriceCents) + parseInt(option1PriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });
}

function b() {
  $(document).on("change", "#invoice_application_fee_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val(),
    option2PriceCents = $("#invoice_option_2_price_cents").val();
    const total = parseInt(option2PriceCents) + parseInt(option1PriceCents) + parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });
  $(document).on("change", "#invoice_language_stay_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val(),
    option2PriceCents = $("#invoice_option_2_price_cents").val();
    const total = parseInt(option2PriceCents) + parseInt(option1PriceCents) + parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });

  $(document).on("change", "#invoice_travel_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val(),
    option2PriceCents = $("#invoice_option_2_price_cents").val();
    const total = parseInt(option1PriceCents) + parseInt(option2PriceCents) + parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });

  $(document).on("change", "#invoice_option_1_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val(),
    option2PriceCents = $("#invoice_option_2_price_cents").val();
    const total = parseInt(applicationFeePriceCents) + parseInt(option2PriceCents) + parseInt(option1PriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });

  $(document).on("change", "#invoice_option_2_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val(),
    option2PriceCents = $("#invoice_option_2_price_cents").val();
    const total = parseInt(applicationFeePriceCents) + parseInt(option2PriceCents) + parseInt(option1PriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });
}

function c() {
  $(document).on("change", "#invoice_application_fee_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val();
    const total = parseInt(option1PriceCents) + parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });
  $(document).on("change", "#invoice_language_stay_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val();
    const total = parseInt(option1PriceCents) + parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });

  $(document).on("change", "#invoice_travel_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val();
    const total = parseInt(option1PriceCents) + parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });

  $(document).on("change", "#invoice_option_1_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    option1PriceCents = $("#invoice_option_1_price_cents").val();
    const total = parseInt(applicationFeePriceCents) + parseInt(option1PriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });
}

function d() {
  $(document).on("change", "#invoice_application_fee_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TransferPriceCents = $("#invoice_transfer_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val();
    const total = parseInt(TransferPriceCents) + parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });
  $(document).on("change", "#invoice_language_stay_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    TransferPriceCents = $("#invoice_transfer_price_cents").val();
    const total = parseInt(TransferPriceCents) + parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });

  $(document).on("change", "#invoice_travel_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    TransferPriceCents = $("#invoice_transfer_price_cents").val();
    const total = parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents) + parseInt(TransferPriceCents)
    $("#invoice_total_price_cents").val(total);
  });

  $(document).on("change", "#invoice_transfer_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val(),
    TransferPriceCents = $("#invoice_transfer_price_cents").val();
    const total = parseInt(applicationFeePriceCents) + parseInt(TransferPriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });
}

function e() {
  $(document).on("change", "#invoice_application_fee_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val();
    const total = parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });
  $(document).on("change", "#invoice_language_stay_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val();
    const total = parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });

  $(document).on("change", "#invoice_travel_price_cents", function() {
    const applicationFeePriceCents = $("#invoice_application_fee_price_cents").val() || 120,
    languageStayPriceCents = $("#invoice_language_stay_price_cents").val(),
    TravelPriceCents = $("#invoice_travel_price_cents").val();
    const total = parseInt(applicationFeePriceCents) + parseInt(languageStayPriceCents) + parseInt(TravelPriceCents)
    $("#invoice_total_price_cents").val(total);
  });
}

export { autocompleteFamilyFields, autocompleteInvoiceFieldTotal }
