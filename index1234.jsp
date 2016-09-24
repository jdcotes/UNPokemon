
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="initial-scale=1.0">
    <style>
      html,body {
        height: 100%;
        margin: 0 auto;
        padding: 0;
      } 
      #map {
        height: 600px;
        width: 800px;
      }
    </style>
  <title>Prueba Pokemon GO</title>

  <script type="text/javascript">
    var intervalo;
    var map;
    var entro = 0;
    var myLatLng;
    var myLatLng1;
    var marker;
    var marker1;
    var latold = 0;
    var lngold = 0;
    var map2;
    var lowlng;
    var highlng; 
    var resultlng; 
    var lowlat;
    var highlat;
    var resultlat; 
    var id;
    var a = 0;

    var lat,lng,lat1,lng1;

    intevalo1 = setInterval('CurrentPosition()',5000);
    intervalo2 = setInterval('drawpokemonmarker()',5000);

    function CurrentPosition(){
      navigator.geolocation.getCurrentPosition(onSuccessGeolocating, onErrorGeolocating,{enableHighAccuracy: true,maximumAge:5000,timeout:10000});
    }

    function onSuccessGeolocating(position){
      lat = position.coords.latitude;
      lng = position.coords.longitude;
      
      if ((Math.abs(lat-latold)>0.001) || (Math.abs(lng-lngold)>0.001)){
        myLatLng = new google.maps.LatLng(lat,lng);
      }

      if (entro == 0){
       initMap();
      }
      
      if (entro==0){
       marker = new google.maps.Marker({
       position: myLatLng,
       map: map2,             //Idea colocar nombre ususario.
       });
        entro = 1;
      }

     drawmarkertrainer();
    }

    function onErrorGeolocating(position){
      alert("No se adquirieron datos");
    }


    function initMap() {
      map2 = new google.maps.Map(document.getElementById('map'), {
       zoom: 17,
       center: myLatLng
      });
    }

    function drawmarkertrainer(){
      
      marker.setMap(null);
      var image = 'Marcadores/Pokemarker.png';
      marker = new google.maps.Marker({
       position: myLatLng,
       map: map2,
       icon: image   //Idea colocar nombre ususario.
      });
    }
    function random(){
      var maxid = 11;
      var minid = 1;
      var flag = 0;
      id = Math.random()*(maxid-minid)+minid;
      //LAMAR BASE DE DATOS NOMBRE IMAGEN A DIBUJAR 
      lowlng = -74.851759;
      highlng = -74.849201;
      resultlng = Math.random()*(highlng-lowlng) + lowlng;
      lowlat = 11.017249;
      highlat = 11.020972;
      resultlat = Math.random()*(highlat-lowlat) + lowlat;
      $.post("server/vivoh.php",{latb: resultlat, lngb: resultlng, idb: id,flagb: flag},function(){});
      //ESCRIBIR EN BASE ID POKEMON  LATITUD Y LONGITUD  
    }
    function drawpokemonmarker(){

      random();
      
      lat1 = resultlat;
      lng1 = resultlng;
      var image = 'Marcadores/pikachu.png';
      myLatLng1 = new google.maps.LatLng(lat1,lng1);
      marker1 = new google.maps.Marker({
        position: myLatLng1,
        map: map2,
        icon: image   
      });
      intervalo3 = setInterval('erasemarker()',10000);
      console.log("estoy entrando");
      }

      function erasemarker(){
        marker1.setMap(null);
      }
    </script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsFelqvBHeiBZ9KEmCJ31cVXQjdo0aASk"  async defer></script>
</head>
<body>
<center>
<font face="helvetica">
 

<br>
<br>
<td > <center id='map'></center> </td>
</font>
</center>

</body>
</html> 