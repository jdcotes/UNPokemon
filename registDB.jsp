<html>
<head><title>Check</title></head>
<%@ page import="java.sql.*" %>
<body>
<%          
                        
            String name = request.getParameter( "username" );
            session.setAttribute( "thename", name );
            String passw = request.getParameter( "password" );
            session.setAttribute( "thepass", passw );
            String team = request.getParameter( "team" );
            session.setAttribute( "theteam", team );
            int n =0;
		    Class.forName("com.mysql.jdbc.Driver");
            //Crear el objeto de conexion a la base de datos
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/unpokemon","root","1234");            //Crear objeto Statement para realizar queries a la base de datos
            Statement instruccion = conexion.createStatement();
            //Un objeto ResultSet, almacena los datos de resultados de una consulta

            String tabla = "INSERT INTO unpokemon.jugadores \n" +
                            "(`Username`, `Password`, `Team`) \n" +
                            "VALUES ('"+name+"', '"+passw+"', '"+team+"')";
            PreparedStatement preparedStmt = conexion.prepareStatement(tabla);
            preparedStmt.execute();

            ResultSet getid = instruccion.executeQuery("SELECT * FROM unpokemon.jugadores where Username='"+name+"'" );
            while(getid.next()){
            n = getid.getInt("IDPlayer");}
            
            String juga="jugador"+n;
            session.setAttribute("thejuga",juga);
            
            String constraintn="idpk"+n;

            
            String createjuga= "CREATE TABLE unpokemon."+juga+" (\n" +
                    "  `Caughts` INT NOT NULL AUTO_INCREMENT,\n" +
                    "  `IDpkcaught` INT NOT NULL,\n" +
                    "  `Attack1` VARCHAR(45) NOT NULL,\n" +
                    "  `Attack2` VARCHAR(45) NOT NULL,\n" +
                    "  `level` VARCHAR(45) NOT NULL,\n" +
                    "  PRIMARY KEY (`Caughts`),\n" +
                    "  INDEX `idpk_idx` (`IDpkcaught` ASC),\n" +
                    "  CONSTRAINT `"+constraintn+"`\n" +
                    "    FOREIGN KEY (`IDpkcaught`)\n" +
                    "    REFERENCES `unpokemon`.`pokedex` (`IDPokemon`)\n" +
                    "    ON DELETE NO ACTION\n" +
                    "    ON UPDATE NO ACTION)";
            PreparedStatement preparedStmt2 = conexion.prepareStatement(createjuga);
            preparedStmt2.execute();

            
            String redirectURL = "index.html";
            response.sendRedirect(redirectURL);




            conexion.close();



%>
</body>
</html>