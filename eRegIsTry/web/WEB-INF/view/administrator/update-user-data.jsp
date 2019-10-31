<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Administrator (user data)</title>

    <style>
        .error {
            color: darkred;
        }
    </style>
</head>
<body>

    <%--@elvariable id="administrator" type="com.utm.entities.Administrator"--%>
    <%--@elvariable id="user" type="com.utm.entities.User"--%>
    <form:form action="/administrator/update-user-data" method="POST" modelAttribute="user">
        <input path="id" name="id" type="hidden"  value="${user.id}" />
<%--        <input path="administrator" name="administrator" type="hidden" value="${user.administrator.id}" />--%>

        username:
        <form:input path="username" type="text" name="username" placeholder="username"/>
        <form:errors path="username" cssClass="error" />

        <br/>

        first name:
        <form:input path="firstName" type="text" name="first-name" placeholder="first name"/>
        <form:errors path="firstName" cssClass="error" />
        <br/>

        second name:
        <form:input path="lastName" type="text" name="second-name" placeholder="second name"/>
        <form:errors path="lastName" cssClass="error" />
        <br/>

        <input type="submit" value="Update" name="submitBtn" />
    </form:form>

</body>
</html>
