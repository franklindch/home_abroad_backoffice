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
    if ($('#travel_group_attendant_ids')) {
      this.travelGroupConditionnalExecute();
    }
  },

  travelGroupConditionnalExecute() {
    if ($("#travel_group_travel_details_attributes_0_is_correspondence_false").prop("checked", true)) {
      $('.child_details_section:eq(0)').hide();
    } else {
      $('.child_details_section:eq(0)').show();
    }
    if ($("#travel_group_travel_details_attributes_0_is_correspondence_false").prop("checked", true)) {
      $('.child_details_section:eq(0)').show();
    }
  }
}

export { travelConditionnal, travelGroupConditionnal };
