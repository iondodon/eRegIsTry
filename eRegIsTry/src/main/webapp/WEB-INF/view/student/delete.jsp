<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete student</title>
</head>
<body>

<%--@elvariable id="user" type="com.utm.entities.User"--%>
<form:form action="/student/delete" method="POST" modelAttribute="user">
    <input path="id" name="id" type="hidden"  value="${user.id}" />
    <input type="submit" value="Delete" name="deleteBtn" />
</form:form>

</body>
</html>
