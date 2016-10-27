        <%@ page import="java.sql.*"%>
        <%@ page contentType="text/html; charset=UTF-8" %>
        <link rel="stylesheet" href="css/dialogo.css" media="screen" title="no title" charset="utf-8">

        <%
        try {
          String nombre = request.getParameter("nombre");
          String nombreviejo = request.getParameter("nombreviejo");
          Statement st=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeblinds?useServerPrepStmts=true","homeblinds", "12345").createStatement();
          st.executeUpdate("UPDATE productos SET nombre='"+nombre+"' WHERE nombre='"+nombreviejo+"'");
          st.close();
          %><h1 class="success">Nombre Actualizado Correctamente</h1>
        <a href="javascript:window.location.replace('admin.jsp');">&laquo; Volver atr&aacutes</a><%
        } catch (Exception e) {
         %><h1 class="error">NO MINO <%e.printStackTrace(response.getWriter());%></h1><%
      }%>
