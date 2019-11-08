<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List lessons</title>
</head>
<body>

<%--@elvariable id="lesson" type="com.utm.entities.Lesson"--%>
<%--@elvariable id="lessons" type="java.util.List"--%>
<c:forEach items="${lessons}" var="lesson">
    <tr>
        <td>${lesson.topic}</td>
        <td>....</td>
    </tr>
</c:forEach>

</body>
</html>
