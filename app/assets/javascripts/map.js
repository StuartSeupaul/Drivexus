function initMap(){
  var mapPlaceHolder = $('#map');
  window.map = new google.maps.Map(mapPlaceHolder[0],{
    center: {lat: 43.653908, lng: -79.384293},
    zoom: 12,
  fullscreenControl: true,
  });


}
