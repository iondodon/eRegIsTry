<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My account</title>
    <style><%@include file="/WEB-INF/resource/stil.css"%></style>
    <style><%@include file="/WEB-INF/resource/style.css"%></style>
<%--    <style><%@include file="/WEB-INF/resource/style.css"%></style>--%>
</head>
<body>
<%--<h3 align="center">My account page</h3>--%>
<ul class="ul">
    <li class="li"><a class="a" class="active" href="../../index.jsp">Home</a></li>
    <li class="li"><a class="a" href="my-account.jsp">My account</a></li>
    <li class="li"><a class="a" href="<c:url value="schedule/show?scheduleId=2"/>">Schedule</a></li>
    <li class="li" class="dropdown"><a class="a" href="javascript:void(0)" class="dropbtn">Utilities</a>
        <div class="dropdown-content">
            <a   href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
        </div>
    </li>
    <li class="li" style="float: right"><a class="a" href="/showLoginPage">Logout</a></li>
</ul>
<div class="menu">


    <!-- display user name and role -->
    <div class="block">
        User: <security:authentication property="principal.username" />
        Role(s): <security:authentication property="principal.authorities" />


</div>>
</div>
    <!-- Add a logout button -->
<%--    <form:form action="${pageContext.request.contextPath}/logout" method="POST">--%>
<%--            <input type="submit" value="Logout" />--%>
<%--    </form:form>--%>
</body>
</html>
