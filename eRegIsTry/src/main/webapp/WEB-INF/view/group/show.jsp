<%@ page import="com.utm.entities.Student" %>
<%@ page import="com.utm.entities.Group" %>
<%@ page import="java.util.List" %>
<%--@elvariable id="students" type="com.utm.entities.Student"--%>
<%--@elvariable id="master" type="com.utm.entities.Teacher"--%>
<%--@elvariable id="name" type="com.utm.entities.Group"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show group</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Information about group</h3>
    <div class="block" >
        <label>Group Name:</label>
        <div class="sh">${group.name} </div>

        <label>Master:</label>
        <div class="sh">${group.master.user.username}</div>

        <label>Students:</label>
        <div class="sh"> To add students in group!!!
<%--    <%--%>
<%--        Group group = (Group) request.getAttribute("group");--%>
<%--        List<Student> students = group.getStudents();--%>

<%--        //TODO: to lists students--%>
<%--        for (Student student: students) {--%>
<%--            student.getUser().getUsername();--%>
<%--        }--%>
<%--    %>--%>
        </div>
    </div>
</body>
</html>
