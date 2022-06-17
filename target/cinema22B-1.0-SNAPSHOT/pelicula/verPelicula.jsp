<%-- 
    Document   : verCarrera
    Created on : 24 mar. 2022, 07:16:14
    Author     : Edwin VD
--%>

<%@page import="com.ipn.mx.modelo.dao.PeliculaDAO" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.List" %>
<%@page import="com.ipn.mx.modelo.dto.PeliculaDTO" %>
<!DOCTYPE html>
<html>
    <head>

        <title>Ver Pelicula</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/> 
        <link rel="stylesheet" href="../styles/styles.css" type="text/css">
    </head>
    <body>
        <div class="container">
            <div class="mb-3"></div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand text-danger" href="#">Cinema22 </a>
                    <button class="navbar-toggler text-danger" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon text-danger"></span>
                    </button>
                    <div class="collapse navbar-collapse text-danger" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active text-danger" aria-current="page" href="../index.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-danger" href="../seccion/listaDeSecciones.jsp">Secciones</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-danger" href="../director/listaDeDirectores.jsp">Directores</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="mb-3"></div>
            
                <div class="card-header text-light">
                    <h1 class="text-center">
                        Datos de Pelicula
                    </h1>
                </div>
                
                    <a href="listaDePeliculas.jsp" class="btn btn-outline-light">Regresar al Catálogo</a>
                    <div class="mb-3"></div>
                    <table class="table table-dark table-hover alineacion">
                        <tr class="items">
                            <th>Clave de la Pelicula</th>
                            <th>Nombre de la Pelicula</th>
                            <th>Sinopsis de la Pelicula</th>
                            <th>Año</th>
                            <th>Director de la Pelicula</th>
                        </tr>
                        <%
                        PeliculaDAO dao = new PeliculaDAO();
                        PeliculaDTO dto = new PeliculaDTO();
                        dto.getEntidad().setIdPelicula(Long.parseLong(request.getParameter("id")));
                        try {
                            dto = dao.read(dto);
                           
            
                        } catch (SQLException ex) {
            
                        }
                        %>


                        <tr>
                            <td>
                                <%= dto.getEntidad().getIdPelicula() %>

                            </td>
                            <td>
                                <%= dto.getEntidad().getNombrePelicula() %>
                            </td>
                            <td>
                                <%= dto.getEntidad().getSinopsisPelicula() %>
                            </td>
                            <td>
                                <%= dto.getEntidad().getAno() %>
                            </td>
                            <td>
                                <%= dto.getEntidad().getDirectorPelicula() %>
                            </td>
                        </tr>
                    </table>
                </div>
            
    </body>
</html>