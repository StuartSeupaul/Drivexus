// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on("ready page:load", function(){
  $(function() {
    $('#appointment_date').datepicker({dateFormat: "yy-mm-dd"})

  });
console.log("experiement")
  $('#nearby-drivers').on('click', function(e) {
    e.preventDefault();

    if("geolocation" in navigator)  {
      navigator.geolocation.getCurrentPosition(itWorked, itDidNotWork);
    }
  })

function itWorked(position){
  var lat = position.coords.latitude;
  var lon = position.coords.longitude;

  $.ajax({
    url: '/drivers',
    method: 'get',
    data: {latitude: lat, longitude: lon},
    dataType: 'script'
  })

}

function itDidNotWork(error){
  console.log(error.message);
}

})
