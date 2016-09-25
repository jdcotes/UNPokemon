<%
    String compra = "";
    String cantidad = "";
    String genero = ""; 
    String genero1 = "M";
%>
<html>
    <%@ page pageEncoding= "UTF-8" %>
    <head>
        <title>Género mas comprador</title>
    </head>
    <body>

        <%@ page import="java.sql.*" %>
        <%

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    //Crear el objeto de conexion a la base de datos
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/tienda","root","1234");
                    //Crear objeto Statement para realizar queries a la base de datos
                    Statement instruccion = conexion.createStatement();
                    //Un objeto ResultSet, almacena los datos de resultados de una consulta

                    
                    ResultSet tabla = instruccion.executeQuery("SELECT Sexo, sum(Cantidad) as Articulos\n" +
        			"FROM tienda.compra, tienda.clientes, tienda.productos\n" +
        			"WHERE Producto = idProductos \n" +
        			"AND cedula = Clientecompra GROUP BY Sexo ORDER BY Articulos DESC LIMIT 0,1;");
                    
                    while(tabla.next())
                    if (tabla.getString(1).equals(genero1)){
                        genero = "hombres";
                        compra = tabla.getString(2);
                        out.println("Los"+"\t"+genero+"\tcompraron"+"\t"+compra+"\tArtículos");    
                    }
                    else{
                        genero = "mujeres";
                        compra = tabla.getString(2);
                        out.println("Las"+"\t"+genero+"\tcompraron"+"\t"+compra+"\tArtículos");
                    }                     
                    conexion.close();
        	        }

        	catch(ClassNotFoundException e){ out.println(e); }
        	catch(SQLException e){ out.println(e); }
        	catch(Exception e){ out.println(e); }
        %>
        <form method=post action="index1.jsp">
            <input type=submit value="Volver">
        </form>

    </body>
</html>
