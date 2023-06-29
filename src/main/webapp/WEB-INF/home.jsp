<%--
  Created by IntelliJ IDEA.
  User: Dell Latitude E7450
  Date: 6/28/2023
  Time: 12:22 AM
  To change this template use File | Settings | File Templates. ${}
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ page isErrorPage="true" %>

<html>
<head>

    <title>Title</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="d-flex justify-content-between align-items-center m-4">
    <h1 class="text-warning">Welcome ${user.userName}!</h1>
    <a href="/logout">Logout</a>
</div>
<p class="m-4">Your Table</p>
<div class="d-flex justify-content-between align-items-center m-4">

    <table class="table table-primary">
        <thead>
        <tr>
            <th scope="col">Guest Name</th>
            <th scope="col"># Guests</th>
            <th scope="col">Arrived At</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="table" items="${tables}">
            <tr>
                <td>${table.name}</td>
                <td>${table.numOfGuests}</td>
                <td><fmt:formatDate value="${table.createdAt}" pattern="yyyy-MM-dd HH:mm" /></td>
                <td class="d-flex justify-content-around">
                    <a href="/delete/${table.id}">finished </a>

                    <a href="/tables/${table.id}/edit"> edit </a>

                    <a href="/giveup/${table.id}"> Give up Table</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>


<a class="m-4 mt-5" href="/tables/new"> <button> + new Table</button></a>


<a class="m-4 mt-5" href="/tables">See other tables</a>


</body>
</html>