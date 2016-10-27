<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Homeblinds</title>
    <meta name="viewport" content="width=device-width, maximum-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="css/styles.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" title="no title" charset="utf-8">
    <script type="text/javascript" src='js/api.js'></script>

  </head>
  <body>
    <div class="fullwidth">
      <section class="row page1" id="top">
        <div class="container">
          <div class="row">
            <div class="col-md-2 col-md-offset-10">
              <a id="opnModal"><img src="img/login.png"/>Ingresar</a>
            </div>
          </div>
          <!-- Modal -->
          <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

            <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">x</button>
                  <h1>Login</h1>
                </div>
                <div class="modal-body centrado">
                  <div class="row">
                    <form role="form" data-toggle="validator" id="login" method="post" action="login.jsp">
                      <div class="col-xs-12 centrado">
                        <label>USUARIO</label><br>
                        <input type="text" name="usuario" value="" required><br>
                        <label>CONTRASEÑA</label><br>
                        <input type="password" name="pass" value="" required><br>
                        <div class="g-recaptcha" id="rcaptcha" style="margin-left: 90px;" data-sitekey="6LctLRgTAAAAACUb6kmxYgZLmwNi_iRjUCHyUBa6"></div>
                        <span id="captcha" style="margin-left:100px;color:red" />
                      </div>
                    </form>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" form="login" name="button" class="btn btn-block azul">Ingresar</button>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="container">
              <div class="col-md-12">
                <img id="logo" src="img/logo.png"/>
                <h1>Homeblinds</h1>
                <h2>Luz Para Tus Ventanas</h2>
                <nav>
                  <ul class="menu">
                    <li><a href="#bot"><img src="img/uno.png"/></a></li>
                    <li><a href="#mid"><img src="img/dos.png"/></a></li>
                    <li><a href="https://www.facebook.com/Homeblinds-Persianas-y-Motorizaci%C3%B3n-117581481648672/" target="_blank"><img src="img/tres.png"/></a></li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section class="row page2 centrado" id="mid">
        <div class="container">
          <div class="col-lg-12">
            <h1>Cat&aacutelogo</h1>
          </div>
          <nav>
            <ul class="menu2">
              <li><a href="#top"><img src="img/sidenav1.png"/></a></li>
              <li><a href="https://www.facebook.com/Homeblinds-Persianas-y-Motorizaci%C3%B3n-117581481648672/" target="_blank"><img src="img/sidenav2.png"/></a></li>
              <li><a href="#bot"><img src="img/sidenav3.png"/></a></li>
            </ul>
          </nav>
          <%try{
            Class.forName("com.mysql.jdbc.Driver");

          // Es necesario useServerPrepStmts=true para que los PreparedStatement
          // se hagan en el servidor de bd. Si no lo ponemos, funciona todo
          // igual, pero los PreparedStatement se convertirán internamente a
          // Statements.
          Connection conexion = DriverManager.getConnection(
             "jdbc:mysql://localhost:3306/homeblinds?useServerPrepStmts=true",
             "homeblinds", "12345");
              Statement st = conexion.createStatement();
                ResultSet rs = st.executeQuery("select nombre, urlfotodestacada, clave from productos" );
                while (rs.next())
                {
                   out.println("<div class='col-lg-4 col-md-6 col-sm-6 col-xs-12 thumb'>");
                   out.println("<div class='persiana'><img id='foto' src='"+rs.getString("urlfotodestacada")+"'/><img id='gris' src='img/gris.png' alt='' /><a href='persiana.jsp?persiana="+rs.getString("clave")+"'><img id='vermas' src='img/vermas.png' alt='' /></a><p class='texto'>"+rs.getString("nombre")+"</p></div>");
                   out.println("</div>");
                }
                rs.close();
       } catch (Exception e) {
          %><h1>NO MINO <%e.printStackTrace(response.getWriter());%></h1><%
       }%>


        </div>
      </section>

      <section class="footer" id="bot">
        <div class="info">
          <p>
          ®Homeblinds <br>
          Blvd. Durango 400-D Lomas del Guadiana Durango, Dgo. <br>
          Tel:618-812-71-79             Cel:618-122-47-60 <br>
          <a href="mailto:contacto@homeblinds.com">contacto@homeblinds.com</a> <br>
          Horario: Lunes a Viernes 10:00 am - 14:00 pm   16:00 pm - 19:00 pm
          </p>
        </div>
        <div class="mapa">
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4334.042071853462!2d-104.67993517652044!3d24.014117387833!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x869bc812fb3bb80d%3A0xb5bbf7297c5c0ae!2sHomeblinds%2C+Gabin+Durango!5e0!3m2!1ses-419!2smx!4v1455333715728" width="100%" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
      </section>
    </div>
    <script type="text/javascript" src="js/jquery-2.2.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(document).ready( function() {
      $('a[href^="#"]').on('click',function (e) {
        e.preventDefault();

        var target = this.hash;
        var $target = $(target);

        $('html, body').stop().animate({'scrollTop': $target.offset().top
      }, 900, 'swing', function () {
          window.location.hash = target;
        });
      });
      var topOfOthDiv = $("#mid").offset().top;
      $(window).scroll(function() {
        if($(window).scrollTop() >= topOfOthDiv) { //scrolled past the other div?
          $('.menu2').fadeIn();
        } else{
          $('.menu2').fadeOut();
        }
      });

      $("#opnModal").click(function(){
        $("#myModal").modal();
      });
    });

    </script>
  </body>
</html>
