import $ from 'jquery';

function plantChoice() {
  document.querySelectorAll('.selected-plant').forEach((selected) => {
    selected.addEventListener("click", function (e) {
      document.querySelectorAll('.active').forEach((selected) => {
        selected.classList.remove("active");
      });
      e.currentTarget.classList.toggle("active");
      const name = this.querySelector('h4').innerHTML;
      const selectPlant = document.getElementById('div_plant_name');
      selectPlant.style.backgroundImage = `url('${e.currentTarget.dataset.url}')`;
      selectPlant.innerText = '';

      setTimeout(() => {

        $('#myModal').modal('hide');
      }, 400)
    });
  });
}

export { plantChoice };
