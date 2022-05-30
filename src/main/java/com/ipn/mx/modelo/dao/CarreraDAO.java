/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.CarreraDTO;
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
public class CarreraDAO {

    private static final String SQL_INSERT = "insert into Carrera (nombreCarrera, descripcionCarrera) "
            + " values(?, ?)";
    private static final String SQL_UPDATE = "UPDATE Carrera SET nombreCarrera = ?, descripcionCarrera = ? WHERE idCarrera = ?";
    private static final String SQL_DELETE = "delete from Carrera where idCarrera = ?";

    private static final String SQL_SELECT = "select * from Carrera where idCarrera = ?";
    private static final String SQL_SELECT_ALL = "select * from Carrera";

    private Connection conexion;

    public CarreraDAO() {
    }

    private void obtenerConexion() {
        //obtener conexion
        String usuario = "root";
        String clave = "root";
        String url = "jdbc:mysql://localhost:3306/EscuelaWeb?serverTimezone=America/Mexico_City&allowPublicKeyRetrieval=true&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&useSSL=false";
        //String url = "jdbc:mysql://localhost:3306/EscuelaWeb?
        //serverTimeZone=America/Mexico_City&allowPublicKeyRetrieval=true&
        //useSSL=false";

        String driverBD = "com.mysql.cj.jdbc.Driver";

        try {
            Class.forName(driverBD);
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CarreraDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void create(CarreraDTO dto) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_INSERT);
            ps.setString(1, dto.getEntidad().getNombreCarrera());
            ps.setString(2, dto.getEntidad().getDescripcionCarrera());
            //s.setInt(3, (int) dto.getEntidad().getIdCarrera().longValue());
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

    public void update(CarreraDTO dto) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_UPDATE);
            ps.setString(1, dto.getEntidad().getNombreCarrera());
            ps.setString(2, dto.getEntidad().getDescripcionCarrera());
            ps.setLong(3, dto.getEntidad().getIdCarrera());
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

    public void delete(CarreraDTO dto) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_DELETE);
            ps.setInt(1, dto.getEntidad().getIdCarrera().intValue());
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
    public CarreraDTO read(CarreraDTO dto) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List lista = null;
        try {
            ps = conexion.prepareStatement(SQL_SELECT);
            ps.setLong(1, dto.getEntidad().getIdCarrera());
            rs = ps.executeQuery();
            lista = obtenerResultados(rs);
            if (!lista.isEmpty()){
                return (CarreraDTO) lista.get(0);
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
        CarreraDTO dto = new CarreraDTO();
        dto.getEntidad().setNombreCarrera("Ingenieria en Inteligemncia Artificial");
        dto.getEntidad().setDescripcionCarrera("Cosas de Inteligencia Artificial");
        dto.getEntidad().setIdCarrera(1L);

        CarreraDAO dao = new CarreraDAO();
        try {
            System.out.println(dao.readAll());
            //dao.create(dto);
            //dao.delete(dto);
        } catch (SQLException ex) {
            Logger.getLogger(CarreraDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private List obtenerResultados(ResultSet rs) throws SQLException{
        List resultados = new ArrayList();
        while (rs.next()) {            
            CarreraDTO dto = new CarreraDTO();
            dto.getEntidad().setIdCarrera(rs.getLong("idCarrera"));
            dto.getEntidad().setNombreCarrera(rs.getString("nombreCarrera"));
            dto.getEntidad().setDescripcionCarrera(rs.getString("descripcionCarrera"));
            resultados.add(dto);
        }
        return resultados;
    }

}
