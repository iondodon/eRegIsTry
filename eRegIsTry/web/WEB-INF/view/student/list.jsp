<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List schedule records</title>
</head>
<body>

<%--@elvariable id="student" type="com.utm.entities.Student"--%>
<%--@elvariable id="students" type="java.util.List"--%>
<c:forEach items="${students}" var="student">
    <tr>
        <td>${student.user.firstName}</td>
        <td>${student.user.lastName}</td>
        <td>${student.group.name}</td>
        <td>....</td>
    </tr>
</c:forEach>

</body>
</html>
