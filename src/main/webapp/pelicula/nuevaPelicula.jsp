<%-- 
    Document   : nuevaPelicula
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
  
        <title>Nueva Pelicula</title>
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
                                <a class="nav-link text-danger" href="listaDePeliculas.jsp">Cátalogo</a>
                            </li>


                        </ul>
                    </div>
                </div>
            </nav>
            <div class="mb-3"></div>
            <div class="card-header text-light">
                <h1 class="text-center">
                    Nueva Pelicula
                </h1>
            </div>

            <div class="mb-3"></div>     
            <section>
                <form class="center" method="post" action="agregarPelicula.jsp" name="frmDatos">
                    <div class="mb-3 nombres">
                        <label class="form-label text-danger" for="txtNombrePelicula"> Nombre Pelicula </label>
                        <input type="text" name="txtNombrePelicula" id="txtNombrePelicula"
                               placeholder="Nombre de la Pelicula"
                               class="form-control"
                               required
                               maxlength="50"/> 
                    </div>
                    <div class="mb-3 sinopsis">
                        <label class="form-label text-danger" for="txtSinopsisPelicula"> Sinopsis </label>
                        <input type="text" name="txtSinopsisPelicula" id="txtSinopsisPelicula"
                               placeholder="Sinopsis"
                               class="form-control"
                               required
                               maxlength="1000"/> 
                    </div>

                    <div class="mb-3 corto">
                        <label class="form-label text-danger" for="txtAno"> Año </label>
                        <input type="text" name="txtAno" id="txtAno"
                               placeholder="Año"
                               class="form-control"
                               required
                               maxlength="100"/> 
                    </div>
                    
                    <div class="mb-3 nombres">
                        <label class="form-label text-danger" for="txtDirectorPelicula"> Director </label>
                        <input type="text" name="txtDirectorPelicula" id="txtDirectorPelicula"
                               placeholder="Director de la Pelicula"
                               class="form-control"
                               required
                               maxlength="100"/> 
                    </div>

                    <div class="mb-3" style="text-align: initial">
                        <input class="btn btn-outline-light" type="submit" name="cmdEnviar" value="Enviar"/>
                    </div>

                </form>

            </section>
        </div>
    </body>
</html>