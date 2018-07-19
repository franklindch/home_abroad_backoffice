import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const swalButton = document.querySelector('.olivier');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "Confirmé!",
        text: "La famille vient d'être correctement ajoutée.",
        icon: "success"
      });
    });
  }
}

export { bindSweetAlertButtonDemo };