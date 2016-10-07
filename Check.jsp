<html>
<head><title>Check</title></head>
<%@ page import="java.sql.*" %>
<body>
<%          
                        
            String name = request.getParameter( "username" );
            session.setAttribute( "thename", name );
            String passw = request.getParameter( "password" );
            session.setAttribute( "thepass", passw );
            String user="";
            String pass="";
			Class.forName("com.mysql.jdbc.Driver");
            //Crear el objeto de conexion a la base de datos
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/unpokemon","root","1234");
            //Crear objeto Statement para realizar queries a la base de datos
            Statement instruccion = conexion.createStatement();
            //Un objeto ResultSet, almacena los datos de resultados de una consulta

            ResultSet tabla = instruccion.executeQuery("SELECT * FROM unpokemon.jugadores where Username='"+name+"'" );


            while(tabla.next()){
            user=tabla.getString("Username");
            pass=tabla.getString("Password");}
            
            if(pass.equals(passw)){
            String redirectURL = "db.jsp";
            response.sendRedirect(redirectURL);
            }
            else{
            String redirectURL = "index.html";
            response.sendRedirect(redirectURL);
            }


            conexion.close();



%>
</body>
</html>