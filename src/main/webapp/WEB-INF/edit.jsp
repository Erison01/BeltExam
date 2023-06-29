<%--
  Created by IntelliJ IDEA.
  User: Dell Latitude E7450
  Date: 6/29/2023
  Time: 1:44 AM
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
<div class="d-flex justify-content-between m-4">

        <h1>Edit Table</h1>

        <a href="/">Log out</a>

</div>


<div class=" row justify-content-center">
    <form:form action="/tables/${table.id}/edit" method="put" modelAttribute="table">

        <div class="form-group">

                <form:label path="name">Guest name: </form:label>
                <form:errors cssClass="text-danger" path="name"></form:errors>
                <form:input path="name" cssClass="form-control"></form:input>

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

        <div class="d-flex justify-content-center align-items-center m-4 gap-xxl-5 float-xxl-start">


                <input class="btn btn-secondary btn-cancel me-4" type="button" value="Cancel" onclick="location.href='/home';">
                <input class="btn btn-primary" type="submit" value="Submit">
            </div>


    </form:form>
</div>

        <a class="" href="/delete/${table.id}">
            <button class="btn btn-danger">Delete</button>
        </a>


</body>
</html>
