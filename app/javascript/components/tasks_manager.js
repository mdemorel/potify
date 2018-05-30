function updateTaskStatus() {
  const selector = document.querySelector(".pot-tasks form input[type=checkbox]")

  if (selector) {
    selector.addEventListener("change", function(e) {
      e.currentTarget.parentElement.parentElement.parentElement.submit();
    });
  }
}

export { updateTaskStatus };
