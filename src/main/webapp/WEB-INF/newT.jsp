<%--
  Created by IntelliJ IDEA.
  User: Dell Latitude E7450
  Date: 6/28/2023
  Time: 11:50 PM
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
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="d-flex justify-content-between container mt-4">

    <h1>New Table</h1>


    <a href="/">Log out</a>

</div>

<div class="m-4 row justify-content-center">
    <form:form action="/tables/new" method="post" modelAttribute="newTable">

        <div class="form-group">

                <form:label path="name">Guest name: </form:label>
                <form:errors cssClass="text-danger" path="name"></form:errors>
                <form:input cssClass="form-control" path="name"></form:input>

        </div>

        <div class="form-group">

                <form:label path="numOfGuests">Number of guests: </form:label>
                <form:errors cssClass="text-danger" path="numOfGuests"></form:errors>
                <form:input type="number" cssClass="form-control" path="numOfGuests"></form:input>

        </div>


            <div class="form-group">
                <form:label path="notes">Notes: </form:label>
                <form:errors cssClass="text-danger" path="notes"></form:errors>
                <form:input type="textarea" cssClass="form-control" path="notes"></form:input>
            </div>

        <div class="d-flex justify-content-center align-items-center m-4">

            <input class="btn btn-secondary btn-cancel me-4" type="button" value="Cancel" onclick="location.href='/home';">
            <input class="btn btn-primary" type="submit" value="Submit">

        </div>

    </form:form>
</div>
</body>
</html>
