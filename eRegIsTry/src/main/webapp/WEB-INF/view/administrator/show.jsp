<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show administrator</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Information about administrator</h3>
    <div class="block" >
        <label>Username:</label>
        <div class="sh"> ${administrator.user.username}</div>

        <label>First Name: </label>
        <div class="sh"> ${administrator.user.firstName} </div>

        <label>Last Name: </label>
        <div class="sh"> ${administrator.user.lastName}</div>

        <label>Department:</label>
        <div class="sh"> ${administrator.department}</div>
    </div>
</div>
</body>
</html>
