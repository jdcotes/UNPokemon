<html>
<head><title>Check</title></head>
<%@ page import="java.sql.*" %>
<body>
<%          
                        

            String name= (String) session.getAttribute("thename");

		    Class.forName("com.mysql.jdbc.Driver");
            //Crear el objeto de conexion a la base de datos
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/unpokemon","root","1234");            //Crear objeto Statement para realizar queries a la base de datos
            Statement instruccion = conexion.createStatement();
            //Un objeto ResultSet, almacena los datos de resultados de una consulta


            
            String juga= (String) session.getAttribute("thejuga");
            
            
            String createjuga= "CREATE TABLE unpokemon."+juga+" (\n" +
                    "  `Caughts` INT NOT NULL AUTO_INCREMENT,\n" +
                    "  `IDpkcaught` INT NOT NULL,\n" +
                    "  `Attack1` VARCHAR(45) NOT NULL,\n" +
                    "  `Attack2` VARCHAR(45) NOT NULL,\n" +
                    "  `level` VARCHAR(45) NOT NULL,\n" +
                    "  PRIMARY KEY (`Caughts`),\n" +
                    "  INDEX `idpk_idx` (`IDpkcaught` ASC),\n" +
                    "  CONSTRAINT `idpk`\n" +
                    "    FOREIGN KEY (`IDpkcaught`)\n" +
                    "    REFERENCES `unpokemon`.`Pokedex` (`IDPokemon`)\n" +
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