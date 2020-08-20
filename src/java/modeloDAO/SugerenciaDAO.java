
package modeloDAO;

import Config.bd.ConectaBd;
import Interfaces.CRUD_Sugerencia;
import Modelo.Area;
import Modelo.Persona;
import Modelo.Rol;
import Modelo.Sugerencia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class SugerenciaDAO implements CRUD_Sugerencia {
    ConectaBd cn = new ConectaBd();
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Sugerencia e = new Sugerencia();
    PersonaDAO personaDAO = new PersonaDAO();

    @Override
    public List listarsugerencia() {
        ArrayList<Sugerencia> sugerencias = new ArrayList<>();
        String consulta = " select  s.idsugerencia,s.fecha, s.descripcion, p.nombre,p.apellidos, r.nombre, a.nombre "
                        + " from sugerencia s, persona p, rol r, area a "
                        + " where s.idpersona = p.idpersona and s.idrol= r.idrol and s.idarea= a.idarea"
                        + " order by s.fecha, p.apellidos ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {                
                Sugerencia sugerencia = new Sugerencia();
                Persona persona = new Persona();
                Area area = new Area();
                Rol rol = new Rol();
                sugerencia.setIdsugerencia(rs.getInt("s.idsugerencia"));
                sugerencia.setFecha(rs.getString("s.fecha"));
                sugerencia.setDescripcion(rs.getString("s.descripcion"));
                persona.setNombre(rs.getString("p.nombre"));
                persona.setApellidos(rs.getString("p.apellidos"));
                sugerencia.setPersona(persona);
                rol.setNombre(rs.getString("r.nombre"));
                sugerencia.setRol(rol);
                area.setNombre(rs.getString("a.nombre"));
                sugerencia.setArea(area);                
                sugerencias.add(sugerencia);
            }
        } catch (Exception e) {
        }
        return sugerencias;
    }

    @Override
    public Sugerencia buscarsugerencia(int idsugerencia) {
        String consulta = " select * "
                        + " from sugerencia  "
                        + " where idsugerencia = "+ idsugerencia +" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                Persona persona = new Persona();
                Area area = new Area();
                Rol rol = new Rol();
                e.setIdsugerencia(rs.getInt("idsugerencia"));
                e.setFecha(rs.getString("fecha"));
                e.setDescripcion(rs.getString("descripcion"));
                persona.setIdpersona(rs.getInt("idpersona"));
                e.setPersona(persona);
                rol.setIdrol(rs.getInt("idrol"));
                e.setRol(rol);
                area.setIdarea(rs.getInt("idarea"));
                e.setArea(area);
            }
        } catch (Exception e) {
        }
        return e;
    }

    @Override
    public boolean agregarsugerencia(Sugerencia sugerencia) {
        String consulta = " insert into sugerencia(fecha, descripcion, idpersona, idrol, idarea) "
                        + " values(  "
                        + "'"+ sugerencia.getFecha()+"',  "
                        + "'"+ sugerencia.getDescripcion()+"',  "
                        + "'"+ sugerencia.getPersona().getIdpersona()+"',  "
                        + "'"+ sugerencia.getRol().getIdrol()+"',  "
                        + "'"+ sugerencia.getArea().getIdarea()+"'); ";

        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean editarsugerencia(Sugerencia sugerencia) {
         String consulta =   " update sugerencia  "
                        +   " set "
                        +   " fecha = '"+ sugerencia.getFecha() +"',"
                        +   " descripcion = '"+ sugerencia.getDescripcion() +"',  "
                        +   " idpersona = '"+ sugerencia.getPersona().getIdpersona() +"',  "
                        +   " idrol = '"+ sugerencia.getRol().getIdrol()+"',  "
                        +   " idarea = '"+ sugerencia.getArea().getIdarea() +"'  "
                        +   " where "
                        +   " idsugerencia = "+ sugerencia.getIdsugerencia() +" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminarsugerencia(int idsugerencia) {
        String consulta =   " delete from sugerencia "
                        +   " where " 
                        +   " idsugerencia = "+ idsugerencia +" ; ";

        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
        
    }

             
}

