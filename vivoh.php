<?php
  $server = "localhost";
  $username = "root";
  $password = "1234";
  $database = "unpokemon";
  $con = @mysql_connect($server,$username,$password) or die("No se encontró el servidor");
  mysql_select_db($database,$con)or die("No se encontró la base de datos");
  

  $sql = "SELECT * FROM  `Pokedex`";
  // "INSERT INTO Pokemap('IDPok', 'Level', 'Attack 1', 'Attack 2', 'Latitud', 'Longitud', 'Flag') VALUES('$_POST[idb]','50', '0', '0', '$_POST[latb]', '$_POST[lngb]','0') ";
  $ejecutar_sql1=mysql_query($sql) or die("Problemas en consulta: ".mysql_error());
  
  $tabla=array();
  $i=0;

    while($reg=mysql_fetch_array($ejecutar_sql1)){  
      $tabla[$i]=$reg;
      $i++;
    }

  echo json_encode($tabla);
  mysql_free_result($ejecutar_sql1);
  mysql_close($con);

?>