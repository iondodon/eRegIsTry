<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List schedule records</title>
    <style> <%@include file="/WEB-INF/resource/stil.css"%></style>
    <style> <%@include file="/WEB-INF/resource/style.css"%></style>
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

<table class="blueTable">
    <thead>
    <tr>
        <td>Group name}</td>
        <td>Subject}</td>
        <td>Day}</td>
        <td>Time</td>
    </tr>
    </thead>
</table>
<%--@elvariable id="scheduleRecord" type="com.utm.entities.Schedule"--%>
<%--@elvariable id="scheduleRecords" type="java.util.List"--%>
<c:forEach items="${scheduleRecords}" var="scheduleRecord">
<table class="blueTable">
    <tbody>
    <tr>
        <td>${scheduleRecord.group.name}</td>
        <td>${scheduleRecord.subject.subject}</td>
        <td>${scheduleRecord.day}</td>
        <td>${scheduleRecord.time.toString()}</td>
        <td>....</td>
    </tr>
    </tbody>
</table>
</c:forEach>

</body>
</html>
