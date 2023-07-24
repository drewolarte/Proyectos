<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Gestion Proyecto</title>
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
            <a  href="indexEstudiante.jsp">
                <img src="img/logo.jpg" alt="logo" style="width:120px;" class="img-thumbnail">
            </a>
        </div>
        <br>
        <h1 class="text-center" id="titulo">Gestionar Proyecto</h1>
        <br>
        <h3 class="text-center" id="titulo">Progreso General</h3>
        <hr size="80px" color="#2e85a4">
        <sql:query var="result" dataSource="${universidad}" sql="SELECT * FROM estudiante WHERE id_estudiante=? and contrasena_estudiante=?">
                <sql:param value="${admin.id_estudiante}"/>
                <sql:param value="${admin.contrasena_estudiante}"/>
        </sql:query>
        <sql:query var="result" scope="request" dataSource="${universidad}">
            Select * from estudiante
        </sql:query>
        <div class="d-flex justify-content-center">
            <table class="table table-bordered table-hover table-sm text-center">
                <thead>
                    <tr class="text-center">
                        <th class="align-middle">ANTEPROYECTO</th>
                        <th class="align-middle">DIRECTOR ASIGNADO</th>
                        <th class="align-middle">CALIFICACION DIRECTOR</th>
                        <th class="align-middle">RADICADO ANTEPROYECTO</th>
                        <th class="align-middle">EVALUADOR ASIGNADO</th>
                        <th class="align-middle">CALIFICACION EVALUADOR</th>
                        <th class="align-middle">ESTADO FINAL ANTEPROYECTO</th>
                        <th class="align-middle">RADICADO COMITE ANTEPROYECTO</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="fila" items="${result.rows}">
                        <tr>
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
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <br>
        <h3 class="text-center" id="titulo">Novedad por Gestionar</h3>
        <c:forEach var="row" items="${result.rows}">
            <c:if test="${row.anteproyecto_estudiante==null}">
                <form method="POST">
                     <div class="form-group">
                        <label for="anteproyecto">Agregar AnteProyecto:</label>
                        <input type="url" class="form-control" id="anteproyecto" name="anteproyecto" placeholder="Agregar enlace al AnteProyecto" required>
                    </div>
                    <button type="submit" class="btn btn-outline-primary btn-block">Agregar</button>
                </form>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docentedirector==null}">
                <h5 class="text-center">Esperando asignacion de director de proyecto por coordinacion.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docentedirector!=null && row.aprobacion_director_anteproyecto_estudiante==null }">
                <h5 class="text-center">Esperando calificacion de anteproyecto por docente director.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docentedirector!=null  && row.aprobacion_director_anteproyecto_estudiante.equals('No Aprobado') && row.estado_idea_anteproyecto_estudiante==null}">
                <form method="POST">
                     <div class="form-group">
                        <label for="anteproyecto">Agregar AnteProyecto con correciones:</label>
                        <input type="url" class="form-control" id="anteproyecto" name="anteproyectodirector" placeholder="Agregar enlace al AnteProyecto debidamente corregido" required>
                    </div>
                    <button type="submit" class="btn btn-outline-primary btn-block">Agregar</button>
                </form>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docentedirector!=null  && row.aprobacion_director_anteproyecto_estudiante.equals('No Aprobado') && row.estado_idea_anteproyecto_estudiante!=null}">
                <h5 class="text-center">Esperando calificacion de anteproyecto con correciones por docente director.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docentedirector!=null  && row.aprobacion_director_anteproyecto_estudiante.equals('Aprobado') && row.docente_id_docenteevaluador_anteproyecto==null}" >
                <h5 class="text-center">Esperando asignacion de evaluador de anteproyecto por coordinacion.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docentedirector!=null  && row.aprobacion_evaluador_anteproyecto_estudiante==null && row.docente_id_docenteevaluador_anteproyecto!=null}" >
                <h5 class="text-center">Esperando calificacion de anteproyecto por docente evaluador.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docenteevaluador_anteproyecto!=null  && row.aprobacion_evaluador_anteproyecto_estudiante.equals('No Aprobado') && row.pago_estudiante==null}">
                <form method="POST">
                     <div class="form-group">
                        <label for="anteproyecto">Agregar AnteProyecto con correciones:</label>
                        <input type="url" class="form-control" id="anteproyecto" name="anteproyectoevaluador" placeholder="Agregar enlace al AnteProyecto debidamente corregido" required>
                    </div>
                    <button type="submit" class="btn btn-outline-primary btn-block">Agregar</button>
                </form>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docenteevaluador_anteproyecto!=null  && row.aprobacion_evaluador_anteproyecto_estudiante.equals('No Aprobado') && row.pago_estudiante!=null}">
                <h5 class="text-center">Esperando calificacion de anteproyecto con correciones por docente evaluador.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docenteevaluador_anteproyecto!=null  && row.aprobacion_evaluador_anteproyecto_estudiante.equals('Aprobado') && row.radicado_anteproyecto_estudiante==null}">
                <h5 class="text-center">Esperando radicado de aprobacion de anteproyecto del Comite de Proyectos de Grado.</h5>
            </c:if>
            <c:if test="${row.anteproyecto_estudiante!= null && row.docente_id_docenteevaluador_anteproyecto!=null  && row.aprobacion_evaluador_anteproyecto_estudiante.equals('Aprobado') && row.radicado_anteproyecto_estudiante!=null}">
                <h5 class="text-center">Anteproyecto aprobado satisfactoriamente por Comite de Proyectos de Grado.</h5>
            </c:if>
        </c:forEach>
        <form method="POST" class="d-flex justify-content-center text-center mt-1">
            <input type="hidden" name="logout" value="SI">
            <button type="submit" class="btn">
                <a class="btn btn-outline-primary">Cerrar Sesion</a>
            </button>
        </form>
        <c:if test="${param.anteproyecto!=null}">
            <sql:update var="result" dataSource="${universidad}">
                update estudiante 
                set anteproyecto_estudiante = '${param.anteproyecto}' where id_estudiante = ${admin.id_estudiante}
            </sql:update>
            <c:if test="${result==1}">
                <c:redirect url="gestionarProyectoEstudiante.jsp"/>
            </c:if>
        </c:if>
        <c:if test="${param.anteproyectodirector!=null}">
            <sql:update var="result2" dataSource="${universidad}">
                update estudiante 
                set anteproyecto_estudiante = '${param.anteproyectodirector}',
                estado_idea_anteproyecto_estudiante ='Aprobado' where id_estudiante = ${admin.id_estudiante}
            </sql:update>
            <c:if test="${result2==1}">
                <c:redirect url="gestionarProyectoEstudiante.jsp"/>
            </c:if>
        </c:if>
        <c:if test="${param.anteproyectoevaluador!=null}">
            <sql:update var="result3" dataSource="${universidad}">
                update estudiante 
                set anteproyecto_estudiante = '${param.anteproyectoevaluador}',
                pago_estudiante ='Aprobado' where id_estudiante = ${admin.id_estudiante}
            </sql:update>
            <c:if test="${result3==1}">
                <c:redirect url="gestionarProyectoEstudiante.jsp"/>
            </c:if>
        </c:if>
        <c:if test="${param.logout != null}">
            <c:remove var="admin" scope="session"/>
            <c:redirect url="index.jsp"/>
        </c:if>
    </div>
</body>

</html>