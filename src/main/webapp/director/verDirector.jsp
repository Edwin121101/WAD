<%-- 
    Document   : verDirector
    Created on : 26 mar. 2022, 01:48:50
    Author     : Edwin VD
--%>


<%@page import="com.ipn.mx.modelo.dao.DirectorDAO" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.List" %>
<%@page import="com.ipn.mx.modelo.dto.DirectorDTO" %>
<!DOCTYPE html>
<html>
    <head>
     
        <title>Ver Director</title>
        <link rel="stylesheet" href="../styles/styles.css" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/> 
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
                                <a class="nav-link text-danger" href="../pelicula/listaDePeliculas.jsp">Catálogo</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="mb-3"></div>
                <div class="card-header text-light">
                    <h1 class="text-center">
                        Datos del Director
                    </h1>
                </div>
                <div class="card-body text-primary">
                    <a href="listaDeDirectores.jsp" class="btn btn-outline-light">Regresar</a>
                    <div class="mb-3"></div>
                    <table class="table table-dark table-hover alineacion">
                        <tr class="items">
                            <th>Clave</th>
                            <th>Nombre del Director</th>
                            <th>Edad</th>
                            <th>Biografia</th>
                            <th>Nacionalidad</th>
                            <th>Clave de Pelicula</th>


                        </tr>
                        <%
                        DirectorDAO dao = new DirectorDAO();
                        DirectorDTO dto = new DirectorDTO();
                        dto.getEntidad().setIdDirector(Long.parseLong(request.getParameter("id")));
                        try {
                            dto = dao.read(dto);
                           
            
                        } catch (SQLException ex) {
            
                        }
                        %>


                        <tr>
                            <td>
                                <%= dto.getEntidad().getIdDirector() %>

                            </td>
                            <td>
                                <%= dto.getEntidad().getNombreDirector() %>
                            </td>
                            <td>
                                <%= dto.getEntidad().getEdad() %>
                            </td>
                            <td>
                                <%= dto.getEntidad().getBiografia() %>
                            </td>
                            <td>
                                <%= dto.getEntidad().getNacionalidad() %>
                            </td>
                            <td>
                                <%= dto.getEntidad().getIdPelicula() %>
                            </td>

                        </tr>
                    </table>
                </div>
            </div>
    </body>
</html>
