<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Teachers </title>

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
<div style="height:100%;overflow:scroll;overflow-y:scroll;overflow-x:hidden;">
    <div>
        <h3 align="center">List of Teachers</h3>
        <table style="width:80%" align="center">
            <tr>
                <th width="30%">First Name</th>
                <th width="30%">Last Name</th>
                <th width="30%">Main Subject</th>
            </tr>
        </table>
        <%--@elvariable id="student" type="com.utm.entities.Student"--%>
        <%--@elvariable id="students" type="java.util.List"--%>
        <c:forEach items="${teachers}" var="teacher">
            <table style="width:80%" align="center">
                <tr>
                    <th width="30%" onclick="location.href ='<c:url value="/teacher/show?teacherId=${teacher.user.id}"/>';">${teacher.user.firstName}</th>
                    <th width="30%" onclick="location.href ='<c:url value="/teacher/show?teacherId=${teacher.user.id}"/>';">${teacher.user.lastName}</th>
                    <th width="30%">${teacher.baseSubject}</th>
                </tr>
            </table>
        </c:forEach>
    </div>
</div>
</body>
</html>
