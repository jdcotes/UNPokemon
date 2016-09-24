<HTML>
<HEAD>
<TITLE>Hola Mundo!</TITLE>
</HEAD>
<BODY>
<%
/*or ( int i = 0 ; i < 10 ; i ++ )*/
{
%>
Hola Mundo! Este es el saludo número <%=i%>.
<br>
<%
Random r = new Random();
Double Low = -74.851759;
Double High = -74.849201;
Double Result = Math.random()*(High-Low) + Low;
out.println(Result);
}
%>
</BODY>
</HTML>
