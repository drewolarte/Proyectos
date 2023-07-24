<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Actualizar Estudiante</title>
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
            <a  href="indexAdministrador.jsp">
                <img src="img/logo.jpg" alt="logo" style="width:120px;" class="img-thumbnail">
            </a>
        </div>
        <br>
        <h1 class="text-center" id="titulo">Actualizar Estudiante</h1>
        <br>
        <c:if test="${param.modifica==null}">
            <sql:query var="estudiante" dataSource="${universidad}">
                SELECT * FROM estudiante where id_estudiante = ?
                <sql:param value="${param.id}">
                </sql:param>
            </sql:query>
        <form method="POST">
            <c:forEach var="itema" items="${estudiante.rows}">
                <input type="hidden" class="form-control" id="id" name="id" value="${itema.id_estudiante}">
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" value="${itema.nombre_estudiante}" name="nombre" required>
                </div>
                <div class="form-group">
                    <label for="apellido">Apellido:</label>
                    <input type="text" class="form-control" id="apellido" value="${itema.apellido_estudiante}" name="apellido" required>
                </div>
                <div class="form-group">
                    <label for="contrasena">Contraseña:</label>
                    <input type="password" class="form-control" id="contrasena" value="${itema.contrasena_estudiante}" name="contrasena" required>
                </div>
                <div class="form-group">
                    <label for="semestre">Seleccione el semestre academico:</label>
                    <select class="form-control" id="semestre" name="semestre">
                            <option value="5" required <c:if test="${itema.semestre_estudiante==5}">selected</c:if>>5</option>
                            <option value="6" required <c:if test="${itema.semestre_estudiante==6}">selected</c:if>>6</option>
                            <option value="9" required <c:if test="${itema.semestre_estudiante==9}">selected</c:if>>9</option>
                            <option value="10" required <c:if test="${itema.semestre_estudiante==10}">selected</c:if>>10</option>
                    </select>
                </div>
            </c:forEach>
                <input type="hidden" class="form-control" id="modifica" name="modifica" value="SI">
                <button type="submit" class="btn btn-outline-primary btn-block">Actualizar</button>
            </form>
        </c:if>
        <c:if test="${param.modifica != null}">
            <sql:update var="result" dataSource="${universidad}">
                update estudiante
                set nombre_estudiante = '${param.nombre}',
                apellido_estudiante = '${param.apellido}',
                contrasena_estudiante = '${param.contrasena}',
                semestre_estudiante = '${param.semestre}'
                where id_estudiante = ${param.id}
            </sql:update>
            <c:if test="${result==1}">
                <c:redirect url="listarEstudiantes.jsp"/>
            </c:if>
        </c:if>
        <form method="POST" class="d-flex justify-content-center text-center mt-1">
            <input type="hidden" name="logout" value="SI">
            <button type="submit" class="btn">
                <a class="btn btn-outline-primary">Cerrar Sesion</a>
            </button>
        </form>
        <c:if test="${param.logout != null}">
            <c:remove var="admin" scope="session"/>
            <c:redirect url="index.jsp"/>
        </c:if>
    </div>
</body>

</html>