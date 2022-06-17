<%-- 
    Document   : nuevaSeccion
    Created on : 26 mar. 2022, 10:49:25
    Author     : Edwin VD
--%>

<%@page import="com.ipn.mx.modelo.dao.SeccionDAO" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.List" %>
<%@page import="com.ipn.mx.modelo.dto.SeccionDTO" %>
<!DOCTYPE html>
<html>
    <head>
        <title>nuevaAlumno</title>
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
                                <a class="nav-link text-danger" href="../pelicula/listaDePeliculas.jsp">Cat�logo</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="mb-3"></div>

                <div class="card-header text-light">
                    <h1 class="text-center">
                        Nueva Secci�n
                    </h1>
                </div>
            
                <div class="mb-3"></div>
                                
                <section>
                    <form class="center" method="post" action="agregarSeccion.jsp" name="frmDatos">
                        <div class="mb-3 nombres">
                        <label class="form-label text-danger" for="txtNombreSeccion"> Seccion </label>
                        <input type="text" name="txtNombreSeccion" id="txtNombreSeccion"
                            placeholder="Nombre de la Seccion"
                            class="form-control"
                            required
                            maxlength="50"/> 
                        </div>
                        <div class="mb-3 corto">
                        <label class="form-label text-danger" for="txtIdPelicula"> Clave de Pelicula </label>
                        <input type="number" name="txtIdPelicula" id="txtIdPelicula"
                            placeholder="Id Pelicula"
                            class="form-control"
                            required
                            maxlength="10"/> 
                        </div>
                        
                        <div class="mb-3" style="text-align: initial">
                        <input class="btn btn-outline-light" type="submit" name="cmdEnviar" value="Enviar"/>
                        </div>
                    </form>
                        
                </section>
            </div>

    </body>
</html>
