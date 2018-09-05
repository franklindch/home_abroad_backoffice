function autocompleteField() {
	$("#family_name").on('change', function(){
	  $("#family_father_name").val($(this).val());
	  $("#family_mother_name").val($(this).val());
	});
	$("#family_email").on('change', function(){
	  $("#family_father_email").val($(this).val());
	  $("#family_mother_email").val($(this).val());
	});
}

export { autocompleteField }