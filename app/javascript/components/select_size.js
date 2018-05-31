const potsSize = document.querySelectorAll('.select-size');
potsSize.forEach(function(pot) {
  pot.addEventListener("click", (event) => {
    const recipientSize = document.getElementById('pot_recipient_size');
    recipientSize.value = event.currentTarget.dataset.size;
  });
});

// exporter function
// export { selectSize };
