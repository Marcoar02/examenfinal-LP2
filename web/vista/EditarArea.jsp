<%@page import="modeloDAO.AreaDAO"%>
<%@page import="Modelo.Area"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Area</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <%
                AreaDAO areaDAO = new AreaDAO();
                int s_idarea = Integer.valueOf(request.getParameter("f_idarea"));
                Area area = (Area)areaDAO.buscararea(s_idarea);                
            %>
            <form name="EditarAreasForm" action="Controlador" method="get">
                <table  class="table">
                    <thead>
                        <tr>
                            <th class="text-center" colspan="2">Editar Areas</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-right">Nombre: </td>
                            <td><input class="form-control" type="text" name="f_nombre" value="<% out.print(area.getNombre()); %>" maxlength="20" size="20" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Estado</td>
                            <td>
                                <select class="form-control" name="f_estado" value="<% out.print(area.getEstado()); %>">
                                    <%
                                        if(area.getEstado()== "A"){%>
                                            <option value="<% out.print(area.getEstado()); %>"><% out.print(area.getEstado()); %></option>
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
                                <input class="btn btn-primary" type="submit" name="editar" value="Editar Area" />
                                <input type="hidden" name="f_accion" value="editararea02" />
                                <input type="hidden" name="f_idarea" value="<% out.print(area.getIdarea()); %>" />
                                <a class="btn btn-success" href="Controlador?f_accion=listararea"><FONT COLOR="white">Regresar</a>
                            </td>
                            
                        </tr>
                    </tbody>
                    
                </table>

            </form>
            
        </div>
    </body>
</html>
