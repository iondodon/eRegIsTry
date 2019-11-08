<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List subjects</title>
</head>
<body>

<%--@elvariable id="subject" type="com.utm.entities.Subject"--%>
<%--@elvariable id="subjects" type="java.util.List"--%>
<c:forEach items="${subjects}" var="subject">
    <tr>
        <td>${subject.subject}</td>
        <td>....</td>
    </tr>
</c:forEach>

</body>
</html>
