import $ from 'jquery';

function plantChoice() {
  document.querySelectorAll('.selected-plant').forEach((selected) => {
    selected.addEventListener("click", function (e) {
      document.querySelectorAll('.active').forEach((selected) => {
        selected.classList.remove("active");
      });
      e.currentTarget.classList.toggle("active");
      const name = this.querySelector('h4').innerHTML

      $("#div_plant_name").html(`<img src="${$(this).attr('data-url')}"><span>${name}</span>`);

      setTimeout(() => {

        $('#myModal').modal('hide');
      }, 400)
    });
  });
}

export { plantChoice };
