<%-- 
    Document   : agregarCarrera
    Created on : 24 mar. 2022, 07:16:01
    Author     : Edwin VD
--%>


<%@page import="com.ipn.mx.modelo.dao.PeliculaDAO" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.List" %>
<%@page import="com.ipn.mx.modelo.dto.PeliculaDTO" %>
<!DOCTYPE html>
<html>
    <head>
       
        <title>JSP Page</title>
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
                                <a class="nav-link text-danger" href="listaDeCarreras.jsp">Listado de Carreras</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="mb-3"></div>
            <div class="card border-light">
                
                <div class="mb-3"></div>

                <%
                    PeliculaDTO dto = new PeliculaDTO();
                    dto.getEntidad().setNombrePelicula(request.getParameter("txtNombrePelicula"));
                    dto.getEntidad().setSinopsisPelicula(request.getParameter("txtSinopsisPelicula"));
                    dto.getEntidad().setAno(request.getParameter("txtAno"));
                    dto.getEntidad().setDirectorPelicula(request.getParameter("txtDirectorPelicula"));
                    PeliculaDAO dao = new PeliculaDAO();
                 %>
                 
                 <%
                    try {
                        dao.create(dto);
                        out.println("<div class='alert alert-success d-flex align-items-center' role='alert'>");
                        out.println("Registro insertado correctamente");
                        out.println("</div>");
                    } catch (SQLException ex) {
                        out.println("<h2> No se ha agregado una carrera</h2>");
                    }
                %>
                
                
            </div>
                <div class='mb-3'></div>
                    <a class='btn btn-outline-light'  href='listaDePeliculas.jsp'>Catálogo</a>
    </body>
</html>

