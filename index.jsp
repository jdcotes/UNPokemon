<HTML>
<HEAD>
<TITLE>Hola Mundo!</TITLE>
</HEAD>
<BODY>
<%@ page import="java.sql.*" %>
<%

        try {
            Class.forName("com.mysql.jdbc.Driver");
            //Crear el objeto de conexion a la base de datos
            Connection conexion = 
                    DriverManager.getConnection("jdbc:mysql://localhost/tienda","root","1234");
            //Crear objeto Statement para realizar queries a la base de datos
            Statement instruccion = conexion.createStatement();
            //Un objeto ResultSet, almacena los datos de resultados de una consulta

            
            ResultSet tabla = instruccion.executeQuery("SELECT Sexo, sum(Cantidad) as Articulos\n" +
			"FROM tienda.compra, tienda.clientes, tienda.productos\n" +
			"WHERE Producto = idProductos \n" +
			"AND cedula = Clientecompra GROUP BY Sexo ORDER BY Articulos DESC LIMIT 0,1;");
            
            /*System.out.println("Nombre\tApellido\tSexo\tProducto\tCantidad\tPreciou");*/
            while(tabla.next())
            out.println("El sexo que mas compró fue:"+"\t"+tabla.getString(1)+"\tya que compraron"+"\t"+tabla.getString(2)+"\tArticulos");
            
            
            conexion.close();
	        }

	catch(ClassNotFoundException e){ out.println(e); }
	catch(SQLException e){ out.println(e); }
	catch(Exception e){ out.println(e); }
%>

</BODY>
</HTML>
