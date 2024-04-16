<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.estudiante"%>
<%
    if(session.getAttribute("listaper")==null)
    {
        ArrayList<estudiante> aux = new ArrayList<estudiante>();
        session.setAttribute("listaper",aux);
    }
    
    ArrayList<estudiante> lista = (ArrayList<estudiante>)session.getAttribute("listaper");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        /* Estilos para centrar la tabla */
        table {
            margin: auto;
        }

        /* Estilos para la tabla */
        table {
            border-collapse: collapse;
            width: 80%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Estilos para los enlaces */
        a {
            text-decoration: none;
            color: blue;
        }

        /* Estilos para los enlaces al hacer hover */
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Listado</h1>
    
    <div>
        <a href="mainServlet?op=nuevo"> Nuevo registro</a>
        
        <table>
            <tr>
                <th>id</th>
                <th>Fecha</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Turno</th>
                <th>TipoSeminario</th>
            </tr>
            <% if(lista!=null) { %>
                <% for(estudiante item: lista) { %>
                    <tr>
                        <td> <%= item.getId() %> </td>
                        <td> <%= item.getFecha() %> </td>
                        <td><%= item.getNombre() %></td>
                        <td><%= item.getApellidos() %></td>
                        <td><%= item.getTurno()%></td>
                        <td><%= item.getTipoSeminario() %></td>
                        <td><a href="mainServlet?op=editar&id=<%=item.getId()%>">Editar</a> </td>
                        <td> <a href="mainServlet?op=eliminar&id=<%=item.getId()%>" 
                                onclick="return(confirm('¿Está seguro de eliminar?'))"
                                >Eliminar</a>
                        </td>
                    </tr>
                <% } %>
            <% } %>
        </table>
        
    </div>
    
</body>
</html>
