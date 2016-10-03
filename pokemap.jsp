
<!DOCTYPE HTML>
<html class="no-js">
<head>
  <meta charset="utf-8" />
  <%@ page pageEncoding= "UTF-8" %>
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
  <title>Pokemon GO</title>
  <%@ page import="java.sql.*" %>
  <%@ page import= "java.util.*"%>
  <%
    int maxid = 11;
    int minid = 1;
    int id = 3;
    int i = 0;
    int counter = 0;
    int counter2 = 0;
    String prueba = "";
    double lowlng = -74.851759;
    double highlng = -74.849201;
    double resultlng = 0;
    double lowlat = 11.017249;
    double highlat = 11.020972;
    double resultlat = 0;
    String[] pokeicon =new String[5];
    double[] arraylat = new double[5];
    double[] arraylng = new double[5];
    String[] pokeid = new String[5];
  %>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
  <!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsFelqvBHeiBZ9KEmCJ31cVXQjdo0aASk"  async defer></script>-->
 <% 
      try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/unpokemon","root","1234");
        Statement instruccion = conexion.createStatement();
        
        ResultSet tabla = instruccion.executeQuery("SELECT Latitud, Longitud,IDPok FROM pokemap WHERE Flag = 0");
        for(counter=0;tabla.next();counter++)
        {
        arraylat[counter]=Double.parseDouble(tabla.getString(1));
        arraylng[counter]=Double.parseDouble(tabla.getString(2));
        pokeid[counter]=(tabla.getString(3));
        }
        for (counter2=0;counter2<counter;counter2++){
        ResultSet tabla1 = instruccion.executeQuery("SELECT Image FROM pokedex WHERE IDPokemon = "+pokeid[counter2]+"");
        while (tabla1.next())
        pokeicon[counter2]=tabla1.getString(1);
        }

      
        conexion.close();
      } 
      catch(ClassNotFoundException e){ out.println(e); }
      catch(SQLException e){ out.println(e); }
      catch(Exception e){ out.println(e); }

    if (counter==0){
      for (int index = 0; index < 5; index ++ ){
        try {
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/unpokemon","root","1234");
          Statement instruccion = conexion.createStatement();
                     
          Random r = new Random();  
          id = r.nextInt(maxid-minid)+minid;
          resultlng = Math.random()*(highlng-lowlng) + lowlng;
          resultlat = Math.random()*(highlat-lowlat) + lowlat;
          int val = instruccion.executeUpdate("INSERT INTO `unpokemon`.`pokemap`(`IDPok`,`Latitud`,`Longitud`,`Flag`)VALUES('"+id+"','"+resultlat+"','"+resultlng+"','0');");
          
          ResultSet tabla = instruccion.executeQuery("SELECT Image FROM pokedex WHERE IDPokemon = "+id+"");
          while(tabla.next())
          pokeicon[index] = tabla.getString(1);
          arraylat[index] = resultlat;
          arraylng[index] = resultlng;   
          counter=5;  
          
          conexion.close();
        } 
        catch(ClassNotFoundException e){ out.println(e); }
        catch(SQLException e){ out.println(e); }
        catch(Exception e){ out.println(e); }

      }
    }


 %>
  <script type="text/javascript" >
    var intervalo;
    var map;
    var myLatLng;
    var myLatLng1;
    var marker;
    var marker1;
    var marker1old;
    var marker2;
    var marker3;
    var marker4;
    var marker5;
    var icono;
    var a = 1;
    var lat1;
    var lng1;
    var lat2;
    var lng2;
    var lat3;
    var lng3;
    var lat4;
    var lng4;
    var lat5;
    var lng5;
    var markers=[];

    drawpokemonmarker();

    console.log(marker);
    function drawpokemonmarker(){

        lat1 = <%= arraylat[0]%>;
        lng1 = <%= arraylng[0]%>;
        lat2 = <%= arraylat[1]%>;
        lng2 = <%= arraylng[1]%>;
        lat3 = <%= arraylat[2]%>;
        lng3 = <%= arraylng[2]%>;
        lat4 = <%= arraylat[3]%>;
        lng4 = <%= arraylng[3]%>;
        lat5 = <%= arraylat[4]%>;
        lng5 = <%= arraylng[4]%>;

        if (<%= counter%>==1){
          var image = "Marcadores/".concat("<%= pokeicon[0]%>");
          myLatLng1 = new google.maps.LatLng(lat1,lng1);
          marker1 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker1);
        }

        if (<%= counter%>==2){
          var image = "Marcadores/".concat("<%= pokeicon[0]%>");
          myLatLng1 = new google.maps.LatLng(lat1,lng1);
          marker1 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker1);
          var image = "Marcadores/".concat("<%= pokeicon[1]%>");
          myLatLng1 = new google.maps.LatLng(lat2,lng2);
          marker2 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker2);
        }

        if (<%= counter%>==3){
          var image = "Marcadores/".concat("<%= pokeicon[0]%>");
          myLatLng1 = new google.maps.LatLng(lat1,lng1);
          marker1 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker1);
          var image = "Marcadores/".concat("<%= pokeicon[1]%>");
          myLatLng1 = new google.maps.LatLng(lat2,lng2);
          marker2 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker2);
          var image = "Marcadores/".concat("<%= pokeicon[2]%>");
          myLatLng1 = new google.maps.LatLng(lat3,lng3);
          marker3 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker3);
        }

        if (<%= counter%>==4){
          var image = "Marcadores/".concat("<%= pokeicon[0]%>");
          myLatLng1 = new google.maps.LatLng(lat1,lng1);
          marker1 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker1);
          var image = "Marcadores/".concat("<%= pokeicon[1]%>");
          myLatLng1 = new google.maps.LatLng(lat2,lng2);
          marker2 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker2);
          var image = "Marcadores/".concat("<%= pokeicon[2]%>");
          myLatLng1 = new google.maps.LatLng(lat3,lng3);
          marker3 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker3);
          var image = "Marcadores/".concat("<%= pokeicon[3]%>");
          myLatLng1 = new google.maps.LatLng(lat4,lng4);
          marker4 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker4);
          console.log("hey");
        }
        if (<%= counter%>==5){
          var image = "Marcadores/".concat("<%= pokeicon[0]%>");
          myLatLng1 = new google.maps.LatLng(lat1,lng1);
          marker1 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker1);
          var image = "Marcadores/".concat("<%= pokeicon[1]%>");
          myLatLng1 = new google.maps.LatLng(lat2,lng2);
          marker2 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker2);
          var image = "Marcadores/".concat("<%= pokeicon[2]%>");
          myLatLng1 = new google.maps.LatLng(lat3,lng3);
          marker3 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker3);
          var image = "Marcadores/".concat("<%= pokeicon[3]%>");
          myLatLng1 = new google.maps.LatLng(lat4,lng4);
          marker4 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker4);
          var image = "Marcadores/".concat("<%= pokeicon[4]%>");
          myLatLng1 = new google.maps.LatLng(lat5,lng5);
          marker5 = new google.maps.Marker({
            position: myLatLng1,
            map: map2,
            icon: image   
          });
          markers.push(marker5);
        }

        var markersold=markers;
        console.log(markers);
    }
    intervalo3 = setInterval('undrawpokemonmarker()',240000);
    var auto_refresh1 = setInterval(function (){$('#map').load('erasemap.jsp').fadeIn("slow");}, 240000);
    function undrawpokemonmarker()
    {
      for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
    }
    
    }
</script>
</head>
<body>
<center>
<font face="helvetica">
<td > <center id='map'></center> </td>
</font>
</center>

</body>
</html> 