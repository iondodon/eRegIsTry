<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show schedule</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Schedule information</h3>
    <div class="block" >
        <label>Day:</label>
        <div class="sh">${schedule.day}</div>

        <label>Time:</label>
        <div class="sh">${schedule.day}</div>

        <label>Day:</label>
        <div class="sh">${schedule.group.name}</div>

        <label>Subject:</label>
        <div class="sh">${schedule.subject.subject}</div>
    </div>
</div>

</body>
</html>
