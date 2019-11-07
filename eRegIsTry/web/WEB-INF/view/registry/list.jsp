<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List registries</title>
</head>
<body>

<%--@elvariable id="registry" type="com.utm.entities.Registry"--%>
<%--@elvariable id="registries" type="java.util.List"--%>
<c:forEach items="${registries}" var="registry">
    <tr>
        <td>${registry.lesson.topic}</td>
        <td>${registry.student.user.username}</td>
        <td>${registry.mark}</td>
        <td>${registry.absent}</td>
        <td>....</td>
    </tr>
</c:forEach>

</body>
</html>
