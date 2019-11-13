<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show registry</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Registry information</h3>
    <div class="block" >
        <label>Student Name</label>
        <div class="sh">${registry.student.user.username} </div>

        <label>Lesson:</label>
        <div class="sh">${registry.lesson.topic}</div>

        <label>Lesson:</label>
        <div class="sh">${registry.mark}</div>

        <label>Lesson:</label>
        <div class="sh">${registry.absent}</div>
    </div>
</div>
</body>
</html>
