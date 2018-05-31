import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const swalButton = document.querySelectorAll('.sweet-alert-demo');
  if (swalButton) {
    swalButton.forEach(function(button) {
      button.addEventListener('click', () => {
        swal({
          title: "Youhou, you did great!",
          icon: "success"
        });
      });
    }) // protect other pages
  }
}

export { bindSweetAlertButtonDemo };
