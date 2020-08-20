<%@page import="Modelo.Sugerencia"%>
<%@page import="modeloDAO.SugerenciaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Sugerencia</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h1>Listado de Sugerencia</h1>
            <a class="btn btn-success" href="Controlador?f_accion=agregarsugerencia01">Agregar Sugerencia</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">Fecha</th>
                        <th class="text-center">Descripcion</th>
                        <th class="text-center">Nombre y Apellidos</th>
                        <th class="text-center">Rol</th>
                        <th class="text-center">Area</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        SugerenciaDAO SugerenciaDAO = new SugerenciaDAO();
                        List<Sugerencia> sugerencias = SugerenciaDAO.listarsugerencia();
                        Iterator<Sugerencia> iterator = sugerencias.iterator();
                        Sugerencia sugerencia = null;
                        while (iterator.hasNext()) {
                            sugerencia = iterator.next();

                    %>
                    <tr>
                        <td class="text-center"><% out.print(sugerencia.getIdsugerencia()); %></td>
                        <td><% out.print(sugerencia.getFecha()); %></td>
                        <td class="text-center"><% out.print(sugerencia.getDescripcion()); %></td>
                        <td class="text-center"><% out.print(sugerencia.getPersona().getNombre()+" "+ sugerencia.getPersona().getApellidos()); %></td>
                        <td class="text-center"><% out.print(sugerencia.getRol().getNombre()); %></td>
                        <td class="text-center"><% out.print(sugerencia.getArea().getNombre()); %></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="Controlador?f_accion=editarsugerencia01&f_idsugerencia=<% out.print(sugerencia.getIdsugerencia()); %>">
                                Editar
                            </a>
                            <a class="btn btn-danger" href="Controlador?f_accion=eliminarsugerencia&f_idsugerencia=<% out.print(sugerencia.getIdsugerencia()); %>">
                                Eliminar
                            </a>
                        </td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
            <table border="0" cellspacing="0" cellpagging="0" align="center">

                <tr>
                    <td> </td>
                    <td colspan="2"><a class="btn btn-success" href="index.html"><FONT COLOR="white">Regresar</a></td>
                </tr>
                    
            </table>
        </div>
    </body>
</html>
