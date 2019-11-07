<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Administrator</title>

    <style>
        .error {
            color: darkred;
        }
    </style>
</head>
<body>
    <%--@elvariable id="user" type="com.utm.entities.User"--%>
    <form:form action="/administrator/register" method="POST" modelAttribute="user">
        username:
        <form:input path="username" type="text" name="username" placeholder="username"/>
        <form:errors path="username" cssClass="error" />

        <br/>

        password:
        <form:input path="password" type="text" name="password" placeholder="password"/>
        <form:errors path="password" cssClass="error" />
        <br/>

        first name:
        <form:input path="firstName" type="text" name="first-name" placeholder="first name"/>
        <form:errors path="firstName" cssClass="error" />
        <br/>

        second name:
        <form:input path="lastName" type="text" name="second-name" placeholder="second name"/>
        <form:errors path="lastName" cssClass="error" />
        <br/>

<%--            roles:--%>
<%--            &lt;%&ndash;@elvariable id="roles" type="java.util.List"&ndash;%&gt;--%>
<%--            <form:select multiple="true" path="roles" items="${roles}" itemLabel="nombre" itemValue="id" />--%>

        <input type="submit" value="Submit" name="submitBtn" />
    </form:form>

</body>
</html>
