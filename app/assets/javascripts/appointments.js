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

      $('.drivers-address-latitude').each(function(idx, elm) {
        var marker = new google.maps.Marker({
          position: {
            lat: parseFloat($($('.drivers-address-latitude')[idx]).text().trim()) ,
            lng: parseFloat($($('.drivers-address-longitude')[idx]).text().trim())
          },
          map: window.map,
          animation: google.maps.Animation.DROP
        });
      });

      $('.show-appointment').click(function(){
        $('#appointment_driver_id').val(parseInt($(this).attr('data-collect')))

      });

      $('.show-drivers').on('click','.show-appointment',function () {
        $(this).parent().find('.show-appointment').css('background-color', '#ffffff');
        $(this).css({
          'background-color': 'rgb(75, 182, 210)',
          'font-weight':' bolder'
        });
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
