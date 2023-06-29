<%--
  Created by IntelliJ IDEA.
  User: Dell Latitude E7450
  Date: 6/29/2023
  Time: 1:05 AM
  To change this template use File | Settings | File Templates.
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
</head>
<body>
<div class="d-flex justify-content-between m-4">
    <h1 class="text-primary">Open Tables!</h1>
    <a href="/home">Home</a>
</div>
<h2 class="m-4 text-primary">Tables</h2>
<table class="table table-primary m-4">
    <thead>
    <tr class="text-primary">
        <th scope="col">Guest Name</th>
        <th scope="col"># Guests</th>
        <th scope="col">Arrived At</th>
        <th scope="col">Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="table" items="${allT}">
        <tr class="text-primary">
            <td >${table.name}</td>
            <td>${table.numOfGuests}</td>
            <td><fmt:formatDate value="${table.createdAt}" pattern="yyyy-MM-dd HH:mm" /></td>
            <td><a href="/pickup/${table.id}">Pick up Table</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
