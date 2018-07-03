import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const swalButton = document.querySelector('.olivier');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "A nice alert",
        text: "This is a great alert, isn't it?",
        icon: "success"
      });
    });
  }
}

export { bindSweetAlertButtonDemo };