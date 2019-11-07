<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
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
    <input path="id" name="id" type="hidden"  value="${administrator.id}" />

    department:
    <form:input path="department" type="text" name="department" placeholder="department"/>
    <form:errors path="department" cssClass="error" />

    <input type="submit" value="Update" name="submitBtn" />
</form:form>

</body>
</html>
