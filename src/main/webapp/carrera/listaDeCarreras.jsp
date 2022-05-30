<%-- 
    Document   : listaDeCarreras
    Created on : 24 mar. 2022, 07:15:23
    Author     : darkdestiny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ipn.mx.modelo.dao.CarreraDAO" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.List" %>
<%@page import="com.ipn.mx.modelo.dto.CarreraDTO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Carrera</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    </head>
    <body>
        <div class="container">
            <div class="mb-3"></div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand text-primary" href="#">Escuela Web </a>
                    <button class="navbar-toggler text-primary" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse text-primary" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active text-primary" aria-current="page" href="../index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-primary" href="../alumno/listaDeAlumnos.jsp">Lista de Alumnos</a>
                            </li>


                        </ul>
                    </div>
                </div>
            </nav>
            <div class="mb-3"></div>
            <div class="card border-primary">
                <div class="card-header text-primary">
                    <h1 class="text-center">
                        Listado de Carreras
                    </h1>
                </div>
                <div class="card-body text-primary">
                    <a href="nuevaCarrera.jsp" class="btn btn-outline-primary">Nuevo</a>   
                    <div class="mb-3"></div>
                    <table class="table table-striped" style="text-align: center";>
                        <tr>
                            <th>Clave de la Carrera</th>
                            <th>Nombre de la Carrera</th>
                            <th>Descripción de la Carrera</th>
                            <th>Eliminar</th>
                            <th>Actualizar</th>

                        </tr>
                        <%
                        CarreraDAO dao = new CarreraDAO();
                        List lista = dao.readAll();
                        if(lista != null){
                            for(int i =0; i < lista.size(); i++){
                                CarreraDTO dto = (CarreraDTO) lista.get(i);
                            %>
                            <tr>
                                <td>
                                     <a href="verCarrera.jsp?id=<%= dto.getEntidad().getIdCarrera() %>" class="btn btn-outline-info">
                                        <%= dto.getEntidad().getIdCarrera() %>
                                    </a>
                                </td>
                                <td>
                                    <%= dto.getEntidad().getNombreCarrera() %>
                                </td>
                                <td>
                                    <%= dto.getEntidad().getDescripcionCarrera() %>
                                </td>
                                <td>
                                    
                                    <a href="eliminarCarrera.jsp?id=<%= dto.getEntidad().getIdCarrera() %>" class="btn btn-danger">
                                        Eliminar
                                    </a>
                                </td>
                                <td>
                                    
                                    <a href="actualizarCarrera.jsp?id=<%= dto.getEntidad().getIdCarrera() %>" class="btn btn-outline-success">
                                        Actualizar
                                    </a>
                                </td>
                            </tr>
                            
                            <%
                            }
                        }else{
                            out.println("<td colspan=5> No hay registros a mostrar </td>");
                        }
                        
                        
                       
                        %>


                    </table>
                </div>
            </div>

        </div>
    </body>
</html>