<%-- 
    Document   : index
    Created on : 05 may. 2022, 01:20:34
    Author     : Edwin VD
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Cinema22</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="styles/styles.css" type="text/css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Cinema22</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link text-danger" href="pelicula/nuevaPelicula.jsp">Nueva Pelicula</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-danger" href="pelicula/listaDePeliculas.jsp">Catálogo</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-danger" href="seccion/listaDeSecciones.jsp">Secciones</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-danger" href="director/listaDeDirectores.jsp">Directores</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
         
    </body>
</html>
