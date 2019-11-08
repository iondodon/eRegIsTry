<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Schedule</title>
</head>
<body>

<%--@elvariable id="schedule" type="com.utm.entities.Schedule"--%>
<form:form action="/schedule/delete" method="POST" modelAttribute="schedule">
    <input path="id" name="id" type="hidden"  value="${schedule.id}" />
    <input type="submit" value="Delete" name="deleteBtn" />
</form:form>

</body>
</html>
