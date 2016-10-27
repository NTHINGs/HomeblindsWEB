<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="css/dialogo.css" media="screen" title="no title" charset="utf-8">
<%
try {
  String usuario = request.getParameter("usuario");
  String pass = request.getParameter("pass");
  Statement st=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeblinds?useServerPrepStmts=true","homeblinds", "12345").createStatement();
  st.executeUpdate("INSERT INTO usuarios (usuario, password) VALUES('"+usuario+"','"+pass+"')");
  st.close();
  %><h1 class="success">Usuario Insertado Correctamente</h1>
<a href="javascript:window.location.replace('admin.jsp');">&laquo; Volver atrás</a><%
} catch (Exception e) {
 %><h1>NO MINO <%e.printStackTrace(response.getWriter());%></h1><%
}%>
