<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List administrator</title>
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
            <th width="30%">Department Name</th>
        </tr>
    </table>
<%--${administrators}--%>

<%--@elvariable id="administrator" type="com.utm.entities.Administrator"--%>
<c:forEach items="${administrators}" var="administrator">

    <table style="width:80%" align="center">
        <tr>
            <th width="30%">${administrator.user.firstName}</th>
            <th width="30%">${administrator.user.lastName}</th>
            <th width="30%">${administrator.department}</th>
        </tr>
    </table>
</c:forEach>

</body>
</html>
