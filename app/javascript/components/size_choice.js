function sizeChoice() {
  document.querySelectorAll('.select-size').forEach((selected) => {
    selected.addEventListener("click", (e) => {
      document.querySelectorAll('.select-size').forEach((selected) => {
        selected.classList.remove("active");
      });
      e.currentTarget.classList.toggle("active");
    });
  });
}

export { sizeChoice };
