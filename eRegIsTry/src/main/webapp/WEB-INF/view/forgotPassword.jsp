<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forgot password</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
    <style> <%@include file="/WEB-INF/resource/stil.css"%></style>
</head>
<body>

    <form:form action="/user/createResetPasswordToken" method="POST">
        <label>
            <input type="text" name="email" placeholder="email"/>
        </label>
        <input  type="submit" value="Submit" name="submitBtn" />
    </form:form>

</body>
</html>
