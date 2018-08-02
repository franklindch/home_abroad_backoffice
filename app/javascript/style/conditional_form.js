const travelConditionnal = {
  init() {
    const $travelNatureSelect = $("[name='travel[nature]']");
    const $travelGroupIdSection = $(".travel_travel_group_id");
    const $travelGroupId = $('#travel_travel_group_id');
    const $childDetails = $('.child_details');
    if($travelNatureSelect) {
      this.travelConditionnalExecute($travelNatureSelect, $childDetails, $travelGroupIdSection)
    }
  },

  travelConditionnalExecute($travelNatureSelect, $childDetails, $travelGroupIdSection) {
    const $travelGroup = $('.travel-form');
    // if($travelGroup) {
    //   $childDetails.hide();
    //   $travelNatureSelect.change(event => {
    //     const $travelNatureVal = $(event.target).val();
    //     console.log($travelNatureVal);
    //     if ($travelNatureVal != 'Groupe') {
    //       console.log('groupe')
    //       $childDetails.show();
    //       $travelGroupIdSection.hide();
    //       $("#travel_travel_details_attributes_0_is_correspondence_false").prop("checked", true);
    //       $("#travel_travel_details_attributes_1_is_correspondence_false").prop("checked", true);
    //     } else {
    //       $childDetails.hide();
    //       $travelGroupIdSection.show();
    //     };
    //   });
    // } else {
    //   $childDetails.hide();
    // }
  }
};

export { travelConditionnal }