// This example displays an address form, using the autocomplete feature
// of the Google Places API to help users fill in the information.

// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

function initAutocomplete() {
  // Create the autocomplete object, restricting the search to geographical
  // location types.
  const autocomplete = new google.maps.places.Autocomplete(
    (document.querySelector('.google_map')), {types: ['geocode']}
  );
  google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);

  function onPlaceChanged() {
    const place = this.getPlace();
    console.log(place.address_components);
    const zipCode = document.querySelector('.zip_code_field');
    const countryField = document.querySelector('.country_field');
    const placeZipCode6 = place.address_components[6];
    const placeZipCode7 = place.address_components[7];
    const placeZipCode8 = place.address_components[8];
    const placecountryField = place.address_components[5];
    console.log(placecountryField)

    if (zipCode) {
      if (placeZipCode6) {
        zipCode.value = placeZipCode6.short_name
      }
      if (placeZipCode7) {
        zipCode.value = placeZipCode7.short_name
      }
      if (placeZipCode8) {
        zipCode.value = placeZipCode8.short_name
      }
    }
    if (placecountryField) {
      countryField.value = placecountryField.long_name
    }
  }
}


export { initAutocomplete } ;
