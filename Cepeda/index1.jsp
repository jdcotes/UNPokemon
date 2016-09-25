<HTML>
<%@ page pageEncoding= "UTF-8" %>
<body>
	<p>
	<form method=post action="index2.jsp">
		<table>
			<caption>Inscripción Cliente</caption>
			<tr>
				<td>
					Nombre: 
				</td>
				<td>
					<input type=text name=nombre size=20>
		        </td>		
			</tr>
			<tr>
		    	<td>
					Apellido: 
				</td>
				<td>	
					<input type=text name=apellido size=20>
				</td>
			</tr>
			<tr>
				<td>
					Cédula: 	
				</td>
				<td>	
					<input type=int name=cedula size=20>
				</td>
			</tr>
			<tr>
				<td>
					 Dirección: 	
				</td>
				<td>	
					<input type=text name=direccion size=20>
				</td>
			</tr>
						<tr>
				<td>
					 Ciudad: 	
				</td>
				<td>	
					<input type=text name=ciudad size=20>
				</td>
			</tr>
						<tr>
				<td>
					 Departamento: 	
				</td>
				<td>	
					<input type=text name=departamento size=20>
				</td>
			</tr>
						<tr>
				<td>
					 Sexo: 	
				</td>
				<td>	
					<input type=text name=sexo size=20>
				</td>
			</tr>
	    </table>
		<p>
		<input type=submit value="Inscribir">
	</form>
	<form method=post action="index3.jsp">
		<input type=submit value="Genero mas comprador">
	</form>
	
</body>
</HTML>