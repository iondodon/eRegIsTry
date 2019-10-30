<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Administrator</title>

    <style>
        .error {
            color: darkred;
        }
    </style>
</head>
<body>
    <%--@elvariable id="administrator" type="com.utm.entities.Administrator"--%>
    <%--@elvariable id="user" type="com.utm.entities.User"--%>
    <form:form action="/administrator/update" method="POST" modelAttribute="administrator">
        username:
        <form:input path="user.username" type="text" name="username" placeholder="username"/>
        <form:errors path="user.username" cssClass="error" />

        <br/>

        password:
        <form:input path="user.password" type="text" name="password" placeholder="password"/>
        <form:errors path="user.password" cssClass="error" />
        <br/>

        first name:
        <form:input path="user.firstName" type="text" name="first-name" placeholder="first name"/>
        <form:errors path="user.firstName" cssClass="error" />
        <br/>

        second name:
        <form:input path="user.lastName" type="text" name="second-name" placeholder="second name"/>
        <form:errors path="user.lastName" cssClass="error" />
        <br/>

        <input type="submit" value="Update" name="submitBtn" />
    </form:form>

</body>
</html>
