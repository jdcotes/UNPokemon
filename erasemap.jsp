<%
 String[] arraylat = new String[5];
 String[] arraylng = new String[5];
 int a = 0;
%>
<html>
<%@ page pageEncoding= "UTF-8" %>
<head>
    <title>EraseMapMarkers</title>
</head>
<body>
    <center>
        <%@ page import="java.sql.*" %>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/unpokemon","root","1234");
                Statement instruccion = conexion.createStatement();
     
                ResultSet tabla = instruccion.executeQuery("SELECT IDPok FROM unpokemon.pokemap where flag = 0");

                while(tabla.next()){
                arraylat[a]=tabla.getString(1);
                a=a+1;
                }
                
                conexion.close();
                
            }

            	catch(ClassNotFoundException e){ out.println(e); }
            	catch(SQLException e){ out.println(e); }
            	catch(Exception e){ out.println(e); }
            
            for (int i=0;i<5;i++){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/unpokemon","root","1234");
                Statement instruccion = conexion.createStatement();
     
                int val = instruccion.executeUpdate("UPDATE unpokemon.pokemap set Flag = 1 where IDPok = '"+arraylat[i]+"'");

                               
                conexion.close();
                
            }
                catch(ClassNotFoundException e){ out.println(e); }
                catch(SQLException e){ out.println(e); }
                catch(Exception e){ out.println(e); }
            }




            %>

            <script type="text/javascript">

                var lat=parseFloat(<%= arraylat[0]%>);
                var lon=parseFloat(<%= arraylng[0]%>);


            </script>
            <form method=post action="index1.jsp">
                <input type=submit value="Volver">
            </form>
        </center>
    </body>
</html>