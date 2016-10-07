<html>
<head><title>Check</title></head>
<%@ page import="java.sql.*" %>
<body>
<%          
                        
            
            String lati="";
            String longi="";
            Cookie cookie = null;
            Cookie[] cookies = null;
            // Get an array of Cookies associated with this domain
            cookies = request.getCookies();
            if( cookies != null ){
               out.println("<h2> Found Cookies Name and Value</h2>");
               for (int i = 0; i < cookies.length; i++){
                  cookie = cookies[i];
                  out.print("Name : " + cookie.getName( ) + ",  ");
                  out.print("Value: " + cookie.getValue( )+" <br/>");
                  if (cookie.getName().equals("lat"))
                  {
                     lati=cookie.getValue();
                  }
                  if (cookie.getName().equals("long"))
                  {
                     longi=cookie.getValue();
                  }
               }
            }else{
               out.println("<h2>No cookies founds</h2>");
            }
               out.println(lati);
               out.println(longi);
            String idpok="";
            String level="";
            String tipo="";
            String name="";
            Class.forName("com.mysql.jdbc.Driver");

            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/unpokemon","root","");

            Statement instruccion = conexion.createStatement();

            ResultSet query = instruccion.executeQuery("SELECT * FROM unpokemon.pokemap where Latitud='"+lati+"' and Longitud='"+longi+"'"  );
            
            while(query.next()){
            idpok=query.getString("IDPok");
            level=query.getString("Level");}

            ResultSet pokedex = instruccion.executeQuery("SELECT * FROM unpokemon.pokedex where IDPokemon='"+idpok+"'"  );

            while(pokedex.next()){
            name=pokedex.getString("Pokemon");
            tipo=pokedex.getString("Type");}

            session.setAttribute("idpoke",idpok);
            session.setAttribute("Pokename",name);
            session.setAttribute("Tipo",tipo);
            session.setAttribute("theLevel",level);
            session.setAttribute("theLati",lati);
            session.setAttribute("theLongi",longi);
            

            String redirectURL = "catch.jsp";
            response.sendRedirect(redirectURL);
            


            conexion.close();


 

%>
</body>
</html>