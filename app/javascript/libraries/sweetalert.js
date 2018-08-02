import swal from 'sweetalert';

const handleConfirm = () => {
  const element = document.querySelector('.delete-link')
    if (element.getAttribute('data-confirm-swal') === null) {
      return true
    }

    showConfirmationDialog(element)
    return false
  }

  // Display the confirmation dialog
  const showConfirmationDialog = element => {
    const message = element.getAttribute('data-confirm-swal')
    const text = element.getAttribute('data-text')
    function sw() {
      swal("Elément supprimé avec succès !", {
        icon: "success",
      });
    };

    swal({
      title: "Êtes-vous sûr ?",
      text: "Une fois supprimé, vous ne pourrez pas retrouver cette données.",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        var id = $('.delete-link').attr("id");
        var family_id = $('.delete-link').attr("family_id");
        $.ajax({
          data: { id: id, family_id: family_id },
          type: "DELETE",
          url: "/dashboard/families/"+family_id+"/clients/"+id,
          success: setTimeout(sw, 1000)
        });

      }
    }).then(result => confirmed(element))
  }

  const confirmed = (element) => {
      // User clicked confirm button
      element.removeAttribute('data-confirm-swal')
      element.click()
    }

  // Hook the event before the other rails events so it works togeter
  // with `method: :delete`.
  // See https://github.com/rails/rails/blob/master/actionview/app/assets/javascripts/rails-ujs/start.coffee#L69

  // Do your thing

// Add event listener before the other Rails event listeners like the one
// for `method: :delete`
function bindSweetAlertButtonDemo() {
  Rails.delegate(document, 'a[data-confirm-swal]', 'click', handleConfirm)
}

  // if (swalButton) { // protect other pages
  //   swalButton.addEventListener('click', () => {
  //     swal({
  //       title: "Confirmé!",
  //       text: "La famille vient d'être correctement ajoutée.",
  //       icon: "success"




export { bindSweetAlertButtonDemo };