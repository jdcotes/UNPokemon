<html>
<head><title>Check</title></head>
<%@ page import="java.sql.*" %>
<body>
<%          
                        
            String username= (String) session.getAttribute("thename");
            String idpok= (String) session.getAttribute("idpoke");
            String level= (String) session.getAttribute("theLevel");
            String tipo= (String) session.getAttribute("Tipo");
            String name= (String) session.getAttribute("Pokename");
            String lati= (String) session.getAttribute("theLati");
            String longi= (String) session.getAttribute("theLongi");
            int idplayer= 0;
            String[] a= new String[2];
            int i=0;

            out.println(idpok);
            out.println(level);
            out.println(tipo);
            out.println(name);
            out.println(lati);
            out.println(longi);
            out.println(idplayer);
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/unpokemon","root","1234");

            Statement instruccion = conexion.createStatement();

            ResultSet pokeattacks = instruccion.executeQuery("SELECT * FROM unpokemon.attacks where Types='"+tipo+"'"  );

            while(pokeattacks.next()){
                  if(i<2){
                  a[i]=pokeattacks.getString("Attack");
                  i=i+1;
               }
            }

            ResultSet pokeplayer = instruccion.executeQuery("SELECT * FROM unpokemon.jugadores where Username='"+username+"'"  );

                              while(pokeplayer.next()){
                              idplayer=pokeplayer.getInt("IDPlayer");
                              }
                             String juga = "jugador"+idplayer;


            String pokecaught = "INSERT INTO unpokemon."+juga+" \n" +
                              "(`Caughts`,\n" +
                              "`IDpkcaught`,\n" +
                              "`Attack1`,\n" +
                              "`Attack2`,\n" +
                              "`level`)\n" +
                              "VALUES\n" +
                              "(null,\n" +
                              "'"+idpok+"',\n" +
                              "'"+a[1]+"',\n" +
                              "'"+a[0]+"',\n" +
                              "'"+level+"');";
            PreparedStatement preparedStmt = conexion.prepareStatement(pokecaught);
            preparedStmt.execute();

            String pokeupdate = "update pokemap set flag='1' where Latitud='"+lati+"' and Longitud='"+longi+"'";
            PreparedStatement preparedStmt2 = conexion.prepareStatement(pokeupdate);
            preparedStmt2.execute();


            String redirectURL = "main.jps";
            response.sendRedirect(redirectURL);
            


            conexion.close();


 

%>
</body>
</html>