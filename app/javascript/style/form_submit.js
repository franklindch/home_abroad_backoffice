const formSubmit = {
	init() {
	  const input = document.getElementById('family_address_1');
	  if (input) {
	    this.prevent(input);
	  }
	},

	prevent(input) {
		google.maps.event.addDomListener(input, 'keydown', function(event) { 
		if (event.keyCode === 13) { 
		    event.preventDefault(); 
		}
		}); 
	}
}



function slowAlertDisappears() {
	$('.alert').fadeOut('slow');
}

function AlertDisa(){setTimeout(slowAlertDisappears, 3000)}



export { formSubmit, AlertDisa };








