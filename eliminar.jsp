<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<link rel="stylesheet" href="css/dialogo.css" media="screen" title="no title" charset="utf-8">
<%
try
    {
  int id = Integer.parseInt(request.getParameter("idProduct"));
  Statement st=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeblinds?useServerPrepStmts=true","homeblinds", "12345").createStatement();

  ResultSet rs = st.executeQuery("select P.urlfotodestacada, F.url from productos P, fotosdestacadas F where P.idproductos=F.productos_idproductos and P.idproductos='"+id+"'" );
  int cont=0;
  String url="";
  String destacadas[]=new String[3];
  String colores[]=new String[4];
  while (rs.next())
  {
       destacadas[cont]=rs.getString("url");
       cont++;
       url=rs.getString("urlfotodestacada");
  }
  cont=0;
  ResultSet rs1 = st.executeQuery("select C.urlcolor from colores C, productos P where P.idproductos=C.productos_idproductos and P.idproductos='"+id+"'" );
  while (rs1.next())
  {
      colores[cont]=rs1.getString("urlcolor");
       cont++;
  }
  ServletContext context = pageContext.getServletContext();
  String filePath = context.getRealPath("/");
  File foto=new File(filePath + url);
  foto.delete();

  for(int x=0;x<destacadas.length;x++){
    File fotos=new File(filePath + destacadas[x]);
    fotos.delete();
  }

  for(int y=0;y<colores.length;y++){
    File fotos=new File(filePath + colores[y]);
    fotos.delete();
  }

  st.executeUpdate("DELETE FROM fotosdestacadas WHERE productos_idproductos="+id+"");
  st.executeUpdate("DELETE FROM colores WHERE productos_idproductos="+id+"");
  st.executeUpdate("DELETE FROM productos WHERE idproductos="+id+"");
  st.close();

  %><h1 class="success">Producto eliminado correctamente</h1>
  <a href="javascript:window.location.replace('admin.jsp');">&laquo; Volver atr&aacutes</a><%
}
  catch (Exception e)
  {
    %><h1>NO MINO <%e.printStackTrace(response.getWriter());%></h1><%
  }

%>
