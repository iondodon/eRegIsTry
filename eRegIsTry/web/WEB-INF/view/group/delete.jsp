<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Group</title>
</head>
<body>

<%--@elvariable id="user" type="com.utm.entities.Group"--%>
<form:form action="/group/delete" method="POST" modelAttribute="group">
    <input path="id" name="id" type="hidden"  value="${group.id}" />
    <input type="submit" value="Delete" name="deleteBtn" />
</form:form>

</body>
</html>
