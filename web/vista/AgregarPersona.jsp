<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Persona</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <form name="AgregarPersonaForm" action="Controlador" method="get">
                <table class="table">
                    <thead>
                        <tr>
                            <th class="text-center" colspan="2">Agregar Personas</th>                            
                        </tr>
                        <tr></tr>
                    </thead>
        
                    <tbody>
                        <tr>
                            <td class="text-right">Nombre: </td>
                            <td><input class="form-control" type="text" name="f_nombre" value="" maxlength="30" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Apellidos: </td>
                            <td><input class="form-control" type="text" name="f_apellidos" value="" maxlength="40"  /></td>
                        </tr>
                        <tr>
                            <td class="text-right">DNI: </td>
                            <td><input class="form-control" type="text" name="f_dni" value="" maxlength="8" /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Direccion</td>
                            <td><input class="form-control" type="text" name="f_direccion" value="" maxlength="50"  /></td>
                        </tr>
                        <tr>
                            <td class="text-right">Estado</td>
                            <td>
                                <select class="form-control" name="f_estado" value="" >
                                    <option value ="A">A</option>
                                    <option value ="B">B</option>
                                </select>
                            </td>
                            <!--<td><input class="form-control" type="text" name="f_estado" value="" maxlength="1" size="2" /></td>-->
                        </tr>
                        <tr>
                            <td class="text-center" colspan="2">
                                <input class="btn btn-primary" type="submit" name="agregar" value="Agregar Persona" />
                                <input type="hidden" name="f_accion" value="agregarpersona02" />
                                <a class="btn btn-success" href="Controlador?f_accion=listarpersona"><FONT COLOR="white">Regresar</a>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </form>
        </div>
    </body>
</html>
