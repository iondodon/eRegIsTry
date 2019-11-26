<%--@elvariable id="student" type="com.utm.entities.Student"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <label>First Name:</label>
        <div class="sh">${student.user.firstName}</div>

        <label>Second Name:</label>
        <div class="sh">${student.user.lastName}</div>

        <label>Group:</label>
        <div class="sh">${student.group.name}</div>
    </div>

<div class="align" align="center">
        <input type="submit-button" value="Delete" name="deleteBtn" readonly="readonly" onclick="location.href ='<c:url value="/student/delete?studentId=${student.id}"/>';"/>
        <input type="submit-buttonU" value="Update" name="updateBtn" readonly="readonly" onclick="location.href ='<c:url value="/student/update?studentId=${student.id}"/>';"/>
</div>

</div>
</body>
</html>
