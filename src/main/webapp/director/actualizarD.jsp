<%-- 
    Document   : actualizarC
    Created on : 24 mar. 2022, 22:53:56
    Author     : Edwin VD
--%>

<%@page import="com.ipn.mx.modelo.dao.DirectorDAO" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.List" %>
<%@page import="com.ipn.mx.modelo.dto.DirectorDTO" %>
<!DOCTYPE html>
<html>
    <head>
        <title>ActualizarD</title>
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

            <div class="card border-light">

                <div class="mb-3"></div>            


                <%
                   try {
                        DirectorDAO dao = new DirectorDAO();
                        DirectorDTO dto = new DirectorDTO();
                                 
                        if(request.getParameter("txtIdDirector") != null ){
                            dto.getEntidad().setIdDirector(Long.parseLong(request.getParameter("txtIdDirector").trim()));
                            dto.getEntidad().setNombreDirector(request.getParameter("txtNombreDirector"));
                            dto.getEntidad().setEdad(request.getParameter("txtEdad"));
                            dto.getEntidad().setBiografia(request.getParameter("txtBiografia"));
                            dto.getEntidad().setNacionalidad(request.getParameter("txtNacionalidad"));
                            int carrera = Integer.parseInt(request.getParameter("txtIdPelicula"));
                            dto.getEntidad().setIdPelicula(carrera);
                       
                            dao.update(dto);
                            out.println("<div class='alert alert-success' role='alert'>");
                            out.println("Registro actualizado correctamente");
                            out.println("</div>");
                        }
                   
                   } catch (SQLException ex) {
                       out.println("<h2> No se ha agregado un director</h2>");
                   }
                %>
            </div>

            <div class='mb-3'></div>
            <a class='btn btn-outline-light'  href='listaDeDirectores.jsp'>Regresar</a>



    </body>
</html>
