let videoStream;

function startQrScanner() {
  document.getElementById("reader").classList.remove("d-none");
  document.getElementById("qrResult").classList.add("d-none");
  const qrCodeSuccessCallback = (decodedText) => {
    document.getElementById("qrResult").value = decodedText;
    document.getElementById("reader").classList.add("d-none");
  };
  const html5QrCode = new Html5Qrcode("reader");
  html5QrCode.start({ facingMode: "environment" }, { fps: 10 }, qrCodeSuccessCallback);
}

function toggleCableFields() {
  const categoria = document.getElementById("categoria").value;
  const cableFields = document.getElementById("cableFields");
  cableFields.classList.toggle("d-none", categoria !== "cables");
}

function startCamera() {
  const video = document.getElementById("cameraView");
  const canvas = document.getElementById("cameraCanvas");
  video.classList.remove("d-none");
  canvas.classList.add("d-none");
  if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
    navigator.mediaDevices.getUserMedia({ video: true }).then((stream) => {
      videoStream = stream;
      video.srcObject = stream;
    });
  }
}

function capturePhoto() {
  const video = document.getElementById("cameraView");
  const canvas = document.getElementById("cameraCanvas");
  const context = canvas.getContext("2d");
  canvas.width = video.videoWidth;
  canvas.height = video.videoHeight;
  context.drawImage(video, 0, 0, canvas.width, canvas.height);
  videoStream.getTracks().forEach((track) => track.stop());
  video.classList.add("d-none");
  canvas.classList.remove("d-none");
}

function selectFromGallery() {
  document.getElementById("fotoElemento").click();
}

function displaySelectedImage(event) {
  const file = event.target.files[0];
  const preview = document.getElementById("previewImage");
  const reader = new FileReader();
  reader.onload = () => {
    preview.src = reader.result;
    preview.classList.remove("d-none");
  };
  reader.readAsDataURL(file);
}
