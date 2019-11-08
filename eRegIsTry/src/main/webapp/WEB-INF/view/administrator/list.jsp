<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List administrator</title>
</head>
<body>

<%--${administrators}--%>

<%--@elvariable id="administrator" type="com.utm.entities.Administrator"--%>
<c:forEach items="${administrators}" var="administrator">
    <tr>
        <td>${administrator.user.username}</td>
        <td>${administrator.department}</td>
    </tr>
</c:forEach>

</body>
</html>
