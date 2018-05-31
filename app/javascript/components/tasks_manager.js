function updateTaskStatus() {
  const selector = document.querySelectorAll(".pot-tasks form input[type=checkbox]")

  if (selector) {
    selector.forEach(function(selector) {
      selector.addEventListener("change", function(e) {
      e.currentTarget.parentElement.parentElement.parentElement.submit();
    });
   });
  }
}

export { updateTaskStatus };
