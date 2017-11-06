document.addEventListener("DOMContentLoaded", function(){
  const element = document.getElementById("mycanvas");
  element.width = 500;
  element.height = 500;
  const context = element.getContext("2d");

  context.fillStyle = "orange";
  context.fillRect(255, 255, 255, 255);

  context.beginPath();
  context.arc(150, 150, 40, 0, 2 * Math.PI, true);
  context.strokeStyle = "purple";
  context.lineWidth = 5;
  context.stroke();
  context.fillStyle = "yellow";
  context.fill();

  context.beginPath();
  context.fillStyle = "green";
  context.moveTo(75, 50);
  context.lineTo(100, 75);
  context.lineTo(100, 25);
  context.fill();
});
