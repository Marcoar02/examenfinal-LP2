<%@page import="Modelo.Rol"%>
<%@page import="modeloDAO.RolDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Rol</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <%
                RolDAO rolDAO = new RolDAO();
                int s_idrol = Integer.valueOf(request.getParameter("f_idrol"));
                Rol rol = (Rol)rolDAO.buscarrol(s_idrol);                
            %>
            <form name="EditarRolesForm" action="Controlador" method="get">
                <table  class="table">
                    <thead>
                        <tr>
                            <th class="text-center" colspan="2">Editar Roles</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-right">Nombre: </td>
                            <td><input class="form-control" type="text" name="f_nombre" value="<% out.print(rol.getNombre()); %>" maxlength="20" size="20" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Estado</td>
                            <td>
                                <select class="form-control" name="f_estado" value="<% out.print(rol.getEstado()); %>">
                                    <%
                                        if(rol.getEstado()== "A"){%>
                                            <option value="<% out.print(rol.getEstado()); %>"><% out.print(rol.getEstado()); %></option>
                                            <option value="B">B</option>
                                    <%    }else{%>
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                    <%    }
                                    %>
                                    
                                </select>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="text-center" colspan="2">
                                <input class="btn btn-primary" type="submit" name="editar" value="Editar Rol" />
                                <input type="hidden" name="f_accion" value="editarrol02" />
                                <input type="hidden" name="f_idrol" value="<% out.print(rol.getIdrol()); %>" />
                                <a class="btn btn-success" href="Controlador?f_accion=listarrol"><FONT COLOR="white">Regresar</a>
                            </td>
                            
                        </tr>
                    </tbody>
                    
                </table>

            </form>
            
        </div>
    </body>
</html>
