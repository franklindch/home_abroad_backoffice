// This example displays an address form, using the autocomplete feature
// of the Google Places API to help users fill in the information.

// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

function initAutocomplete() {
  // Create the autocomplete object, restricting the search to geographical
  // location types.
  const autocomplete = new google.maps.places.Autocomplete(
      /** @type {!HTMLInputElement} */(document.querySelector('.google_map')),
      {types: ['geocode']});
}


export { initAutocomplete } ;