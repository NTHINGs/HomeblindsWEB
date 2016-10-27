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
        String datos[]=new String[11];
        String imagenes[]=new String[8];
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
         try {
          List fileItems = upload.parseRequest(request);
           Iterator i = fileItems.iterator();
           int x=0;
           int y=0;
           while (i.hasNext ()) {
           FileItem fi = (FileItem)i.next();
            if (!fi.isFormField ()) {
              String fieldName = fi.getFieldName();
              imagenes[y] = "img/"+datos[2]+fi.getName();
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
               datos[x]=fi.getString("UTF-8");
               x++;
             }

           }
           Statement st=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeblinds?useServerPrepStmts=true","homeblinds", "12345").createStatement();
           st.executeUpdate("INSERT INTO productos (nombre,descripcion,urlfotodestacada,clave) VALUES ('"+datos[0]+"','"+datos[1]+"','"+imagenes[0]+"','"+datos[2]+"')");
           ResultSet rs = st.executeQuery("select idproductos from productos where clave='"+datos[2]+"'" );
           String id="";
           while (rs.next())
           {
              id=rs.getString("idproductos");
           }
           st.executeUpdate("INSERT INTO fotosdestacadas (url,productos_idproductos) VALUES ('"+imagenes[1]+"','"+id+"')");
           st.executeUpdate("INSERT INTO fotosdestacadas (url,productos_idproductos) VALUES ('"+imagenes[2]+"','"+id+"')");
           st.executeUpdate("INSERT INTO fotosdestacadas (url,productos_idproductos) VALUES ('"+imagenes[3]+"','"+id+"')");

           st.executeUpdate("INSERT INTO colores (nombre, tipo, urlcolor,productos_idproductos) VALUES ('"+datos[3]+"','"+datos[4]+"','"+imagenes[4]+"','"+id+"')");
           st.executeUpdate("INSERT INTO colores (nombre, tipo, urlcolor,productos_idproductos) VALUES ('"+datos[5]+"','"+datos[6]+"','"+imagenes[5]+"','"+id+"')");
           st.executeUpdate("INSERT INTO colores (nombre, tipo, urlcolor,productos_idproductos) VALUES ('"+datos[7]+"','"+datos[8]+"','"+imagenes[6]+"','"+id+"')");
           st.executeUpdate("INSERT INTO colores (nombre, tipo, urlcolor,productos_idproductos) VALUES ('"+datos[9]+"','"+datos[10]+"','"+imagenes[7]+"','"+id+"')");

           st.close();
           %>
           <h1 class="success">Producto insertado correctamente</h1>
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
