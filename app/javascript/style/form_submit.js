function formSubmit() {
	const input = document.getElementById('family_address_1');
	google.maps.event.addDomListener(input, 'keydown', function(event) { 
	if (event.keyCode === 13) { 
	    event.preventDefault(); 
	}
	}); 
}

export { formSubmit };