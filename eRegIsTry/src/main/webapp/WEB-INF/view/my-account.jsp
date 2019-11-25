<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
<ul>
    <li><a class="active" href="<c:url value="index.jsp"/>">Home</a></li>
    <li><a href="<c:url value="/my-account"/>">My account</a></li>
    <li><a href="<c:url value="/schedule/show"/>">Schedule</a></li>
    <li><a href="#contact">Utilities</a></li>
    <li style="float: right"><a href="login.jsp">Logout</a></li>
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
