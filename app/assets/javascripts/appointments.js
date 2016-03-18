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

  $('#drivers-by-address').on('click', function(e){
    e.preventDefault();
    itWorked();
  })

function itWorked(position) {
  var data;

  if (position) {
    data = {
      latitude: position.coords.latitude,
      longitude: position.coords.longitude
    };
  } else {
    data = {
      date_: $('#date_').val(),
      start_time__4i: $('#start_time__4i').val(),
      start_time__5i: $('#start_time__5i').val(),
      end_time__4i: $('#end_time__4i').val(),
      end_time__5i: $('#end_time__5i').val(),
      address: $('#address').val(),
    };
  }

  $.ajax({
    url: '/drivers',
    method: 'get',
    data: data,
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
