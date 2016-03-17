// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on("ready page:load", function(){
  $(function() {
    $('#date_').datepicker({dateFormat: "yy-mm-dd"})

  });


  $('#nearby-drivers').on('click', function(e) {
    e.preventDefault();

    moveValue();


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
    dataType: 'script',
    complete: function () {

      $('.show-appointment').click(function(){
        console.log("experiment")
        $('#appointment_driver_id').val(parseInt($(this).attr('data-collect'))) 

      });
    }
  })

}

function itDidNotWork(error){
  console.log(error.message);
}


$('#drivers-by-address').on('click', function() {

  moveValue();
});






function moveValue() {
  $('#appointment_date').val($('#date_').val());

  $('#appointment_start_time_4i').val($('#start_time__4i').val());

  $('#appointment_end_time_4i').val($('#end_time__4i').val());

  $('#appointment_address').val($('#address').val());


}

})
