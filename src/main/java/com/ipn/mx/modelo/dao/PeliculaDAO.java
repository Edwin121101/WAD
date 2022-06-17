/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.PeliculaDTO;
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
public class PeliculaDAO {
    private static final String SQL_INSERT = "INSERT INTO Pelicula (nombrePelicula, sinopsisPelicula, ano, directorPelicula) "
            + " values(?, ?, ?, ?)";
    private static final String SQL_UPDATE = "UPDATE Pelicula SET nombrePelicula = ?, sinopsisPelicula = ?, ano = ?,  directorPelicula = ? "
            + "WHERE idPelicula = ?";
    private static final String SQL_DELETE = "DELETE FROM Pelicula WHERE idPelicula = ?";
    private static final String SQL_SELECT = "SELECT * FROM Pelicula WHERE idPelicula = ?";
    private static final String SQL_SELECT_ALL = "SELECT * FROM Pelicula";

    private Connection conexion;

    public PeliculaDAO() {
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
            Logger.getLogger(PeliculaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void create(PeliculaDTO dto) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_INSERT);
            ps.setString(1, dto.getEntidad().getNombrePelicula());
            ps.setString(2, dto.getEntidad().getSinopsisPelicula());
            ps.setString(3, dto.getEntidad().getAno());
            ps.setString(4, dto.getEntidad().getDirectorPelicula());
            //s.setInt(5, (int) dto.getEntidad().getIdCarrera().longValue());
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

    public void update(PeliculaDTO dto) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_UPDATE);
            ps.setString(1, dto.getEntidad().getNombrePelicula());
            ps.setString(2, dto.getEntidad().getSinopsisPelicula());
            ps.setString(3, dto.getEntidad().getAno());
            ps.setString(4, dto.getEntidad().getDirectorPelicula());
            ps.setLong(5, dto.getEntidad().getIdPelicula());
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

    public void delete(PeliculaDTO dto) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        try {
            ps = conexion.prepareStatement(SQL_DELETE);
            ps.setInt(1, dto.getEntidad().getIdPelicula().intValue());
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
    public PeliculaDTO read(PeliculaDTO dto) throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List lista = null;
        try {
            ps = conexion.prepareStatement(SQL_SELECT);
            ps.setLong(1, dto.getEntidad().getIdPelicula());
            rs = ps.executeQuery();
            lista = obtenerResultados(rs);
            if (!lista.isEmpty()){
                return (PeliculaDTO) lista.get(0);
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
        PeliculaDTO dto = new PeliculaDTO();
        dto.getEntidad().setNombrePelicula("Nombre de una gran película");
        dto.getEntidad().setSinopsisPelicula("Cosas de Sinopsis");
        dto.getEntidad().setAno("1982");
        dto.getEntidad().setDirectorPelicula("Un director");
        dto.getEntidad().setIdPelicula(1L);

        PeliculaDAO dao = new PeliculaDAO();
        try {
            System.out.println(dao.readAll());
            //dao.create(dto);
            //dao.delete(dto);
        } catch (SQLException ex) {
            Logger.getLogger(PeliculaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private List obtenerResultados(ResultSet rs) throws SQLException{
        List resultados = new ArrayList();
        while (rs.next()) {            
            PeliculaDTO dto = new PeliculaDTO();
            dto.getEntidad().setIdPelicula(rs.getLong("idPelicula"));
            dto.getEntidad().setNombrePelicula(rs.getString("nombrePelicula"));
            dto.getEntidad().setSinopsisPelicula(rs.getString("sinopsisPelicula"));
            dto.getEntidad().setAno(rs.getString("ano"));
            dto.getEntidad().setDirectorPelicula(rs.getString("directorPelicula"));
            resultados.add(dto);
        }
        return resultados;
    }
}
