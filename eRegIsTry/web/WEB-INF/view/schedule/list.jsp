<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List schedule records</title>
</head>
<body>

<%--@elvariable id="scheduleRecord" type="com.utm.entities.Schedule"--%>
<%--@elvariable id="scheduleRecords" type="java.util.List"--%>
<c:forEach items="${scheduleRecords}" var="scheduleRecord">
    <tr>
        <td>${scheduleRecord.group.name}</td>
        <td>${scheduleRecord.subject.subject}</td>
        <td>${scheduleRecord.day}</td>
        <td>${scheduleRecord.time.toString()}</td>
        <td>....</td>
    </tr>
</c:forEach>

</body>
</html>
