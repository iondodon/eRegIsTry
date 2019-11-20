<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Student (user data)</title>

    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Update user data</h3>
<%--@elvariable id="administrator" type="com.utm.entities.Administrator"--%>
<%--@elvariable id="user" type="com.utm.entities.User"--%>
<form:form action="/student/update-user-data" method="POST" modelAttribute="user">
    <input path="id" name="id" type="hidden"  value="${user.id}" />
    <%--        <input path="administrator" name="administrator" type="hidden" value="${user.administrator.id}" />--%>
    <div class="block" >
        <label for="username">Username:</label>
    <form:input path="username" type="text" name="username" placeholder="username"/>
    <form:errors path="username" cssClass="error" />

        <label for="firstName">First Name:</label>
    <form:input path="firstName" type="text" name="first-name" placeholder="first name"/>
    <form:errors path="firstName" cssClass="error" />

        <label for="lastName">Second Name:</label>
    <form:input path="lastName" type="text" name="second-name" placeholder="second name"/>
    <form:errors path="lastName" cssClass="error" />
    </div>
    <input type="submit" value="Update" name="submitBtn" />
</form:form>
</div>
</body>
</html>
