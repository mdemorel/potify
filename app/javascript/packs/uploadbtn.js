uploadBtn = document.getElementById('upload-btn');

function updateText() {
  console.log(this.firstChild);
  this.firstChild.textContent = 'File well uploaded';
}

uploadBtn.addEventListener('change', updateText);


