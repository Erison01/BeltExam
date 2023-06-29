<%--
  Created by IntelliJ IDEA.
  User: Dell Latitude E7450
  Date: 6/28/2023
  Time: 12:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<html>
<head>

    <title>Title</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class="text-center m-4">
    <h1 class="text-warning">Table Master</h1>

</div>
<div class="d-flex justify-content-center gap-5 mt-3">
    <div class=" bg-light p-5">
        <h3>New Waitstaff</h3>
        <form:form action="/register" method="post" modelAttribute="newUser"
                   class="form d-flex flex-column gap-3">
            <div class="d-flex flex-column justify-content-center align-items-center gap-2">
                <form:label path="userName">Name</form:label>
                <form:input path="userName"></form:input>
                <form:errors path="userName" class="text-danger"></form:errors>
            </div>
            <div class="d-flex flex-column justify-content-center align-items-center gap-2">
                <form:label path="email">Email</form:label>
                <form:input path="email"></form:input>
                <form:errors path="email" class="text-danger"></form:errors>
            </div>
            <div class="d-flex flex-column justify-content-center align-items-center gap-2">
                <form:label path="password">Password</form:label>
                <form:input path="password" type="password" ></form:input>
                <form:errors path="password" class="text-danger"></form:errors>
            </div>
            <div class="d-flex flex-column justify-content-center align-items-center gap-2">
                <form:label path="confirm">Confirm PW</form:label>
                <form:input path="confirm" type="password"></form:input>
                <form:errors path="confirm" class="text-danger"></form:errors>
            </div>
            <div>
                <input type="submit" value="Register" class="btn btn-primary w-50">
            </div>
        </form:form>
    </div>
    <div class="bg-light p-5">
        <h3>Log In</h3>
        <form:form action="/login" method="post" modelAttribute="newLogin"
                   class="form d-flex flex-column gap-3">
            <div class="d-flex flex-column justify-content-center align-items-center gap-2">
                <form:label path="email">Email</form:label>
                <form:input path="email"></form:input>
                <form:errors path="email" class="text-danger"></form:errors>
            </div>
            <div class="d-flex flex-column justify-content-center align-items-center gap-2">
                <form:label path="password">Password</form:label>
                <form:input path="password" type="password"></form:input>
                <form:errors path="password" class="text-danger"></form:errors>
            </div>
            <div>
                <input type="submit" value="Login" class="btn btn-primary w-50">
            </div>
        </form:form>
    </div>
</div>
</body>
</html>
