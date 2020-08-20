<%@page import="Modelo.Area"%>
<%@page import="modeloDAO.AreaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Persona"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.PersonaDAO"%>
<%@page import="Modelo.Sugerencia"%>
<%@page import="modeloDAO.SugerenciaDAO"%>
<%@page import="Modelo.Rol"%>
<%@page import="modeloDAO.RolDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Sugerencia</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <%
                SugerenciaDAO sugerenciaDAO = new SugerenciaDAO();
                int s_idsugerencia = Integer.valueOf(request.getParameter("f_idsugerencia"));
                Sugerencia sugerencia = (Sugerencia)sugerenciaDAO.buscarsugerencia(s_idsugerencia);                
            %>
            <form name="EditarSugerenciasForm" action="Controlador" method="get">
                <table  class="table">
                    <thead>
                        <tr>
                            <th class="text-center" colspan="2">Editar Sugerencias</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-right">Fecha: </td>
                            <td>
                                <input class="form-control" type="date" name="f_fecha" value="<% out.print(sugerencia.getFecha()); %>" maxlength="20" size="5" />
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">Descripcion:</td>
                            <td><input class="form-control" type="text" name="f_descripcion" value="<% out.print(sugerencia.getDescripcion()); %>" maxlength="50" size="30" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Persona:</td>
                            <td>
                                <select class="form-control" class="form-control" name="f_idpersona" value="">
                                    <%
                                    PersonaDAO personaDAO = new PersonaDAO();
                                    List<Persona> personas = personaDAO.listapersona();
                                    Iterator<Persona> iterator = personas.iterator();
                                    Persona persona = null;
                                    while (iterator.hasNext()) {
                                        persona = iterator.next();
                                        if(persona.getIdpersona()== sugerencia.getPersona().getIdpersona()){
                                    %>
                                    <option value="<%out.print(persona.getIdpersona());%>" selected><%out.print(persona.getNombre()+" "+persona.getApellidos());%></option>
                                        
                                    <%}else{%>
                                    <option value="<%out.print(persona.getIdpersona());%>"><%out.print(persona.getNombre()+" "+persona.getApellidos());%></option>
                                    <%}
                                    }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">Rol:</td>
                            <td>
                                <select  class="form-control" name="f_idrol" value="">
                                    <%
                                    RolDAO rolDAO = new RolDAO();
                                    List<Rol> roles = rolDAO.listarol();
                                    Iterator<Rol> iterator2 = roles.iterator();
                                    Rol rol = null;
                                    while (iterator2.hasNext()) {
                                        rol = iterator2.next();
                                        
                                       if(rol.getIdrol()==sugerencia.getRol().getIdrol()){
                                    %>
                                    <option value="<%out.print(rol.getIdrol());%>" selected><%out.print(rol.getNombre());%></option>
                                    <%}else{%>
                                    %>
                                    <option value="<%out.print(rol.getIdrol());%>"><%out.print(rol.getNombre());%></option>
                                    <%}
                                    }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">Area:</td>
                            <td>
                                <select class="form-control" name="f_idarea" value="">
                                    <%
                                    AreaDAO areaDAO = new AreaDAO();
                                    List<Area> areas = areaDAO.listaarea();
                                    Iterator<Area> iterator3 = areas.iterator();
                                    Area area = null;
                                    while (iterator3.hasNext()) {
                                        area = iterator3.next();
                                        
                                        if(area.getIdarea()==sugerencia.getArea().getIdarea()){
                                    %>
                                    <option value="<%out.print(area.getIdarea());%>" selected><%out.print(area.getNombre());%></option>
                                    <%}else{%>
                                    %>
                                    <option value="<%out.print(area.getIdarea());%>"><%out.print(area.getNombre());%></option>
                                    <%}
                                    }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-center" colspan="2">
                                <input class="btn btn-primary" type="submit" name="editar" value="Editar Sugerencia" />
                                <input type="hidden" name="f_accion" value="editarsugerencia02" />
                                <input type="hidden" name="f_idsugerencia" value="<% out.print(sugerencia.getIdsugerencia()); %>" />
                                <a class="btn btn-success" href="Controlador?f_accion=listarsugerencia"><FONT COLOR="white">Regresar</a>
                            </td>
                            
                        </tr>
                    </tbody>
                    
                </table>

            </form>
            
        </div>
    </body>
</html>
