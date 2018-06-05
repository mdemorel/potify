// import $ from 'jquery';

function updateTaskStatus() {

  const dashboard = document.querySelectorAll(".card-item");

  if (dashboard) {
    dashboard.forEach(function(item) {
      item.addEventListener("click", function (e) {
        if (e.currentTarget.classList.value.includes("card-item")) {
          e.currentTarget.parentElement.parentElement.parentElement.querySelector('.submit-task').click();
        }
      })
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

function updateTaskStatusOnShow() {

  const content = document.querySelector("#container-pot-show");
  if (content) {
    content.addEventListener("click", function (e) {
      if (e.target.classList.value.includes("form-check-input")) {
        e.target.parentElement.parentElement.parentElement.querySelector('.submit-task').click();
      }
    })
  }
}

global.updateTaskStatus = updateTaskStatus;

export { updateTaskStatus };

export { updateTaskStatusOnShow };
