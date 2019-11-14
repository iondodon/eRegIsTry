<%--
  Created by IntelliJ IDEA.
  User: vaseo
  Date: 11/13/2019
  Time: 7:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>

    <style>
        .failed {
            color: red;
        }
    </style>
</head>
<body>

    <h3>Login Page</h3>

        <form:form action="${pageContext.request.contextPath}/authenticateTheUser"
            method="POST">

            <!-- Check for login error -->

            <c:if test="${param.error != null}">

                <i class="failed">Sorry! You entered invalid username/password.</i>

            </c:if>

            <p>
                User name: <input type="text" name="username" />
            </p>

            <p>
                Password: <input type="password" name="password" />
            </p>

            <input type="submit" value="Login" />

        </form:form>

</body>
</html>
