<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="css/dialogo.css" media="screen" title="no title" charset="utf-8">
<%
try {
  String usuario = request.getParameter("usuario");
  String pass = request.getParameter("pass");
  String id=request.getParameter("id");
  if(!id.equals("0")){
    Statement st=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeblinds?useServerPrepStmts=true","homeblinds", "12345").createStatement();
    st.executeUpdate("UPDATE usuarios set usuario='"+usuario+"', password='"+pass+"' WHERE idusuarios="+id+"");
    st.close();
    %><h1 class="success">Usuario Actualizado Correctamente</h1><a href="javascript:window.location.replace('admin.jsp');">&laquo; Volver atrás</a><%
  }else{
    %><h1 class="error">ERROR, NO ELEGISTE UN USUARIO.</h1><a href="javascript:window.location.replace('admin.jsp');">&laquo; Volver atrás</a><%
  }
} catch (Exception e) {
 %><h1>NO MINO <%e.printStackTrace(response.getWriter());%></h1><%
}%>
