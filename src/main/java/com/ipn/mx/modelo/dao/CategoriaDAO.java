/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.CategoriaDTO;
import com.ipn.mx.modelo.dto.DatosGraficaDTO;
import java.sql.CallableStatement;
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
 * @author darkdestiny
 */
public class CategoriaDAO {
    private static final String SQL_INSERT="insert into Carrera (nombreCategoria, descripcionCategoria)";
    private static final String SQL_UPDATE="UPDATE Categoria SET nombreCategoria = ?, descripcionCategoria = ? WHERE idCategoria = ?";
    private static final String SQL_DELETE="DELETE FROM Categoria where idCategoria = ?";
    private static final String SQL_READ="SELECT * FROM Categoria WHERE idCategoria = ?";
    private static final String SQL_READ_ALL="SELECT * FROM Categoria";
    
    private static final String SQL_GRAFICAR="select Categoria.nombreCategoria, count(articulo.idArticulo) as cantidad from Categoria inner join Articulo on categoria.idCategoria = Articulo.idCategoria group by Categoria.idCategoria;";
 
    private Connection conexion;
    
     public Connection obtenerConexion() {
        //obtener conexion
        String usuario = "agjeoqixqijrxl";
        String clave = "03ecc93a9732396b7ea5106bd63a3013404066d2ece2095abb009ba1603b09c8";
        String url = "jdbc:postgresql://ec2-34-198-186-145.compute-1.amazonaws.com:5432/dcubv8l6n3mujq";
        //String url = "jdbc:mysql://localhost:3306/EscuelaWeb?
        //serverTimeZone=America/Mexico_City&allowPublicKeyRetrieval=true&
        //useSSL=false";

        String driverBD = "org.postgresql.Driver";

        try {
            Class.forName(driverBD);
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conexion;
    }

   public void create(CategoriaDTO dto) throws SQLException{
       obtenerConexion();
       CallableStatement cs = null;
       try{
           cs = conexion.prepareCall(SQL_INSERT);
           cs.setString(1, dto.getEntidad().getNombreCategoria());
           cs.setString(2, dto.getEntidad().getDescripcionCategoria());
           cs.executeUpdate();
       }finally{
           if (cs != null) cs.close();
           if (conexion != null) conexion.close();
       }
   }
   public void update(CategoriaDTO dto) throws SQLException{
       obtenerConexion();
       CallableStatement cs = null;
       try{
           cs = conexion.prepareCall(SQL_UPDATE);
           cs.setString(1, dto.getEntidad().getNombreCategoria());
           cs.setString(2, dto.getEntidad().getDescripcionCategoria());
           cs.setInt(3, dto.getEntidad().getIdCategoria());
           cs.executeUpdate();
       }finally{
           if (cs != null) cs.close();
           if (conexion != null) conexion.close();
       }
   }
   public void delete(CategoriaDTO dto) throws SQLException{
       obtenerConexion();
       CallableStatement cs = null;
       try{
           cs = conexion.prepareCall(SQL_DELETE);
           cs.setInt(1, dto.getEntidad().getIdCategoria());
           cs.executeUpdate();
       }finally{
           if (cs != null) cs.close();
           if (conexion != null) conexion.close();
       }
   }
   public CategoriaDTO read(CategoriaDTO dto) throws SQLException{
       obtenerConexion();
       CallableStatement cs = null;
       ResultSet rs = null;
       try{
           cs = conexion.prepareCall(SQL_READ);
           cs.setInt(1, dto.getEntidad().getIdCategoria());
           rs = cs.executeQuery();
           List resultados = obtenerResultados(rs);
           if (resultados.size() > 0){
               return (CategoriaDTO) resultados.get(0);
           }else{
               return null;
           }
       }finally{
           if (cs != null) cs.close();
           if (conexion != null) conexion.close();
       }
   }
   public List readAll() throws SQLException{
       obtenerConexion();
       CallableStatement cs = null;
       ResultSet rs = null;
       try{
           cs = conexion.prepareCall(SQL_READ_ALL);
           rs = cs.executeQuery();
           List resultados = obtenerResultados(rs);
           if (resultados.size() > 0){
               return  resultados;
           }else{
               return null;
           }
       }finally{
           if (cs != null) cs.close();
           if (conexion != null) conexion.close();
       }
   }

    private List obtenerResultados(ResultSet rs) throws SQLException{
        List resultados = new ArrayList();
        while (rs.next()) {     
            CategoriaDTO dto = new CategoriaDTO();
            dto.getEntidad().setIdCategoria(rs.getInt("idCategoria"));
            dto.getEntidad().setNombreCategoria(rs.getString("nombreCategoria"));
            dto.getEntidad().setDescripcionCategoria(rs.getString("descripcionCategoria"));
            resultados.add(dto);
        }
        return resultados;
    }
    
    
    public static void main(String[] args) {
        CategoriaDAO dao = new CategoriaDAO();
        //CategoriaDTO dto = new CategoriaDTO();
        //dto.getEntidad().setNombreCategoria("Línea Blanca");
        //dto.getEntidad().setDescripcionCategoria("Artículos de Línea Blanca");
        //dto.getEntidad().setIdCategoria(3);
        try {
            //dao.create(dto);
            //dao.update(dto);
            //System.out.println(dao.readAll());
            //System.out.println(dao.read(dto));
            //dao.delete(dto);
            System.out.println(dao.graficar());
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List graficar() throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List lista = new ArrayList<>();
        try{
            ps= conexion.prepareStatement(SQL_GRAFICAR);
            rs= ps.executeQuery();
            while (rs.next()) {
                DatosGraficaDTO datos = new DatosGraficaDTO();
                datos.setNombre(rs.getString("nombreCategoria"));
                datos.setCantidad(rs.getInt("cantidad"));
                lista.add(datos);
            }
        } finally{
            if(rs != null) 
                rs.close();
            if(ps != null) 
                ps.close();
            if(conexion != null) 
                conexion.close();
        }
        return lista;
    }
}
