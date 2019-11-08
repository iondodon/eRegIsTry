<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List groups</title>
</head>
<body>

<%--@elvariable id="group" type="com.utm.entities.Group"--%>
<c:forEach items="${groups}" var="group">
    <tr>
        <td>${group.name}</td>
        <td>${group.master.user.username}</td>
    </tr>
</c:forEach>

</body>
</html>
