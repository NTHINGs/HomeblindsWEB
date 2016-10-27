<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Homeblinds</title>
    <meta name="viewport" content="width=device-width, maximum-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="css/admin.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" title="no title" charset="utf-8">
    <script type="text/javascript" src='js/api.js'></script>

  </head>
  <body>
    <div class="fullwidth" id="contenido">
      <div class="row">
        <div class="col-xs-1">
          <img src="img/logo.png" class="img-responsive"/>
        </div>
        <div class="col-xs-10">
          <a id="opnModalProducto" class="btn btn-success btn-block btn-lg">Agregar Producto <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
          <div class="btn-group btn-block usuarios">
            <button type="button" class="btn btn-warning">Usuarios</button>
            <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="caret"></span>
              <span class="sr-only">Toggle Dropdown</span>
            </button>
            <ul class="dropdown-menu">
              <li><a id="opnModalAgregarUsuario">Agregar Usuario</a></li>
              <li><a id="opnModalEditarUsuario">Actualizar Usuario</a></li>
              <li><a id="opnModalEliminarUsuario">Eliminar Usuario</a></li>
            </ul>
          </div>
        </div>
        <div class="col-xs-1 cent">
          <a href="index.jsp"><span id="logouticon" class="glyphicon glyphicon-off" aria-hidden="true"></span></a><br>
        </div>
      </div>
    </div>

    <!-- Modal -->
          <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">x</button>
                  <h1>Agregar Producto</h1>
                </div>
                <div class="modal-body centrado">
                  <div class="row">
                    <form role="form" data-toggle="validator" method="post" enctype="multipart/form-data" id="producto" action="insertProducto.jsp">
                      <div class="col-xs-12 centrado">
                        <label>NOMBRE</label><br>
                        <input class="form-control" type="text" name="nombre" value="" required><br>
                        <label>DESCRIPCI&OacuteN</label><br>
                        <textarea class="form-control" name="descripcion" value="" required></textarea><br>
                        <label>CLAVE</label><br>
                        <input class="form-control" type="text" name="clave" value="" required><br>
                        <label>FOTO DEL ART&IacuteCULO</label><br>
                        <input class="form-control" type="file" name="fichero" required/></br>
                        <label>FOTO SLIDER 1</label><br>
                        <input class="form-control" type="file" name="fichero1" required/></br>
                        <label>FOTO SLIDER 2</label><br>
                        <input class="form-control" type="file" name="fichero2" required/></br>
                        <label>FOTO SLIDER 3</label><br>
                        <input class="form-control" type="file" name="fichero3" required/></br>
                        <label>COLOR 1</label><br>
                        <label>NOMBRE</label><br>
                        <input class="form-control" type="text" name="nombre1" value="" required><br>
                        <label>TIPO</label><br>
                        <select class="form-control" id="exampleSelect1" name="tipo1" required>
                          <option>BLACKOUT</option>
                          <option>PVC</option>
                          <option>TELA</option>
                          <option>TRASLUCIDA</option>
                          <option>SCREEN</option>
                        </select><br>
                        <label>ARCHIVO</label><br>
                        <input class="form-control" type="file" name="fichero4" required/></br>
                        <br>
                        <label>COLOR 2</label><br>
                        <label>NOMBRE</label><br>
                        <input class="form-control" type="text" name="nombre2" value="" required><br>
                          <label>TIPO</label><br>
                          <select class="form-control" id="exampleSelect1" name="tipo2" required>
                            <option>BLACKOUT</option>
                            <option>PVC</option>
                            <option>TELA</option>
                            <option>TRASLUCIDA</option>
                            <option>SCREEN</option>
                          </select><br>
                        <label>ARCHIVO</label><br>
                        <input class="form-control" type="file" name="fichero5" required/></br>
                        <br>
                        <label>COLOR 3</label><br>
                        <label>NOMBRE</label><br>
                        <input class="form-control" type="text" name="nombre3" value="" required><br>
                          <label>TIPO</label><br>
                          <select class="form-control" id="exampleSelect1" name="tipo3" required>
                            <option>BLACKOUT</option>
                            <option>PVC</option>
                            <option>TELA</option>
                            <option>TRASLUCIDA</option>
                            <option>SCREEN</option>
                          </select><br>
                        <label>ARCHIVO</label><br>
                        <input class="form-control" type="file" name="fichero6" required/></br>
                        <br>
                        <label>COLOR 4</label><br>
                        <label>NOMBRE</label><br>
                        <input class="form-control" type="text" name="nombre4" value="" required><br>
                          <label>TIPO</label><br>
                          <select class="form-control" id="exampleSelect1" name="tipo4" required>
                            <option>BLACKOUT</option>
                            <option>PVC</option>
                            <option>TELA</option>
                            <option>TRASLUCIDA</option>
                            <option>SCREEN</option>
                          </select><br>
                        <label>ARCHIVO</label><br>
                        <input class="form-control" type="file" name="fichero7" required/></br>
                        <br>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" form="producto" value="Submit" class="btn btn-block azul">AGREGAR PRODUCTO</button>
                </div>
              </div>
            </div>
          </div>

           <!--Modal2 -->
          <div class="modal fade" id="myModal2" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">x</button>
                  <h1>Actualizar Nombre</h1>
                </div>
                <div class="modal-body centrado">
                  <div class="row">
                    <form role="form" data-toggle="validator" method="post" id="updatenombre" action="updateNombre.jsp">
                      <div class="col-xs-12 centrado">
                        <input class="oculto" id="viejo" type="text" name="nombreviejo" value=""></input>
                        <label>NOMBRE NUEVO</label><br>
                        <input class="form-control" type="text" name="nombre" value="" required><br>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" form="updatenombre" value="Submit" class="btn btn-block azul">ACTUALIZAR NOMBRE</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Modal -->
          <div class="modal fade" id="myModal3" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">x</button>
                  <h1>Actualizar Descripci&oacuten</h1>
                </div>
                <div class="modal-body centrado">
                  <div class="row">
                    <form role="form" data-toggle="validator" method="post" id="descripcion" action="updateDescripcion.jsp">
                      <div class="col-xs-12 centrado">
                        <input class="oculto" id="descvieja" type="text" name="descvieja" value=""></input>
                        <label>DESCRIPCI&OacuteN</label><br>
                        <textarea class="form-control" id="descripcion" name="descripcion" value="" required ></textarea><br>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" form="descripcion" value="Submit" class="btn btn-block azul">ACTUALIZAR DESCRIPCI&OacuteN</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Modal -->
          <div class="modal fade" id="myModal4" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">x</button>
                  <h1>¿Estás seguro de que deseas eliminar el producto?</h1>
                </div>
                <div class="modal-body centrado">
                  <div class="row">
                    <form role="form" method="post" id="eliminar" action="eliminar.jsp">
                      <div class="col-xs-12 centrado">
                        <input class="oculto" id="idProductocampo" type="text" name="idProduct" value=""></input>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" form="eliminar" value="Submit" class="btn btn-success">ELIMINAR PRODUCTO</button>
                  <button type="submit" data-dismiss="modal" class="btn btn-danger">CANCELAR</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Modal -->
          <div class="modal fade" id="myModal5" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">x</button>
                  <h1>Actualizar Colores</h1>
                </div>
                <div class="modal-body centrado">
                  <div class="row">
                    <form role="form" data-toggle="validator" method="post" enctype="multipart/form-data" id="colores" action="updateColores.jsp">
                      <div class="col-xs-12 centrado">
                        <input class="oculto" id="idProductoColorcampo" type="text" name="descvieja" value=""></input>
                        <label>COLOR 1</label><br>
                        <label>NOMBRE</label><br>
                        <input class="form-control" type="text" name="nombre1" value="" required><br>
                          <label>TIPO</label><br>
                          <select class="form-control" id="exampleSelect1" name="tipo1" required>
                            <option>BLACKOUT</option>
                            <option>PVC</option>
                            <option>TELA</option>
                            <option>TRASLUCIDA</option>
                            <option>SCREEN</option>
                          </select><br>
                        <label>ARCHIVO</label><br>
                        <input class="form-control" type="file" name="fichero1" required/></br>
                        <br>
                        <label>COLOR 2</label><br>
                        <label>NOMBRE</label><br>
                        <input class="form-control" type="text" name="nombre2" value="" required><br>
                          <label>TIPO</label><br>
                          <select class="form-control" id="exampleSelect1" name="tipo2" required>
                            <option>BLACKOUT</option>
                            <option>PVC</option>
                            <option>TELA</option>
                            <option>TRASLUCIDA</option>
                            <option>SCREEN</option>
                          </select><br>
                        <label>ARCHIVO</label><br>
                        <input class="form-control" type="file" name="fichero2" required/></br>
                        <br>
                        <label>COLOR 3</label><br>
                        <label>NOMBRE</label><br>
                        <input class="form-control" type="text" name="nombre3" value="" required><br>
                          <label>TIPO</label><br>
                          <select class="form-control" id="exampleSelect1" name="tipo3" required>
                            <option>BLACKOUT</option>
                            <option>PVC</option>
                            <option>TELA</option>
                            <option>TRASLUCIDA</option>
                            <option>SCREEN</option>
                          </select><br>
                        <label>ARCHIVO</label><br>
                        <input class="form-control" type="file" name="fichero3" required/></br>
                        <br>
                        <label>COLOR 4</label><br>
                        <label>NOMBRE</label><br>
                        <input class="form-control" type="text" name="nombre4" value="" required><br>
                          <label>TIPO</label><br>
                          <select class="form-control" id="exampleSelect1" name="tipo4" required>
                            <option>BLACKOUT</option>
                            <option>PVC</option>
                            <option>TELA</option>
                            <option>TRASLUCIDA</option>
                            <option>SCREEN</option>
                          </select><br>
                        <label>ARCHIVO</label><br>
                        <input class="form-control" type="file" name="fichero4" required/></br>
                        <br>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" form="colores" value="Submit" class="btn btn-block azul">ACTUALIZAR COLOR</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Modal -->
          <div class="modal fade" id="myModal6" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">x</button>
                  <h1>Actualizar Foto Destacada</h1>
                </div>
                <div class="modal-body centrado">
                  <div class="row">
                    <form role="form" data-toggle="validator" method="post" enctype="multipart/form-data" id="fotodestacada" action="updateFotodestacada.jsp">
                      <div class="col-xs-12 centrado">
                        <input class="oculto" id="idproductourl" type="text" name="idantigua" value=""></input>
                        <label>ARCHIVO</label><br>
                        <input class="form-control" type="file" name="fichero" required/></br>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" form="fotodestacada" value="Submit" class="btn btn-block azul">ACTUALIZAR FOTO</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Modal -->
          <div class="modal fade" id="myModal7" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">x</button>
                  <h1>Actualizar Fotos Slider</h1>
                </div>
                <div class="modal-body centrado">
                  <div class="row">
                    <form role="form" data-toggle="validator" method="post" enctype="multipart/form-data" id="fotoslider" action="updateFotos.jsp">
                      <div class="col-xs-12 centrado">
                        <input class="oculto" id="idProductoslidercampo" type="text" name="idantigua" value=""></input>
                        <label>FOTO 1</label><br>
                        <input class="form-control" type="file" name="fichero" required/></br>
                        <label>FOTO 2</label><br>
                        <input class="form-control" type="file" name="fichero2" required/></br>
                        <label>FOTO 3</label><br>
                        <input class="form-control" type="file" name="fichero3" required/></br>
                      </div>
                    </form>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" form="fotoslider" value="Submit" class="btn btn-block azul">ACTUALIZAR FOTOS</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Modal -->
          <div class="modal fade" id="agregarusuario" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">x</button>
                  <h1>Agregar Usuario</h1>
                </div>
                <div class="modal-body centrado">
                  <div class="row">
                    <form role="form" data-toggle="validator" method="post" id="agregaruser" action="agregarUser.jsp">
                      <div class="col-xs-12 centrado">
                        <label>USUARIO</label><br>
                        <input id="usuarioamodificar" class="form-control" type="text" name="usuario" value="" required><br>
                        <label>CONTRASEÑA</label><br>
                        <input id="contraamodificar" class="form-control" type="password" name="pass" value="" required><br>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" form="agregaruser" value="Submit" class="btn btn-block azul">AGREGAR USUARIO</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Modal -->
          <div class="modal fade" id="editarusuario" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">x</button>
                  <h1>Actualizar Usuario</h1>
                  <label>SELECCIONA UN USUARIO A MODIFICAR</label>
                  <select id="usuarios" onchange="usuarios()" required>
                    <option value="0"></option>
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
                       ResultSet rs = st.executeQuery("select idusuarios,usuario from usuarios" );
                       int cont=1;
                       while (rs.next()){
                         %><option value='<%=rs.getString("idusuarios")%>'><%=rs.getString("usuario")%></option><%
                       }
                       rs.close();
                    } catch (Exception e) {
                      %><h1>NO MINO <%e.printStackTrace(response.getWriter());%></h1><%
                    }%>
                  </select><br>
                </div>
                <div class="modal-body centrado">
                  <div class="row">
                    <form role="form" data-toggle="validator" method="post" id="editaruser" action="editUser.jsp">
                      <div class="col-xs-12 centrado">
                        <input class="oculto" id="idusuario" type="text" name="id" value="0"></input>
                        <label>USUARIO</label><br>
                        <input id="usuarioamodificar" class="form-control" type="text" name="usuario" value="" required><br>
                        <label>CONTRASEÑA</label><br>
                        <input id="contraamodificar" class="form-control" type="password" name="pass" value="" required><br>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" form="editaruser" value="Submit" class="btn btn-block azul">EDITAR USUARIO</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Modal -->
          <div class="modal fade" id="eliminarusuario" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">x</button>
                  <h1>Actualizar Fotos Slider</h1>
                  <label>SELECCIONA UN USUARIO A MODIFICAR</label>
                  <select id="usuarios2" onchange="usuarios2()" required>
                    <option value="0"></option>
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
                       ResultSet rs = st.executeQuery("select idusuarios,usuario from usuarios" );
                       int cont=1;
                       while (rs.next()){
                         %><option value='<%=rs.getString("idusuarios")%>'><%=rs.getString("usuario")%></option><%
                       }
                       rs.close();
                    } catch (Exception e) {
                      %><h1>NO MINO <%e.printStackTrace(response.getWriter());%></h1><%
                    }%>
                  </select><br>
                </div>
                <div class="modal-body centrado">
                  <div class="row">
                    <form role="form" data-toggle="validator" method="post" id="eliminaruser" action="eliminarUser.jsp">
                      <div class="col-xs-12 centrado">
                        <input class="oculto" id="idusuario2" type="text" name="id" value="0"></input>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" form="eliminaruser" value="Submit" class="btn btn-success">ELIMINAR USUARIO</button>
                  <button type="submit" data-dismiss="modal" class="btn btn-danger">CANCELAR</button>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
    <script type="text/javascript" src="js/jquery-2.2.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    function usuarios(){
      var id=document.getElementById("usuarios").value;
      document.getElementById("idusuario").value = id;
      document.getElementById('usuarioamodificar').value = "";
      document.getElementById('contraamodificar').value = "";

    }
    function usuarios2(){
      var id=document.getElementById("usuarios2").value;
      document.getElementById("idusuario2").value = id;

    }
      $(document).ready(function(){
        $("#opnModalAgregarUsuario").click(function(){
            $("#agregarusuario").modal();
          });
        $("#opnModalEditarUsuario").click(function(){
            $("#editarusuario").modal();
          });
        $("#opnModalEliminarUsuario").click(function(){
            $("#eliminarusuario").modal();
          });
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
                 ResultSet rs = st.executeQuery("select nombre, urlfotodestacada, descripcion, idproductos from productos" );
                 int cont=1;
                 while (rs.next())
                 {

                    %>$('#contenido').append("<%="<div class='row'>"+
                                              "<div class='btn-group btn-group-justified botongrup' role='group' aria-label='...'>"+
                                              "<a class='btn btn-default ' id='opnModalNombre"+cont+"'><p class='oculto' id='nombreviejocampo"+cont+"'>"+rs.getString("nombre")+"</p>"+rs.getString("nombre")+"</a>"+
                                              "<a class='btn btn-default' id='opnModalFotoDest"+cont+"'><p class='oculto' id='idProductoFoto"+cont+"'>"+rs.getString("idproductos")+"</p><img src='"+rs.getString("urlfotodestacada")+"' /></a>"+
                                              "<a class='btn btn-default' id='opnModalDesc"+cont+"'><p class='oculto' id='descviejacampo"+cont+"'>"+rs.getString("descripcion")+"</p>Cambiar Descripci&oacuten</a>"+
                                              "<a class='btn btn-default' id='opnModalSlider"+cont+"'><p class='oculto' id='idProductoSlider"+cont+"'>"+rs.getString("idproductos")+"</p>Cambiar Fotos Slider</a>"+
                                              "<a class='btn btn-default' id='opnModalColor"+cont+"'><p class='oculto' id='idProductoColor"+cont+"'>"+rs.getString("idproductos")+"</p>Colores</a>"+
                                              "<a class='btn btn-danger' id='opnModalDelete"+cont+"'><p class='oculto' id='idProducto"+cont+"'>"+rs.getString("idproductos")+"</p>Eliminar <span class='glyphicon glyphicon-remove'aria-hidden='true'></span></a>"+
                                              "</div></div>"%>");

                    $("#opnModalNombre<%=cont%>").click(function(){
                        $("#myModal2").modal();
                        $("#viejo").val($("#nombreviejocampo<%=cont%>").text());
                      });
                    $("#opnModalFotoDest<%=cont%>").click(function(){
                        $("#myModal6").modal();
                        $("#idproductourl").val($("#idProductoFoto<%=cont%>").text());
                    });
                    $("#opnModalDesc<%=cont%>").click(function(){
                        $("#myModal3").modal();
                        $("#descvieja").val($("#descviejacampo<%=cont%>").text());
                        $("#descripcion").val($("#descviejacampo<%=cont%>").text());
                      });
                      $("#opnModalSlider<%=cont%>").click(function(){
                          $("#myModal7").modal();
                          $("#idProductoslidercampo").val($("#idProductoSlider<%=cont%>").text());
                        });
                    $("#opnModalDelete<%=cont%>").click(function(){
                        $("#myModal4").modal();
                        $("#idProductocampo").val($("#idProducto<%=cont%>").text());
                      });
                    $("#opnModalColor<%=cont%>").click(function(){
                        $("#myModal5").modal();
                        $("#idProductoColorcampo").val($("#idProductoColor<%=cont%>").text());
                      });
                      <%
                    cont++;
                 }
                 rs.close();
        } catch (Exception e) {
           %><h1>NO MINO <%e.printStackTrace(response.getWriter());%></h1><%
        }%>
        $("#opnModalProducto").click(function(){
          $("#myModal").modal();
        });

      });

    </script>
  </body>
</html>
