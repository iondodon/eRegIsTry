<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Registry</title>
</head>
<body>

<%--@elvariable id="registry" type="com.utm.entities.Registry"--%>
<form:form action="/registry/delete" method="POST" modelAttribute="registry">
    <input path="id" name="id" type="hidden"  value="${registry.id}" />
    <input type="submit" value="Delete" name="deleteBtn" />
</form:form>

</body>
</html>
