function activeLink() {
	const $leftNavbar = $('.flex-column');
	const $links = $('.item');
	console.log($links)
	for (let i = 0; i < $links.length; i++) {
	  $links[i].addEventListener("click", function() {
	    let $current = $('.active');
	    if ($current[0] === 'active') {
	    	$current[0].removeClass(' active');
	    	this.className += " active";
	    }
	  });
	};
}

export { activeLink };