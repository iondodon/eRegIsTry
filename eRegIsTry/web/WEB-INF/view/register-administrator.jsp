<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ion
  Date: 10/29/19
  Time: 8:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Administrator</title>
</head>
<body>
    username: ${param.username}

    <form action="<c:url value="/register-administrator"/>" method="POST">
        <label>
            <input type="text" name="username" placeholder="username"/>
        </label>
        <label>
            <input type="text" name="username" placeholder="username"/>
        </label>
        <input type="submit" name="submitBtn" />
    <form>

</body>
</html>
