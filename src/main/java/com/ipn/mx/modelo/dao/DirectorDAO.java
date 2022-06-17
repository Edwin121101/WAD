/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.DirectorDTO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Edwin VD
 */
public class DirectorDAO {
    
    private static final String SQL_INSERT = "INSERT INTO Director (nombreDirector, edad, biografia, nacionalidad, idPelicula) "
            + " values(?, ?, ?, ?, ?)";
    private static final String SQL_UPDATE = "UPDATE Director SET nombreDirector = ?, edad = ?, biografia = ?, nacionalidad = ?, idPelicula = ?"
            + " where idDirector = ?";
    private static final String SQL_DELETE = "DELETE FROM Director WHERE idDirector = ?";

    private static final String SQL_SELECT = "SELECT * FROM Director WHERE idDirector = ?";
    private static final String SQL_SELECT_ALL = "SELECT * FROM Director";

    private Connection conexion;

    public DirectorDAO() {
    }

    private void obtenerConexion() {
        //obtener conexion
        String usuario = "root";
        String clave = "root";
        String url = "jdbc:mysql://localhost:3306/Cinema22?serverTimezone=America/Mexico_City&allowPublicKeyRetrieval=true&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&useSSL=false";
        //String url = "jdbc:mysql://localhost:3306/EscuelaWeb?
        //serverTimeZone=America/Mexico_City&allowPublicKeyRetrieval=true&
        //useSSL=false";

        String driverBD = "com.mysql.cj.jdbc.Driver";

        try {
            Class.forName(driverBD);
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DirectorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void create(DirectorDTO dto) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_INSERT);
            ps.setString(1, dto.getEntidad().getNombreDirector());
            ps.setString(2, dto.getEntidad().getEdad());
            ps.setString(3, dto.getEntidad().getBiografia());
            ps.setString(4, dto.getEntidad().getNacionalidad());
            ps.setInt(5, dto.getEntidad().getIdPelicula());
            
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }

    }

    public void update(DirectorDTO dto) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_UPDATE);
            ps.setString(1, dto.getEntidad().getNombreDirector());
            ps.setString(2, dto.getEntidad().getEdad());
            ps.setString(3, dto.getEntidad().getBiografia());
            ps.setString(4, dto.getEntidad().getNacionalidad());
            ps.setInt(5, dto.getEntidad().getIdPelicula());
            ps.setInt(6, dto.getEntidad().getIdDirector().intValue());
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public void delete(DirectorDTO dto) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_DELETE);
            ps.setInt(1, dto.getEntidad().getIdDirector().intValue());
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public List readAll() throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List lista = null;
        try {
            ps = conexion.prepareStatement(SQL_SELECT_ALL);
            rs = ps.executeQuery();
            lista = obtenerResultados(rs);
            if (lista.size() > 0){
                return lista;
            }else{
                return null;
            }
            
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }
    public DirectorDTO read(DirectorDTO dto) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List lista = null;
        try {
            ps = conexion.prepareStatement(SQL_SELECT);
            ps.setLong(1, dto.getEntidad().getIdDirector());
            rs = ps.executeQuery();
            lista = obtenerResultados(rs);
            if (!lista.isEmpty()){
                return (DirectorDTO) lista.get(0);
            }else{
                return null;
            }
            
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
    }

    public static void main(String[] args) {
        DirectorDTO dto = new DirectorDTO();
        dto.getEntidad().setNombreDirector("Marcelo Tolces");
        dto.getEntidad().setEdad("54");
        dto.getEntidad().setBiografia("Biografia del Director");
        dto.getEntidad().setNacionalidad("Paraguay");
        dto.getEntidad().setIdPelicula('1');      
        dto.getEntidad().setIdDirector(1L);

        DirectorDAO dao = new DirectorDAO();
        try {
            System.out.println(dao.readAll());
            //dao.create(dto);
            //dao.delete(dto);
        } catch (SQLException ex) {
            Logger.getLogger(DirectorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private List obtenerResultados(ResultSet rs) throws SQLException{
        List resultados = new ArrayList();
        while (rs.next()) {            
            DirectorDTO dto = new DirectorDTO();
            dto.getEntidad().setIdDirector(rs.getLong("idDirector"));
            dto.getEntidad().setNombreDirector(rs.getString("nombreDirector"));
            dto.getEntidad().setEdad(rs.getString("edad"));
            dto.getEntidad().setBiografia(rs.getString("biografia"));
            dto.getEntidad().setNacionalidad(rs.getString("nacionalidad"));
            dto.getEntidad().setIdPelicula(rs.getInt("idPelicula"));           
            resultados.add(dto);
        }
        return resultados;
    }
    
}
