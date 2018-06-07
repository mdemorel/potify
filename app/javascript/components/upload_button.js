function fireUploadButton () {
  const fakeButton = document.getElementById('upload-fake-btn');
  fakeButton.addEventListener("click", (e) => {
    e.preventDefault();
    console.log(e);

  const event = new Event('click');
  const targetedButton = document.getElementById('pot_photo');
  targetedButton.click();
  });
};

export { fireUploadButton };
