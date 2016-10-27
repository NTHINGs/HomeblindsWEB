<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Homeblinds</title>
    <link rel="stylesheet" href="css/persiana.css" media="screen" title="no title" charset="utf-8">
    <script type="text/javascript" src="js/jquery-2.2.1.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="css/smoothproducts.css">
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <script type="text/javascript">
    $(document).ready(function(){
      <%try {
         Class.forName("com.mysql.jdbc.Driver");

         // Es necesario useServerPrepStmts=true para que los PreparedStatement
         // se hagan en el servidor de bd. Si no lo ponemos, funciona todo
         // igual, pero los PreparedStatement se convertirán internamente a
         // Statements.
         Connection conexion = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/homeblinds?useServerPrepStmts=true",
            "homeblinds", "12345");
             Statement st = conexion.createStatement();
               ResultSet rs = st.executeQuery("select P.descripcion, F.url from productos P, fotosdestacadas F where P.idproductos=F.productos_idproductos and P.clave='"+request.getParameter("persiana")+"'" );
               int cont=1;
               String descripcion="";
               while (rs.next())
               {
                  %>document.getElementById(<%=cont%>).src='<%=rs.getString("url")%>';
                  <%
                    cont++;
                    descripcion=rs.getString("descripcion");
               }
               rs.close();
               Statement st1 = conexion.createStatement();
               ResultSet rs1 = st1.executeQuery("select C.urlcolor from colores C, productos P where P.idproductos=C.productos_idproductos and P.clave='"+request.getParameter("persiana")+"'" );
               while (rs1.next())
               {
                  %>
                    $("#colores").append('<a href="<%=rs1.getString("urlcolor")%>"><img src="<%=rs1.getString("urlcolor")%>" alt=""></a>');
                  <%
               }

                 %>document.getElementById("texto").innerHTML='<%=descripcion%>';<%

               rs1.close();
      } catch (Exception e) {
         %><h1>NO MINO <%e.printStackTrace(response.getWriter());%></h1><%
      }finally{

      }
    %>

    });
    </script>
  </head>
  <body>
    <a href="index.jsp"><img id="regresar"src="img/regresarpersiana.png" alt="" /></a>
    <header class="row">
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img id="1" src="" width="100%">
    </div>

    <div class="item">
      <img id="2" src="" width="100%">
    </div>

    <div class="item">
      <img id="3" src="" width="100%">
    </div>

  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Anterior</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Siguiente</span>
  </a>
</div>
    </header>
    <section class="row">
      <div class="container">
        <div class="col-xs-12 col-md-6 colores">
          <h2>Colores</h2>
          <div id="colores" class="sp-wrap">
          </div>
        </div>
        <div class="col-xs-12 col-md-6 info">
          <p id="texto">
            La cortina enrollable es la solución ideal para la protección solar de cualquier ambiente, desde ventanas muy pequeñas hasta las de más grandes dimensiones. Se ofrece una extensa gama de tejidos técnicos, decorativos, blackouts con diversas texturas y una moderna variedad cromática. Permiten controlar la luz solar para crear ambientes más cómodos.
          </p>
        </div>
      </div>
    </section>
    <script type="text/javascript" src="js/smoothproducts.js"></script>
    <script type="text/javascript">
        /* wait for images to load */
        $(window).load( function() {
            $('.sp-wrap').smoothproducts();
        });
    </script>
  </body>
</html>
