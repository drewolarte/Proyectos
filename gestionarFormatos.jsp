<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Gestion Formatos Proyecto de Grado</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="css/stilos.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        body{
            background-image: url("img/slider.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
</head>

<body>
    <div class="container">
        <c:if test="${param.F_AM_04 == null && param.F_DC_124 == null && param.F_DC_125 == null && param.F_DC_126 == null && param.F_DC_127 == null && param.F_DC_128 == null && param.F_DC_129 == null && param.F_DC_130 == null}">
        <br>
        <div class="d-flex justify-content-center">
            <a  href="https://www.uts.edu.co/sitio/" target="_blank">
                <img src="img/logo.jpg" alt="logo" style="width:120px;" class="img-thumbnail">
            </a>
        </div>
        <br>
        <h1 class="text-center" id="titulo">Formatos de Anteproyecto/Proyecto de Grado</h1>
        <br>
                                
        <div class="container d-flex justify-content-center">
            <div class="card bg-light text-dark m-1" style="width:300px" >
                <div class="card-body d-flex flex-column justify-content-center text-center">
                    <span class="material-symbols-outlined" width="70px">description</span>
                    <span class="card-text">F-AM-04</span>
                    <p class="card-text">Solicitud de Grado V16</p>
                    <form method="POST">
                        <input type="hidden" name="F_AM_04" value="SI">
                        <button type="submit" class="btn">
                            <a class="btn btn-outline-dark">Visualizar</a>
                        </button>
                    </form>
                </div>
            </div>
            <div class="card bg-light text-dark m-1" style="width:300px" >
                <div class="card-body d-flex flex-column justify-content-center text-center">
                    <span class="material-symbols-outlined" width="70px">description</span>
                    <span class="card-text">F-DC-124</span>
                    <p class="card-text">Propuesta Trabajo Grado PI DTeI Mono Emprend V1</p>
                    <form method="POST">
                        <input type="hidden" name="F_DC_124" value="SI">
                        <button type="submit" class="btn">
                            <a class="btn btn-outline-dark">Visualizar</a>
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <div class="container d-flex justify-content-center">
            <div class="card bg-light text-dark m-1" style="width:300px" >
                <div class="card-body d-flex flex-column justify-content-center text-center">
                    <span class="material-symbols-outlined" width="70px">description</span>
                    <span class="card-text">F-DC-125</span>
                    <p class="card-text">Informe Final Trabajo Grado Modalidad P Inv DT Mgfía Emdto Semi V1</p>
                    <form method="POST">
                        <input type="hidden" name="F_DC_125" value="SI">
                        <button type="submit" class="btn">
                            <a class="btn btn-outline-dark">Visualizar</a>
                        </button>
                    </form>
                </div>
            </div>
            <div class="card bg-light text-dark m-1" style="width:300px" >
                <div class="card-body d-flex flex-column justify-content-center text-center">
                    <span class="material-symbols-outlined" width="70px">description</span>
                    <span class="card-text">F-DC-126</span>
                    <p class="card-text">Requerimiento Empresa Solicitar Prácticante V1</p>
                    <form method="POST">
                        <input type="hidden" name="F_DC_126" value="SI">
                        <button type="submit" class="btn">
                            <a class="btn btn-outline-dark">Visualizar</a>
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <div class="container d-flex justify-content-center">
            <div class="card bg-light text-dark m-1" style="width:300px" >
                <div class="card-body d-flex flex-column justify-content-center text-center">
                    <span class="material-symbols-outlined" width="70px">description</span>
                    <span class="card-text">F-DC-127</span>
                    <p class="card-text">Registro Propuesta Trabajo Grado Modalidad Práctica V1</p>
                    <form method="POST">
                        <input type="hidden" name="F_DC_127" value="SI">
                        <button type="submit" class="btn">
                            <a class="btn btn-outline-dark">Visualizar</a>
                        </button>
                    </form>
                </div>
            </div>
            <div class="card bg-light text-dark m-1" style="width:300px" >
                <div class="card-body d-flex flex-column justify-content-center text-center">
                    <span class="material-symbols-outlined" width="70px">description</span>
                    <span class="card-text">F-DC-128</span>
                    <p class="card-text">Informe Final Trabajo Grado Modalidad Practica V1</p>
                    <form method="POST">
                        <input type="hidden" name="F_DC_128" value="SI">
                        <button type="submit" class="btn">
                            <a class="btn btn-outline-dark">Visualizar</a>
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <div class="container d-flex justify-content-center">
            <div class="card bg-light text-dark m-1" style="width:300px" >
                <div class="card-body d-flex flex-column justify-content-center text-center">
                    <span class="material-symbols-outlined" width="70px">description</span>
                    <span class="card-text">F-DC-129</span>
                    <p class="card-text">Rejilla Evaluación Informe Final Trabajo Grado V1</p>
                    <form method="POST">
                        <input type="hidden" name="F_DC_129" value="SI">
                        <button type="submit" class="btn">
                            <a class="btn btn-outline-dark">Visualizar</a>
                        </button>
                    </form>
                </div>
            </div>
            <div class="card bg-light text-dark m-1" style="width:300px" >
                <div class="card-body d-flex flex-column justify-content-center text-center">
                    <span class="material-symbols-outlined" width="70px">description</span>
                    <span class="card-text">F-DC-130</span>
                    <p class="card-text">Concepto Final Trabajo Grado V1</p>
                    <form method="POST">
                        <input type="hidden" name="F_DC_130" value="SI">
                        <button type="submit" class="btn">
                            <a class="btn btn-outline-dark">Visualizar</a>
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <form method="POST" class="d-flex justify-content-center text-center mt-1">
            <input type="hidden" name="logout" value="SI">
            <button type="submit" class="btn">
                <a class="btn btn-outline-primary">Cerrar Sesion</a>
            </button>
        </form>
        </c:if>
        <c:if test="${param.F_AM_04 != null}">
            <div class="container">
                <br>
                <iframe src="https://drive.google.com/file/d/1KnFFKQpp8xohLfsvkvVAzVODO0vHRTk0/preview" width="100%" height="750px" allow="autoplay"></iframe>
            </div>
        </c:if>
        <c:if test="${param.F_DC_124 != null}">
            <div class="container">
                <br>
                <iframe src="https://drive.google.com/file/d/1AHQwetEpvJbwk8rhHMwE1fuTUCcQKtJh/preview" width="100%" height="750px" allow="autoplay"></iframe>            
            </div>
        </c:if>
        <c:if test="${param.F_DC_125 != null}">
            <div class="container">
                <br>
                <iframe src="https://drive.google.com/file/d/1XZtQARQD2SQN1WS3-Oy7hxKKD_V1FWqu/preview" width="100%" height="750px" allow="autoplay"></iframe>
            </div>
        </c:if>
        <c:if test="${param.F_DC_126 != null}">
            <div class="container">
                <br>
                <iframe src="https://drive.google.com/file/d/1UUFXuBVxoSbASXg8QwGFeD9N1o5NFjkh/preview" width="100%" height="750px" allow="autoplay"></iframe>
            </div>
        </c:if>
        <c:if test="${param.F_DC_127 != null}">
            <div class="container">
                <br>
                <iframe src="https://drive.google.com/file/d/1qBCFanTHX9qwSQvC51o-mdyWey1aR2zU/preview" width="100%" height="750px" allow="autoplay"></iframe>
            </div>
        </c:if>
        <c:if test="${param.F_DC_128 != null}">
            <div class="container">
                <br>
                <iframe src="https://drive.google.com/file/d/1xV3yqI1jbZr32pO_f3SBoPF8WQ1QrxQL/preview" width="100%" height="750px" allow="autoplay"></iframe>            
            </div>
        </c:if>
        <c:if test="${param.F_DC_129 != null}">
            <div class="container">
                <br>
                <iframe src="https://drive.google.com/file/d/1HFJUkKoQA-MF7uWmT9kfY0IJ57zae3ZZ/preview" width="100%" height="750px" allow="autoplay"></iframe>
            </div>
        </c:if>
        <c:if test="${param.F_DC_130 != null}">
            <div class="container">
                <br>
                <iframe src="https://drive.google.com/file/d/1wDSqqDRlisBj_Wi_GGY1kcZ_GB__2EEG/preview" width="100%" height="750px" allow="autoplay"></iframe>
            </div>
        </c:if>
        <c:if test="${param.logout != null}">
            <c:remove var="admin" scope="session"/>
            <c:redirect url="index.jsp"/>
        </c:if>
    </div>
</body>

</html>