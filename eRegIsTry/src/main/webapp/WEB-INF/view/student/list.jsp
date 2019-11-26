<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Students </title>

    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            text-align: center;
        }
    </style>
    <style><%@include file="/WEB-INF/resource/stil.css"%></style>
</head>
<body>
<ul>
    <li><a class="active" href="#home">Home</a></li>
    <li><a href="#news">News</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#about">About</a></li>
    <li style="float: right"><a href="/showLoginPage">Logout</a></li>
</ul>
<div class="menu">

<div style="height:100%;overflow:scroll;overflow-y:scroll;overflow-x:hidden;">
<div>
    <h3 align="center">List of Students</h3>
        <table style="width:80%" align="center">
            <tr>
                <th width="30%">First Name</th>
                <th width="30%">Last Name</th>
                <th width="30%">Group Name</th>
            </tr>
        </table>
<%--@elvariable id="student" type="com.utm.entities.Student"--%>
<%--@elvariable id="students" type="java.util.List"--%>
<c:forEach items="${students}" var="student">
    <table style="width:80%" align="center">
        <tr>
            <th width="30%" onclick="location.href ='<c:url value="/student/show?studentId=${student.id}"/>';">${student.user.firstName}</th>
            <th width="30%" onclick="location.href ='<c:url value="/student/show?studentId=${student.id}"/>';">${student.user.lastName}</th>
            <th width="30%">${student.group.name}</th>
        </tr>
    </table>
</c:forEach>
</div>
</div>
</div>
</body>
</html>
