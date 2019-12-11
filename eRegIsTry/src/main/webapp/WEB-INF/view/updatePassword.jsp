<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update password</title>

    <style> <%@include file="/WEB-INF/resource/stil.css"%></style>
    <style> <%@include file="/WEB-INF/resource/style.css"%></style>
</head>
<body>

    <security:authorize access="hasAuthority('CHANGE_PASSWORD_PRIVILEGE')">
        <form:form action="/user/updatePassword" method="POST" modelAttribute="passwordDto">
            <label for="password">Password:</label>
            <form:input path="password" type="text" name="password" placeholder="new password"/>
            <form:errors path="password" cssClass="error" />

            <label for="matchPassword">Match Password:</label>
            <form:input path="matchPassword" type="text" name="matchPassword" placeholder="confirm password"/>
            <form:errors path="matchPassword" cssClass="error" />

            <input type="submit" value="Change" name="submitBtn" />
        </form:form>
    </security:authorize>

</body>
</html>
