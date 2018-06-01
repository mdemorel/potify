import swal from 'sweetalert';
import $ from 'jquery';

function bindSweetAlertButtonDemo() {
  const swalButton = document.querySelectorAll('.sweet-alert-demo');
  if (swalButton) {
    swalButton.forEach(function(button) {
      button.addEventListener('click', (e) => {
        var point = $(e.currentTarget).parents('form').find('.task-content')[0].dataset.points;
        swal({
          title: "Youhou, you did great!",
          text: `You won ${point} points`,
          icon: "success",
          timer: 30000,
        });
      });
    }) // protect other pages
  }
}

export { bindSweetAlertButtonDemo };

