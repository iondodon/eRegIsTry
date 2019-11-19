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
</head>
<body>
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
            <th width="30%">${student.user.firstName}</th>
            <th width="30%">${student.user.lastName}</th>
            <th width="30%">${student.group.name}</th>
        </tr>
    </table>
</c:forEach>
</div>
</body>
</html>
