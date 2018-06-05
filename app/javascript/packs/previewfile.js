function previewFile(e) {

  var preview = document.querySelector('.image-preview');
  var file    = document.querySelector('.form-pots input[type=file]').files[0];
  var reader  = new FileReader();

  reader.addEventListener("load", function () {
    preview.src = reader.result;
  }, false);

  if (file) {
    reader.readAsDataURL(file);
  }
}
if (document.querySelector('.form-pots input[type=file]')) {
  document.querySelector('.form-pots input[type=file]').onchange = previewFile;

}

