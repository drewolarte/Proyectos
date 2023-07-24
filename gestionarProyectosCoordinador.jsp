<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Gestionar Proyectos Coordinador</title>
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
            <a  href="indexCoordinador.jsp">
                <img src="img/logo.jpg" alt="logo" style="width:120px;" class="img-thumbnail">
            </a>
        </div>
        <br>
        <h1 class="text-center" id="titulo">Gestión de Proyectos</h1>
        <br>
        <sql:query var="result" scope="request" dataSource="${universidad}">
            Select * from estudiante
        </sql:query>
        <div class="d-flex justify-content-center">
            <table class="table table-bordered table-hover table-sm text-center">
                <thead>
                    <tr class="text-center">
                        <th class="align-middle">NOMBRE</th>
                        <th class="align-middle">APELLIDO</th>
                        <th class="align-middle">NIVEL</th>
                        <th class="align-middle">ANTEPROYECTO</th>
                        <th class="align-middle">DIRECTOR ASIGNADO</th>
                        <th class="align-middle">CALIFICACION DIRECTOR</th>
                        <th class="align-middle">RADICADO ANTEPROYECTO</th>
                        <th class="align-middle">EVALUADOR ASIGNADO</th>
                        <th class="align-middle">CALIFICACION EVALUADOR</th>
                        <th class="align-middle">ESTADO FINAL ANTEPROYECTO</th>
                        <th class="align-middle">RADICADO COMITE ANTEPROYECTO</th>
                        <th class="align-middle">ACCION</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="fila" items="${result.rows}">
                        <tr>
                            <td class="align-middle"><c:out value="${fila.nombre_estudiante}"/></td>
                            <td class="align-middle"><c:out value="${fila.apellido_estudiante}"/></td>
                            <td class="align-middle"><c:out value="${fila.semestre_estudiante}"/></td>
                            <td class="align-middle">
                                <c:choose>
                                    <c:when test="${fila.anteproyecto_estudiante!=null}">
                                        <a href="${fila.anteproyecto_estudiante}" target="_blank">Visualizar</a>
                                    </c:when>
                                    <c:when test="${fila.anteproyecto_estudiante==null}">
                                        <c:out value="Sin gestionar"/>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td class="align-middle">
                                <c:if test="${fila.docente_id_docentedirector!=null}">
                                    <sql:query var="director" scope="request" dataSource="${universidad}">
                                        Select * from docente where id_docente = '${fila.docente_id_docentedirector }'
                                    </sql:query>
                                    <c:forEach var="row" items="${director.rows}">
                                        <c:set value="${row.nombre_docente} ${row.apellido_docente}" var="dir" scope="session"/>
                                    </c:forEach>
                                </c:if>
                                <c:out value="${fila.docente_id_docentedirector!=null ? dir : 'Sin gestionar'}"/>
                            </td>
                            <td class="align-middle"><c:out value="${fila.aprobacion_director_anteproyecto_estudiante!=null ? fila.aprobacion_director_anteproyecto_estudiante : 'Sin gestionar'}"/></td>
                            <td class="align-middle">
                                <c:choose>
                                    <c:when test="${fila.radicado_idea_anteproyecto_estudiante!=null}">
                                        <a href="${fila.radicado_idea_anteproyecto_estudiante}" target="_blank">Visualizar</a>
                                    </c:when>
                                    <c:when test="${fila.radicado_idea_anteproyecto_estudiante==null}">
                                        <c:out value="Sin gestionar"/>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td class="align-middle">
                                <c:if test="${fila.docente_id_docenteevaluador_anteproyecto!=null}">
                                    <sql:query var="evaluador" scope="request" dataSource="${universidad}">
                                        Select * from docente where id_docente = '${fila.docente_id_docenteevaluador_anteproyecto }'
                                    </sql:query>
                                    <c:forEach var="row" items="${evaluador.rows}">
                                        <c:set value="${row.nombre_docente} ${row.apellido_docente}" var="eva" scope="session"/>
                                    </c:forEach>
                                </c:if>
                                <c:out value="${fila.docente_id_docenteevaluador_anteproyecto !=null ? eva : 'Sin gestionar'}"/>
                            </td>
                            <td class="align-middle"><c:out value="${fila.aprobacion_evaluador_anteproyecto_estudiante!=null ? fila.aprobacion_evaluador_anteproyecto_estudiante: 'Sin gestionar'}"/></td>
                            <td class="align-middle"><c:out value="${fila.estado_anteproyecto_estudiante!=null ? fila.estado_anteproyecto_estudiante : 'Sin gestionar'}"/></td>
                            <td class="align-middle">
                                <c:choose>
                                    <c:when test="${fila.radicado_anteproyecto_estudiante!=null}">
                                        <a href="${fila.radicado_anteproyecto_estudiante}" target="_blank">Visualizar</a>
                                    </c:when>
                                    <c:when test="${fila.radicado_anteproyecto_estudiante==null}">
                                        <c:out value="Sin gestionar"/>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td class="align-middle">
                                <form action="gestionarEstudianteCoordinador.jsp" method="POST">
                                    <input type="hidden" name="id" value="${fila.id_estudiante}"> 
                                    <button type="submit" class="btn btn-outline-info">Gestionar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
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