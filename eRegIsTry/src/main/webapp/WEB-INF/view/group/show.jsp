<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style> <%@include file="/WEB-INF/resource/stil.css"%></style>
</head>
<body>
<%--  ADMIN MENU--%>
<security:authorize access="hasRole('ROLE_ADMINISTRATOR')">
    <div class="navbar">
        <a class="active"  href="../../../index.jsp">Home</a>
        <a href="<c:url value="/schedule/show?scheduleId=2"/>">Schedule</a>
        <div class="subnav">
            <button class="subnavbtn">Utilities <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="/administrator/list">Admin</a>
                <a href="/teacher/list">Teachers</a>
                <a href="/student/list">Students</a>
                <a href="/group/list">Groups</a>
                <a href="/subject/list">Subjects</a>
                <a href="/lesson/list">Lessons</a>
                <a href="/registry/list">Registry</a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn">Register <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="/administrator/register">Admin</a>
                <a href="/teacher/create">Teachers</a>
                <a href="/student/create">Students</a>
                <a href="/group/create">Groups</a>
                <a href="/subject/create">Subjects</a>
                <a href="/lesson/create">Lessons</a>
                <a href="/registry/create">Registry</a>
                <a href="/schedule/create">Schedule</a>
            </div>
        </div>
            <%--      <a href="<c:url value="/administrator/register"/>">Register administrator</a>--%>
        <a class="a" style="float: right" href="/showLoginPage">Logout</a>
        <a href="#" style="float: right; color: aqua">
            User: <security:authentication property="principal.username" /> </a>

    </div>
</security:authorize>

<%--  TEACHER MENU--%>
<security:authorize access="hasRole('ROLE_TEACHER')">
    <div class="navbar">
        <a class="active"  href="../../../index.jsp">Home</a>
        <a href="<c:url value="/schedule/show?scheduleId=2"/>">Schedule</a>
        <div class="subnav">
            <button class="subnavbtn">Utilities <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="/group/list">Groups</a>
                <a href="/subject/list">Subjects</a>
                <a href="/lesson/list">Lessons</a>
                <a href="/registry/list">Registry</a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn">Register <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="/lesson/create">Lessons</a>
                <a href="/registry/create">Registry</a>
            </div>
        </div>
        <a class="a" style="float: right" href="/showLoginPage">Logout</a>
        <a href="#" style="float: right; color: aqua">
            User: <security:authentication property="principal.username" /> </a>

    </div>
</security:authorize>

<%--STUDENT MENU--%>
<security:authorize access="hasRole('ROLE_STUDENT')">
    <div class="navbar">
        <a class="active"  href="../../../index.jsp">Home</a>
        <a href="<c:url value="/schedule/show?scheduleId=2"/>">Schedule</a>
        <div class="subnav">
            <button class="subnavbtn">Utilities <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="/group/list">Groups</a>
                <a href="/subject/list">Subjects</a>
                <a href="/lesson/list">Lessons</a>
                <a href="/registry/list">Registry</a>
            </div>
        </div>
        <a class="a" style="float: right" href="/showLoginPage">Logout</a>
        <a href="#" style="float: right; color: aqua">
            User: <security:authentication property="principal.username" /> </a>

    </div>
</security:authorize>
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

    <div class="align" align="center">
        <input type="submit-button" value="Delete" name="deleteBtn" readonly="readonly" onclick="location.href ='<c:url value="/group/delete?groupId=${group.id}"/>';"/>
        <input type="submit-buttonU" value="Update" name="updateBtn" readonly="readonly" onclick="location.href ='<c:url value="/group/update?groupId=${group.id}"/>';"/>
    </div>
</div>
</body>
</html>
