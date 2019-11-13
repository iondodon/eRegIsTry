<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Schedule</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Delete schedule</h3>
<%--@elvariable id="schedule" type="com.utm.entities.Schedule"--%>
        <form:form action="/schedule/delete" method="POST" modelAttribute="schedule">
        <div class="sbmt" align="center">
            <label>Are you sure that you want to DELETE schedule?</label>
            <input path="id" name="id" type="hidden"  value="${schedule.id}" />
        </div>
            <input type="submit" value="Delete" name="deleteBtn" />
        </form:form>
</div>
</body>
</html>
