console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  url: 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b',
  type: 'GET',
  success: callback
});

function callback(data) {
  console.log(data);
}

// Add another console log here, outside your AJAX request
console.log("Collecting weather from openweathermap.org...");
