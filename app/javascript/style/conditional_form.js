const travelConditionnal = {
  init() {
    const $travelNatureSelect = $("[name='travel[nature]']");
    const $travelGroupIdSection = $(".travel_travel_group_id");
    const $travelGroupId = $('#travel_travel_group_id');
    const $childDetails = $('.child_details_1');
    const $travelGroup = $('.travel-form');
    const $travelId = $('#travel_travel_id');
    if($travelNatureSelect) {
      this.travelConditionnalExecute($travelNatureSelect, $childDetails, $travelGroupIdSection, $travelGroup, $travelId)
    }
  },

  travelConditionnalExecute($travelNatureSelect, $childDetails, $travelGroupIdSection, $travelGroup, $travelId) {
    if($travelGroup) {
      $childDetails.hide();
      $travelNatureSelect.change(event => {
        const $travelNatureVal = $(event.target).val();
        if(!(($travelNatureVal == 'Groupe') || ($travelNatureVal == 'Groupe_décalé'))) {
          $childDetails.show();
          $travelGroupIdSection.hide();
          $("#travel_travel_details_is_correspondence_true").prop("checked", true);
          $("#travel_travel_details_is_correspondence_true").prop("checked", true);
          $travelId.hide();
        } else {
          $travelId.show();
          $childDetails.hide();
          $travelGroupIdSection.show();
        };
      });
    } else {
      $childDetails.hide();
    }
    // if($('.travel_travel_code')) {
    //   $("#travel_travel_details_is_correspondence_true").prop("checked", true);
    //   $("#travel_travel_details_is_correspondence_true").prop("checked", true);
    // };
  }
};

const travelGroupConditionnal = {
  init() {
  }
}

export { travelConditionnal, travelGroupConditionnal };
