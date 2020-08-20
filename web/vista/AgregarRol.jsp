<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Rol</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <form name="AgregarRolForm" action="Controlador" method="get">
                <table class="table">
                    <thead>
                        <tr>
                            <th class="text-center" colspan="2">Agregar Roles</th>                            
                        </tr>
                        <tr></tr>
                    </thead>
        
                    <tbody>
                        <tr>
                            <td class="text-right">Nombre: </td>
                            <td><input class="form-control" type="text" name="f_nombre" value="" maxlength="30" /></td>
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
                                <input class="btn btn-primary" type="submit" name="agregar" value="Agregar Rol" />
                                <input type="hidden" name="f_accion" value="agregarrol02" />
                                <a class="btn btn-success" href="Controlador?f_accion=listarrol"><FONT COLOR="white">Regresar</a>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </form>
        </div>
    </body>
</html>

