<%--@elvariable id="student" type="com.utm.entities.Student"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show student</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Student information</h3>
    <div class="block" >
        <label>Username:</label>
        <div class="sh">${student.user.username}</div>

        <label>Fisrt Name:</label>
        <div class="sh">${student.user.firstName}</div>

        <label>Second Name:</label>
        <div class="sh">${student.user.lastName}</div>

        <label>Group:</label>
        <div class="sh">${student.group.name}</div>
    </div>
</div>
</body>
</html>
