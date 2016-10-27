<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="css/dialogo.css" media="screen" title="no title" charset="utf-8">

<%
String datos[]=new String[9];
String imagenes[]=new String[4];
ServletContext context = pageContext.getServletContext();
String filePath = context.getRealPath("/");
File file;
int maxFileSize = 5000 * 1024;
int maxMemSize = maxFileSize;
String contentType = request.getContentType();
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setSizeThreshold(maxMemSize);
factory.setRepository(new File("/tmp"));
 ServletFileUpload upload = new ServletFileUpload(factory);
 Statement st=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeblinds?useServerPrepStmts=true","homeblinds", "12345").createStatement();
 upload.setSizeMax(maxFileSize);
 try {
  List fileItems = upload.parseRequest(request);
   Iterator i = fileItems.iterator();
   int x=0;
   int y=0;
   while (i.hasNext ()) {
   FileItem fi = (FileItem)i.next();
    if (!fi.isFormField ()) {
      String fieldName = fi.getFieldName();
      ResultSet rs = st.executeQuery("select clave from productos where idproductos='"+datos[0]+"'" );
      String clave="";
      while (rs.next())
      {
         clave=rs.getString("clave");
      }
      imagenes[y] = "img/"+clave+fi.getName();
      if (imagenes[y] == "") out.println("Se te olvido seleccionar un archivo. <a href='admin.jsp'>Intentar de nuevo</a>");
      boolean isInMemory = fi.isInMemory();
       long sizeInBytes = fi.getSize();
       if( imagenes[y].lastIndexOf("\\") >= 0 ) {
         file = new File(filePath + imagenes[y].substring(imagenes[y].lastIndexOf("\\")));
       } else {
         file = new File(filePath + imagenes[y].substring(imagenes[y].lastIndexOf("\\")+1));
       }
       fi.write(file) ;
       y++;
     }else{
       datos[x]=fi.getString();
       x++;
     }

   }
   ResultSet rs = st.executeQuery("select idcolores from colores WHERE productos_idproductos='"+datos[0]+"'" );
   int [] ids=new int[4];
   int cont=0;
   while(rs.next()){
     ids[cont]=rs.getInt("idcolores");
     cont++;
   }
   st.executeUpdate("UPDATE colores SET nombre='"+datos[1]+"', tipo='"+datos[2]+"', urlcolor='"+imagenes[0]+"' WHERE idcolores='"+ids[0]+"'");
   st.executeUpdate("UPDATE colores SET nombre='"+datos[3]+"', tipo='"+datos[4]+"', urlcolor='"+imagenes[1]+"' WHERE idcolores='"+ids[1]+"'");
   st.executeUpdate("UPDATE colores SET nombre='"+datos[5]+"', tipo='"+datos[6]+"', urlcolor='"+imagenes[2]+"' WHERE idcolores='"+ids[2]+"'");
   st.executeUpdate("UPDATE colores SET nombre='"+datos[7]+"', tipo='"+datos[8]+"', urlcolor='"+imagenes[3]+"' WHERE idcolores='"+ids[3]+"'");
   %>
   <h1 class="success">Colores Actualizados Correctamente</h1>
   <a href="javascript:window.location.replace('admin.jsp');">&laquo; Volver atr&aacutes</a>
   <%
 } catch(Exception ex) {
   %>
   <h1 class="error">No Mino</h1>
   <p><%=ex%>
   <a href="javascript:window.location.replace('admin.jsp');">&laquo; Volver atr&aacutes</a>
   <%
 }

%>
