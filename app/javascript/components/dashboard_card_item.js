function triggerClick() {
  const cards = document.querySelectorAll(".card-task .card-item")
  if (cards) {
    cards.forEach((card) => {
      card.addEventListener("click", (event) => {
        card.querySelector("input").click();
      })
    })
  }
}

export {triggerClick};
