<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Gestion Estudiante Evaluador</title>
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
        <br>
        <div class="d-flex justify-content-center">
            <a  href="indexEvaluador.jsp">
                <img src="img/logo.jpg" alt="logo" style="width:120px;" class="img-thumbnail">
            </a>
        </div>
        <br>
        <h1 class="text-center" id="titulo">Gestionar Proyecto</h1>
        <br>
        <hr size="80px" color="#2e85a4">
        <sql:query var="result" dataSource="${universidad}" sql="SELECT * FROM estudiante WHERE id_estudiante=?">
                <sql:param value="${param.id}"/>
        </sql:query>

        <h3 class="text-center" id="titulo">Novedad por Gestionar</h3>
        <c:forEach var="row" items="${result.rows}">
            <c:if test="${row.aprobacion_evaluador_anteproyecto_estudiante==null}">
                <form method="POST">
                    <input type="hidden" name="id" value="${row.id_estudiante}">
                    <span>Seleccione la calificacion de anteproyecto:</span>
                    <br>
                    <div class="form-check-inline">
                        <label class="form-check-label" for="check1">
                            <input type="radio" class="form-check-input" id="check1" name="nota" value="Aprobado" required>Aprobado
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label" for="check2">
                            <input type="radio" class="form-check-input" id="check2" name="nota" value="No Aprobado" required>No Aprobado
                        </label>
                    </div>
                    <br>
                    <br>
                    <button type="submit" class="btn btn-outline-primary btn-block">Calificar</button>
                </form>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docenteevaluador_anteproyecto!=null  && row.aprobacion_evaluador_anteproyecto_estudiante.equals('No Aprobado') && row.pago_estudiante==null}">
                <h5 class="text-center">Esperando correcciones de anteproyecto por estudiante.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docenteevaluador_anteproyecto!=null  && row.aprobacion_evaluador_anteproyecto_estudiante.equals('No Aprobado') && row.pago_estudiante!=null}">
                <form method="POST">
                    <input type="hidden" name="id" value="${row.id_estudiante}">
                    <span>Seleccione la calificacion de anteproyecto:</span>
                    <br>
                    <div class="form-check-inline">
                        <label class="form-check-label" for="check1">
                            <input type="radio" class="form-check-input" id="check1" name="nota" value="Aprobado" required>Aprobado
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label" for="check2">
                            <input type="radio" class="form-check-input" id="check2" name="nota" value="No Aprobado" required>No Aprobado
                        </label>
                    </div>
                    <br>
                    <br>
                    <button type="submit" class="btn btn-outline-primary btn-block">Calificar</button>
                </form>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docenteevaluador_anteproyecto!=null  && row.aprobacion_evaluador_anteproyecto_estudiante.equals('Aprobado')}">
                <h5 class="text-center">Estudiante gestionado satisfactoriamente.</h5>
            </c:if>
        </c:forEach>
        <form method="POST" class="d-flex justify-content-center text-center mt-1">
            <input type="hidden" name="logout" value="SI">
            <button type="submit" class="btn">
                <a class="btn btn-outline-primary">Cerrar Sesion</a>
            </button>
        </form>
        <c:if test="${param.nota!=null}">
            <sql:update var="result1" dataSource="${universidad}">
                update estudiante 
                set aprobacion_evaluador_anteproyecto_estudiante = '${param.nota}' where id_estudiante = ${param.id}
            </sql:update>
            <c:if test="${result1==1}">
                <c:redirect url="gestionarProyectosEvaluador.jsp"/>
            </c:if>
        </c:if>
        <c:if test="${param.logout != null}">
            <c:remove var="admin" scope="session"/>
            <c:redirect url="index.jsp"/>
        </c:if>
    </div>
</body>

</html>