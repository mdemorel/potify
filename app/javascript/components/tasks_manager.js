import $ from 'jquery';

function updateTaskStatus() {
  const selector = document.querySelectorAll(".pot-tasks form input[type=checkbox]")

  if (selector) {
    selector.forEach(function(selector) {
      selector.addEventListener("change", function(e) {
        $(e.currentTarget).parents('form').find('.submit-task').trigger('click');
        // e.currentTarget.parentElement.parentElement.parentElement.dispatchEvent("submit");
    });
   });
  }
}

export { updateTaskStatus };
