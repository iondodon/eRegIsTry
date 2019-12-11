<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Student</title>

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
        <a class="a" style="float: right" href="/showLoginPage">Logout</a>
        <a href="#" style="float: right; color: aqua">
            User: <security:authentication property="principal.username" /> </a>

    </div>
</security:authorize>

<div>
    <h3 class="add" align="center">Adding a new student ...</h3>
    <%--@elvariable id="user" type="com.utm.entities.User"--%>
    <form:form action="/student/create" method="POST" modelAttribute="user">
    <div class="block" >
        <label for="username">Username:</label>
        <form:input path="username" type="text" name="username" placeholder="username"/>
        <form:errors path="username" cssClass="error" />

        <label for="password">Password:</label>
        <form:input path="password" type="password" name="password" placeholder="password"/>
        <form:errors path="password" cssClass="error" />


        <label for="passwordConfirmation">Confirm Password:</label>
        <form:input path="passwordConfirmation" type="password" name="password-confirmation" placeholder="retype password"/>


        <label for="firstName">First Name:</label>
        <form:input path="firstName" type="text" name="first-name" placeholder="first name"/>
        <form:errors path="firstName" cssClass="error" />

        <label for="lastName">Last Name:</label>
        <form:input path="lastName" type="text" name="second-name" placeholder="second name"/>
        <form:errors path="lastName" cssClass="error" />

        <label for="email">Email:</label>
        <form:input path="email" type="text" name="email" placeholder="email"/>
        <form:errors path="email" cssClass="error" />

        <label>Group:</label>
        <form:select path="student.group">
            <form:option value="-1">Select group</form:option>
            <%--@elvariable id="groups" type="java.util.List"--%>
            <form:options items="${groups}" itemLabel="name" itemValue="id" />
        </form:select>
    </div>

        <%--            roles:--%>
        <%--            &lt;%&ndash;@elvariable id="roles" type="java.util.List"&ndash;%&gt;--%>
        <%--            <form:select multiple="true" path="roles" items="${roles}" itemLabel="nombre" itemValue="id" />--%>
        <form:errors path="passwordConfirmation" cssClass="error" />
        <input type="submit" value="Submit" name="submitBtn" />
    </form:form>
</div>
</body>
</html>
