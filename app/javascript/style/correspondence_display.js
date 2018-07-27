function correspondenceDisplay() {
	const $correspondenceCheck1 = $('#travel_travel_details_attributes_0_correspondence');
	const $correspondenceCheck2 = $('#travel_travel_details_attributes_1_correspondence');
	const $correspondencePart1 = $('.correspondence:eq(0)')
	const $correspondencePart2 = $('.correspondence:eq(1)')
	$correspondencePart1.hide();
	$correspondencePart2.hide();
	if ($correspondenceCheck1.is(':checked')) {
		$correspondencePart1.show(); 
	} else {
		$correspondencePart1.hide();
	}
	if ($correspondenceCheck2.is(':checked')) {
		$correspondencePart2.show(); 
	} else {
		$correspondencePart2.hide();
	}
}

export { correspondenceDisplay };