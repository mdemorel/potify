// import $ from 'jquery';

function updateTaskStatus() {

  const dashboard = document.querySelector("#dashboard-content");
  if (dashboard) {
    dashboard.addEventListener("click", function (e) {
      if (e.target.classList.value.includes("form-check-input")) {
        e.target.parentElement.parentElement.parentElement.querySelector('.submit-task').click();
      }
    })
  }
  // const selector = document.querySelectorAll(".pot-tasks form input[type=checkbox]")

  // if (selector) {
  //   selector.forEach(function(selector) {
  //     selector.addEventListener("change", function(e) {
  //       $(e.currentTarget).parents('form').find('.submit-task').trigger('click');
  //       // e.currentTarget.parentElement.parentElement.parentElement.dispatchEvent("submit");
  //   });
  //  });
  // }
}

export { updateTaskStatus };
