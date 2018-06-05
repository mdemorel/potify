function tabs() {
  document.querySelectorAll(".tabs a").forEach((tab) => {
    tab.addEventListener("click", (event) => {
      document.querySelectorAll(".tabs-container > div").forEach((div) => {
        div.classList.add("hidden");
      })
      document.querySelectorAll('.active').forEach((selected) => {
        selected.classList.remove("active");
      })
      event.currentTarget.classList.toggle("active");
      const targetName = tab.dataset.tabName
      const target = document.querySelector(`[data-target="${targetName}"]`)
      target.classList.remove("hidden");
    })
  })
}

export {tabs}
