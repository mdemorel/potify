import swal from 'sweetalert';
import $ from 'jquery';

function bindSweetAlertButtonDemo() {
  const swalButton = document.querySelectorAll('.sweet-alert-demo');
  if (swalButton) {
    swalButton.forEach(function(button) {
      button.addEventListener('click', (e) => {
        var point = $(e.currentTarget).parents('form').find('.card-item')[0].dataset.points;
        swal({
          icon: 'https://cdn.dribbble.com/users/1315300/screenshots/3556675/untitled-1.gif',
          iconHeight: 100,
          title: `You won ${point} points`,
          text: "Youhou, you did great!",
          // icon: "success",
          timer: 30000,
        });
      });
    }) // protect other pages
  }
}

export { bindSweetAlertButtonDemo };

