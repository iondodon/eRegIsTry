<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show lesson</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Information about lesson</h3>
    <div class="block" >
        <label>Date and time:</label>
        <div class="sh">${lesson.datetime.toString()}</div>

        <label>Homework:</label>
        <div class="sh">${lesson.homework}</div>

        <label>Topic:</label>
        <div class="sh">${lesson.topic}</div>

        <label>Subject:</label>
        <div class="sh">${lesson.subject.subject}</div>

        <label>Teacher:</label>

        <div class="sh"> ${lesson.teacher.user.username}</div>
    </div>
</div>
</body>
</html>
