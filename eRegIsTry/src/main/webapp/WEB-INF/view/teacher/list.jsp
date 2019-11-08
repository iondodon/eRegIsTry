<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List teachers</title>
</head>
<body>

<%--@elvariable id="teacher" type="com.utm.entities.Teacher"--%>
<%--@elvariable id="teachers" type="java.util.List"--%>
<c:forEach items="${teachers}" var="teacher">
    <tr>
        <td>${teacher.user.username}</td>
        <td>${teacher.baseSubject.subject}</td>
        <td>....</td>
    </tr>
</c:forEach>

</body>
</html>
