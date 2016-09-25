<%
   String nombre = request.getParameter( "nombre" );
   String apellido = request.getParameter( "apellido" );
   String cedula = request.getParameter( "cedula" );
   String direccion = request.getParameter( "direccion" );
   String ciudad = request.getParameter( "ciudad" );
   String departamento = request.getParameter( "departamento" );
   String sexo = request.getParameter( "sexo" );
%>
<html>
  <%@ page pageEncoding= "UTF-8" %>
  <head>
    <title>Insertar en DB</title>
  </head>
  <body>

    <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
    <%
   	  try{
  	   Class.forName("com.mysql.jdbc.Driver");
  	   Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/tienda","root","1234");
  	   Statement instruccion = conexion.createStatement();
  	   int val = instruccion.executeUpdate("INSERT clientes VALUES('"+nombre+"','"+apellido+"','"+cedula+"','"+direccion+"','"+ciudad+"','"+departamento+"','"+sexo+"')");
  	%>  
    <form> 
      Inscripción realizada. 
    </form>
    <%  
      }
      catch(Exception e){
        out.println("ERROR! "+e.getMessage());
    %>
    <form> 
      Inscripción no realizada. 
    </form> 
    <% 
      }
    %>
    <form method=post action="index1.jsp"> 
      <input type=submit value="Volver">
    </form>

  </body>
</html>
