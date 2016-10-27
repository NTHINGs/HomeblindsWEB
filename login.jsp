<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="css/dialogo.css" media="screen" title="no title" charset="utf-8">

<%
try {
  String usuario = request.getParameter("usuario");
  String contraseña = request.getParameter("pass");
  String captcha = request.getParameter("g-recaptcha-response");
  Statement st=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeblinds?useServerPrepStmts=true","homeblinds", "12345").createStatement();
  ResultSet rs = st.executeQuery("select * from usuarios where usuario='"+usuario+"' AND password='"+contraseña+"'");
  if(rs.next()!=false){
    if(captcha!=""){
      %><script>javascript:window.location.replace('admin.jsp');</script><%
    }else{
      %><h1 class="error">No verificaste captcha</h1>
        <a href="javascript:window.location.replace('index.jsp');">&laquo; Volver atrás</a><%
    }
  }else{
    %><h1 class="error">Error en usuario ó contraseña</h1>
      <a href="javascript:window.location.replace('index.jsp');">&laquo; Volver atrás</a><%
  }
  st.close();

} catch (Exception e) {
 %><h1>NO MINO <%e.printStackTrace(response.getWriter());%></h1><%
}%>
