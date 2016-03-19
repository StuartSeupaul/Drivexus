function initMap(){
  var mapPlaceHolder = $('#map');
  var latLong = {lat: mapPlaceHolder.data('latitude'), lng: mapPlaceHolder.data('longitude')};
  var map = new google.maps.Map(mapPlaceHolder[0],{
    center: {lat: 43.653908, lng: -79.384293},
    zoom: 12,
  fullscreenControl: true,
  });

  var marker = new google.maps.Marker({
    position: latLong,
    map: map,
    animation: google.maps.Animation.DROP
  });
}
