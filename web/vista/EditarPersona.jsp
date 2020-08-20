<%@page import="modeloDAO.PersonaDAO"%>
<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Persona</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <%
                PersonaDAO personaDAO = new PersonaDAO();
                int s_idpersona = Integer.valueOf(request.getParameter("f_idpersona"));
                Persona persona = (Persona)personaDAO.buscarpersona(s_idpersona);                
            %>
            <form name="EditarPersonasForm" action="Controlador" method="get">
                <table  class="table">
                    <thead>
                        <tr>
                            <th class="text-center" colspan="2">Editar Personas</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-right">Nombre: </td>
                            <td><input class="form-control" type="text" name="f_nombre" value="<% out.print(persona.getNombre()); %>" maxlength="20" size="20" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Apellidos: </td>
                            <td><input class="form-control" type="text" name="f_apellidos" value="<% out.print(persona.getApellidos()); %>" maxlength="40" size="20" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">DNI: </td>
                            <td><input class="form-control" type="text" name="f_dni" value="<% out.print(persona.getDni()); %>" maxlength="8" size="8" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Dirección</td>
                            <td><input class="form-control" type="text" name="f_direccion" value="<% out.print(persona.getDireccion()); %>" maxlength="50" size="30" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Estado</td>
                            <td>
                                <select class="form-control" name="f_estado" value="<% out.print(persona.getEstado()); %>">
                                    <%
                                        if(persona.getEstado()== "A"){%>
                                            <option value="<% out.print(persona.getEstado()); %>"><% out.print(persona.getEstado()); %></option>
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
                                <input class="btn btn-primary" type="submit" name="editar" value="Editar Persona" />
                                <input type="hidden" name="f_accion" value="editarpersona02" />
                                <input type="hidden" name="f_idpersona" value="<% out.print(persona.getIdpersona()); %>" />
                                <a class="btn btn-success" href="Controlador?f_accion=listarpersona"><FONT COLOR="white">Regresar</a>
                            </td>
                            
                        </tr>
                    </tbody>
                    
                </table>

            </form>
            
        </div>
    </body>
</html>
