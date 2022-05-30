<%-- 
    Document   : verCarrera
    Created on : 24 mar. 2022, 07:16:14
    Author     : Edwin VD
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
        <title>Ver Carrera</title>
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
                                <a class="nav-link text-primary" href="listaDeCarreras.jsp">Listado de Carreras</a>
                            </li>


                        </ul>
                    </div>
                </div>
            </nav>
            <div class="mb-3"></div>
            <div class="card border-primary">
                <div class="card-header text-primary">
                    <h1 class="text-center">
                        Datos de Carrera
                    </h1>
                </div>
                <div class="card-body text-primary">
                    <a href="listaDeCarreras.jsp" class="btn btn-outline-primary">Regresar</a>
                    <div class="mb-3"></div>
                    <table class="table table-striped" style="text-align:center";>
                        <tr>
                            <th>Clave de la Carrera</th>
                            <th>Nombre de la Carrera</th>
                            <th>Descripción de la Carrera</th>


                        </tr>
                        <%
                        CarreraDAO dao = new CarreraDAO();
                        CarreraDTO dto = new CarreraDTO();
                        dto.getEntidad().setIdCarrera(Long.parseLong(request.getParameter("id")));
                        try {
                            dto = dao.read(dto);
                           
            
                        } catch (SQLException ex) {
            
                        }
                        %>


                        <tr>
                            <td>
                                <%= dto.getEntidad().getIdCarrera() %>

                            </td>
                            <td>
                                <%= dto.getEntidad().getNombreCarrera() %>
                            </td>
                            <td>
                                <%= dto.getEntidad().getDescripcionCarrera() %>
                            </td>

                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>