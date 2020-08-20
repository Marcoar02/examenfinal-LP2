<%@page import="Modelo.Area"%>
<%@page import="modeloDAO.AreaDAO"%>
<%@page import="Modelo.Rol"%>
<%@page import="modeloDAO.RolDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Persona"%>
<%@page import="modeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Sugerencia</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <form name="AgregarSugerenciaForm" action="Controlador" method="get">
                <table class="table">
                    <thead>
                        <tr>
                            <th class="text-center" colspan="2">Agregar Sugerencias</th>                            
                        </tr>
                        <tr></tr>
                    </thead>
        
                    <tbody>
                        <tr>
                            <td class="text-right">Fecha: </td>
                            <td><input class="form-control" type="date" name="f_fecha" value="" maxlength="20" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Descripcion:</td>
                            <td><input class="form-control" type="text" name="f_descripcion" value="" maxlength="50" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Estudiante:</td>
                            <td>
                                <select class="form-control" name="f_idpersona">
                                    <%
                                    PersonaDAO personaDAO = new PersonaDAO();
                                    List<Persona> personas = personaDAO.listapersona();
                                    Iterator<Persona> iterator = personas.iterator();
                                    Persona persona = null;
                                    while (iterator.hasNext()) {
                                        persona = iterator.next();
                                    %>
                                    <option value="<%out.print(persona.getIdpersona());%>"><%out.print(persona.getNombre()+" "+persona.getApellidos());%></option>
                                    <%}
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">Rol:</td>
                            <td>
                                <select class="form-control" name="f_idrol">
                                    <%
                                    RolDAO rolDAO = new RolDAO();
                                    List<Rol> roles = rolDAO.listarol();
                                    Iterator<Rol> iterator2 = roles.iterator();
                                    Rol rol = null;
                                    while (iterator2.hasNext()) {
                                        rol = iterator2.next();
                                    %>
                                    <option value="<%out.print(rol.getIdrol());%>"><%out.print(rol.getNombre());%></option>
                                    <%}
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">Area:</td>
                            <td>
                                <select class="form-control" name="f_idarea">
                                    <%
                                    AreaDAO areaDAO = new AreaDAO();
                                    List<Area> areas = areaDAO.listaarea();
                                    Iterator<Area> iterator3 = areas.iterator();
                                    Area area = null;
                                    while (iterator3.hasNext()) {
                                        area = iterator3.next();
                                    %>
                                    <option value="<%out.print(area.getIdarea());%>"><%out.print(area.getNombre());%></option>
                                    <%}
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-center" colspan="2">
                                <input class="btn btn-primary" type="submit" name="agregar" value="Agregar Sugerencia" />
                                <input type="hidden" name="f_accion" value="agregarsugerencia02" />
                                <a class="btn btn-success" href="Controlador?f_accion=listarsugerencia"><FONT COLOR="white">Regresar</a>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </form>
        </div>
    </body>
</html>
