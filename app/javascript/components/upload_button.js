function fireUploadButton () {
  const fakeButton = document.getElementById('upload-fake-btn');
  fakeButton.addEventListener("click", (e) => {
    e.preventDefault();

  const targetedButton = document.getElementById('pot_photo');
  targetedButton.click();
  });
};

export { fireUploadButton };
