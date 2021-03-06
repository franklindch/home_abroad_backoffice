const travelSelectConditionnal = {
  init() {
    const $travelNatureSelect = $("[name='travel[nature]']");
    const $travelGroupIdSection = $(".travel_travel_group_id");
    const $travelGroupId = $('#travel_travel_group_id');
    const $childDetails = $('.child_details_1');
    const $travelGroup = $('.travel-form');
    const $travelId = $('#travel_travel_id');
    const $oh = $('.ohoh');
    if($travelNatureSelect) {
      this.travelConditionnalExecute($travelNatureSelect, $childDetails, $travelGroupIdSection, $travelGroup, $travelId, $oh)
    }
  },

  travelConditionnalExecute($travelNatureSelect, $childDetails, $travelGroupIdSection, $travelGroup, $travelId, $oh) {
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
    if ($oh) {
      $childDetails.show();
    }
  }
};

const travelGroupConditionnal = {
  init() {
    if($("#travel_group_travel_details_attributes_0_is_correspondence_false").prop("checked", true)){
      $('.correspondence:eq(0)').hide();
    }
    if($("#travel_group_travel_details_attributes_1_is_correspondence_false").prop("checked", true)){
      $('.correspondence:eq(1)').hide();
    }
  }
}

export { travelSelectConditionnal, travelGroupConditionnal };
