<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Student</title>

    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 class="add" align="center">Adding a new student ...</h3>
    <%--@elvariable id="user" type="com.utm.entities.User"--%>
    <form:form action="/student/create" method="POST" modelAttribute="user">
    <div class="block" >
        <label for="username">Username:</label>
        <form:input path="username" type="text" name="username" placeholder="username"/>
        <form:errors path="username" cssClass="error" />

        <label for="password">Password:</label>
        <form:input path="password" type="text" name="password" placeholder="password"/>
        <form:errors path="password" cssClass="error" />

        <label for="firstName">First Name:</label>
        <form:input path="firstName" type="text" name="first-name" placeholder="first name"/>
        <form:errors path="firstName" cssClass="error" />

        <label for="lastName">Second Name:</label>
        <form:input path="lastName" type="text" name="second-name" placeholder="second name"/>
        <form:errors path="lastName" cssClass="error" />

        <label>Group:</label>
        <form:select path="student.group">
            <form:option value="-1">Select group</form:option>
            <%--@elvariable id="groups" type="java.util.List"--%>
            <form:options items="${groups}" itemLabel="name" itemValue="id" />
        </form:select>
    </div>

        <%--            roles:--%>
        <%--            &lt;%&ndash;@elvariable id="roles" type="java.util.List"&ndash;%&gt;--%>
        <%--            <form:select multiple="true" path="roles" items="${roles}" itemLabel="nombre" itemValue="id" />--%>

        <input type="submit" value="Submit" name="submitBtn" />
    </form:form>
</div>
</body>
</html>
