<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Student (user data)</title>

    <style> <%@include file="/WEB-INF/resource/style.css"%></style>
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
            <%--        <div class="subnav">--%>
            <%--            <button class="subnavbtn">Register <i class="fa fa-caret-down"></i></button>--%>
            <%--            <div class="subnav-content">--%>
            <%--                <a href="/lesson/create">Lessons</a>--%>
            <%--                <a href="/registry/create">Registry</a>--%>
            <%--            </div>--%>
            <%--        </div>--%>
        <a class="a" style="float: right" href="/showLoginPage">Logout</a>
        <a href="#" style="float: right; color: aqua">
            User: <security:authentication property="principal.username" /> </a>

    </div>
</security:authorize>
<div>
    <h3 align="center">Update user data</h3>
<%--@elvariable id="administrator" type="com.utm.entities.Administrator"--%>
<%--@elvariable id="user" type="com.utm.entities.User"--%>
<form:form action="/student/update-user-data" method="POST" modelAttribute="user">
    <input path="id" name="id" type="hidden"  value="${user.id}" />
    <%--        <input path="administrator" name="administrator" type="hidden" value="${user.administrator.id}" />--%>
    <div class="block" >
        <label for="username">Username:</label>
    <form:input path="username" type="text" name="username" placeholder="username"/>
    <form:errors path="username" cssClass="error" />

        <label for="firstName">First Name:</label>
    <form:input path="firstName" type="text" name="first-name" placeholder="first name"/>
    <form:errors path="firstName" cssClass="error" />

        <label for="lastName">Second Name:</label>
    <form:input path="lastName" type="text" name="second-name" placeholder="second name"/>
    <form:errors path="lastName" cssClass="error" />
    </div>
    <input type="submit" value="Update" name="submitBtn" />
</form:form>
</div>
</body>
</html>
