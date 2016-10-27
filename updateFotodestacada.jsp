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
String id="";
String imagen="";
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
 upload.setSizeMax(maxFileSize);
 Statement st=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeblinds?useServerPrepStmts=true","homeblinds", "12345").createStatement();

 try {
  List fileItems = upload.parseRequest(request);
   Iterator i = fileItems.iterator();
   while (i.hasNext ()) {
   FileItem fi = (FileItem)i.next();
    if (!fi.isFormField ()) {
      String fieldName = fi.getFieldName();
      ResultSet rs = st.executeQuery("select clave from productos where idproductos='"+id+"'" );
      String clave="";
      while (rs.next())
      {
         clave=rs.getString("clave");
      }
      imagen = "img/"+clave+fi.getName();
      if (imagen == "") out.println("Se te olvido seleccionar un archivo. <a href='admin.jsp'>Intentar de nuevo</a>");
      boolean isInMemory = fi.isInMemory();
       long sizeInBytes = fi.getSize();
       if( imagen.lastIndexOf("\\") >= 0 ) {
         file = new File(filePath + imagen.substring(imagen.lastIndexOf("\\")));
       } else {
         file = new File(filePath + imagen.substring(imagen.lastIndexOf("\\")+1));
       }
       fi.write(file) ;
     }else{
       id=fi.getString();
     }

   }
   st.executeUpdate("UPDATE productos SET urlfotodestacada='"+imagen+"' WHERE idproductos='"+id+"'");

   %>
   <h1 class="success">Foto Destacada Actualizada Correctamente</h1>
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
