import swal from 'sweetalert';

function bindSweetAlertButtonDemo(pot_id) {
  const swalButton = document.querySelectorAll('.sweet-alert-demo');
  if (swalButton) {
    swalButton.forEach(function(button) {
      button.addEventListener('click', () => {
        swal({
          title: "Youhou, you did great!",
          icon: "success",
          timer: 30000,
        });
      });
    }) // protect other pages
  }
}

export { bindSweetAlertButtonDemo };
