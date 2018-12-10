const formSubmit = {
	init() {
	  const input = document.querySelector('.google_map');
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
  setTimeout(function(){ $('.alert').fadeOut('slow'); }, 2500);
}

function AlertDisa(){}



export { formSubmit, AlertDisa, slowAlertDisappears };








