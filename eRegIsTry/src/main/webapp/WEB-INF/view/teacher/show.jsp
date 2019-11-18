<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show teacher</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Teacher information</h3>
    <div class="block" >
        <label>Username:</label>
        <div class="sh">${teacher.user.username}</div>

        <label>First Name: </label>
        <div class="sh">${teacher.user.firstName}</div>

        <label>Last Name:</label>
        <div class="sh">${teacher.user.lastName}</div>

        <label>Base Subject:</label>

        <div class="sh">${teacher.baseSubject.subject}</div>
    </div>
</div>
</body>
</html>
