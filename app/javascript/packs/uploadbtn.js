uploadBtn = document.getElementById('upload-btn');

function updateText() {
  this.firstChild.textContent = 'File well uploaded';
}

uploadBtn.addEventListener('change', updateText);


