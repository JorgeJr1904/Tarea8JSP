<%-- 
    Document   : index
    Created on : 16/10/2023, 19:03:46
    Author     : usuario1
--%>
<%@page import="modelo.Puesto" %>
<%@page import="modelo.Empleado" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
    </head>
    <body>
        <h1>Formulario Empleados</h1>

        <div class="container">
            <!-- Modal -->
            <div class="modal fade" id="empleadosModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="sr_empleado" method="post" class="form-group">
                                <label for="lbl_id"><b>Id:</b></label>
                                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                                <label for="lbl_codigo"><b>Codigo:</b></label>
                                <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" placeholder="Ejemplo: E001" required>
                                <label for="lbl_nombres"><b>Nombres:</b></label>
                                <input type="text" name="txt_nombre" id="txt_nombre" class="form-control" placeholder="Ejemplo: Juan Pedro" required>
                                <label for="lbl_apellido"><b>Apellidos:</b></label>
                                <input type="text" name="txt_apellido" id="txt_apellido" class="form-control" placeholder="Ejemplo: Sanchez Cruz" required>
                                <label for="lbl_direccion"><b>Direccion:</b></label>
                                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: Guatemala" required>
                                <label for="lbl_telefono"><b>Telefono:</b></label>
                                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 12345678" required>
                                <label for="lbl_fn"><b>Fecha de Nacimiento:</b></label>
                                <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                                <label for="lbl_puesto"><b>Puesto:</b></label>
                                <select name="drop_puesto" id="drop_puesto" class="form-control">
                                    <%
                                        Puesto puesto = new Puesto();
                                        HashMap<String, String> drop = puesto.drop_puesto();
                                        for (String i : drop.keySet()) {
                                            out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                                        }
                                    %>
                                </select>
                                <br>
                                <button name="btn_agregar" value="agregar" class="btn btn-primary btn-lg">Agregar</button>
                                <button name="btn_modificar" value="modificar" class="btn btn-secondary btn-lg">Modificar</button>
                                <button name="btn_eliminar" value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                            return false">Eliminar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Codigo</th>
                        <th scope="col">Nombres</th>
                        <th scope="col">Apellidos</th>
                        <th scope="col">Direccion</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Nacimiento</th>
                        <th scope="col">Puesto</th>
                    </tr>
                </thead>
                <tbody id="tbl_empleados">
                    <%
                        Empleado empleado = new Empleado();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = empleado.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_p=" + tabla.getValueAt(t, 8) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                            out.println("</tr>");
                        }
                    %>
                </tbody>
            </table>
                <br>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#empleadosModal" onclick="limpiar()">
                Nuevo
            </button>

        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <script type="text/javascript">
                                    function limpiar() {
                                        $("#txt_id").val('');
                                        $("#txt_codigo").val('');
                                        $("#txt_nombre").val('');
                                        $("#txt_apellido").val('');
                                        $("#txt_direccion").val('');
                                        $("#txt_telefono").val('');
                                        $("#txt_fn").val('');
                                        $("#drop_puesto").val(1);
                                    }
                                    $('#tbl_empleados').on('click', 'tr td', function (evt) {
                                        var target, id, idp, codigo, nombres, apellidos, direccion, telefono, nacimiento;
                                        target = $(event.target);
                                        id = target.parent().data('id');
                                        idp = target.parent().data('id_p');
                                        codigo = target.parent("tr").find("td").eq(0).html();
                                        nombres = target.parent("tr").find("td").eq(1).html();
                                        apellidos = target.parent("tr").find("td").eq(2).html();
                                        direccion = target.parent("tr").find("td").eq(3).html();
                                        telefono = target.parent("tr").find("td").eq(4).html();
                                        nacimiento = target.parent("tr").find("td").eq(5).html();

                                        $("#txt_id").val(id);
                                        $("#txt_codigo").val(codigo);
                                        $("#txt_nombre").val(nombres);
                                        $("#txt_apellido").val(apellidos);
                                        $("#txt_direccion").val(direccion);
                                        $("#txt_telefono").val(telefono);
                                        $("#txt_fn").val(nacimiento);
                                        $("#drop_puesto").val(idp);
                                        $("#empleadosModal").modal('show');

                                    });
        </script>
    </body>
</html>
