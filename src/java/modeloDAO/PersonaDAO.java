
package modeloDAO;

import Config.bd.ConectaBd;
import Interfaces.CRUD;

import Modelo.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class PersonaDAO implements CRUD {
    ConectaBd cn = new ConectaBd();
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Persona e = new Persona();

    @Override
    public List listapersona() {
        ArrayList<Persona> personas = new ArrayList<>();
        String consulta = " select * "
                        + " from persona ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {                
                Persona persona = new Persona();
                persona.setIdpersona(rs.getInt("idpersona"));
                persona.setNombre(rs.getString("nombre"));
                persona.setApellidos(rs.getString("apellidos"));
                persona.setDni(rs.getString("dni"));
                persona.setDireccion(rs.getString("direccion"));
                persona.setEstado(rs.getString("estado"));
                personas.add(persona);
            }
        } catch (Exception e) {
        }
        return personas;
    }

    @Override
    public Persona buscarpersona(int idpersona) {
        String consulta = " select * "
                        + " from persona  "
                        + " where idpersona = "+ idpersona +" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {                
                e.setIdpersona(rs.getInt("idpersona"));
                e.setNombre(rs.getString("nombre"));
                e.setApellidos(rs.getString("apellidos"));
                e.setDni(rs.getString("dni"));
                e.setDireccion(rs.getString("direccion"));
                e.setEstado(rs.getString("estado"));                
            }
        } catch (Exception e) {
        }
        return e;
    }

    @Override
    public boolean agregarpersona(Persona persona) {
        String consulta = " insert into persona(nombre, apellidos, dni, direccion, estado) "
                        + " values(  "
                        + "'"+ persona.getNombre() +"',  "
                        + "'"+ persona.getApellidos() +"',  "
                        + "'"+ persona.getDni() +"',  "
                        + "'"+ persona.getDireccion() +"',  "
                        + "'"+ persona.getEstado() +"'); ";

        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean editarpersona(Persona persona) {
         String consulta =   " update persona  "
                        +   " set "
                        +   " nombre = '"+ persona.getNombre() +"',"
                        +   " apellidos = '"+ persona.getApellidos()+"', "
                        +   " dni = '"+ persona.getDni()+"', "
                        +   " direccion = '"+ persona.getDireccion()+"', "
                        +   " estado = '"+ persona.getEstado() +"'  "
                        +   " where "
                        +   " idpersona = "+ persona.getIdpersona() +" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminarpersona(int idpersona) {
        String consulta =   " delete from persona "
                        +   " where " 
                        +   " idpersona = "+ idpersona +" ; ";

        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
        
    }
    
    public boolean validareliminacion(int idpersona) {
        boolean valido = true;
        String consulta = "select * from sugerencia where idpersona = "+idpersona;
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            
            if(rs.last()){
                valido = false;
            }
            
        } catch (Exception e) {
        }
        return valido;
    }
    
}

