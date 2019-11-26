<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <div class="align" align="center">
        <input type="submit-button" value="Delete" name="deleteBtn" readonly="readonly" onclick="location.href ='<c:url value="/teacher/delete?teacherId=${teacher.id}"/>';"/>
        <input type="submit-buttonU" value="Update" name="updateBtn" readonly="readonly" onclick="location.href ='<c:url value="/teacher/update?teacherId=${teacher.id}"/>';"/>
    </div>
</div>
</body>
</html>
