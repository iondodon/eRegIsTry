<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style> <%@include file="/cssresource/style.css"%>
    </style>
    <style><%@include file="/WEB-INF/resource/style.css"%></style>
</head>
<body>
<div class="logo">
    <img src="https://i.pinimg.com/474x/74/de/e4/74dee4c4569e34586c74e10c209dbe57.jpg" alt="My Image" height="200" width="200">
</div>

<div class="login">
    <h4 style="font-family: Verdana;"><i>Login:</i></h4>
</div>
<div class="username">
    <h5 ><i>Username:</i></h5>
</div>

<div class="password">
    <h5 ><i>Password:</i></h5>
</div>

<%--<div class="forgotLink">--%>
<%--    <a href="http://" target="_blank">Forgot your password?</a>--%>
<%--</div>--%>
<div class="forgot_password.css">
    <a href="<c:url value="/user/forgotPassword"/>">Forgot your password?</a>
</div>

<div class="register">
    <h5 >Join as:</h5>
</div>
<div class="teacher">
    <input type="image" src="http://icons.iconarchive.com/icons/hopstarter/soft-scraps/256/User-Executive-Green-icon.png" name="myImageButton" alt="Submit" width="70" height="70">
</div>
<div class="teacherText">
    <h5 >teacher</h5>
</div>
<div class="student">
    <input type="image" src="http://icons.iconarchive.com/icons/hopstarter/soft-scraps/256/User-Coat-Green-icon.png" name="myImageButton" alt="Submit" width="70" height="70">
</div>
<div class="studentText">
    <h5 >student</h5>
</div>
<div class="admin">
    <input type="image" src="http://icons.iconarchive.com/icons/hopstarter/soft-scraps/256/User-Executive-Blue-icon.png" name="myImageButton" alt="Submit" width="70" height="70">
</div>
<div class="adminText">
    <h5 >administration</h5>
</div>

<!-- Login Form -->
<form:form action="${pageContext.request.contextPath}/authenticateTheUser"
           method="POST" class="form-horizontal">

    <!-- Place for messages: error, alert etc ... -->
<%--    <div class="form-group">--%>
<%--        <div class="col-xs-15">--%>


                <!-- Check for login error -->



<%--        </div>--%>
<%--    </div>--%>

    <!-- User name -->
    <div class="usernameField">
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>

        <input type="text" name="username" placeholder="username" class="form-control">
    </div>

    <!-- Password -->
    <div class="passwordField">
        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>

        <input type="password" name="password" placeholder="password" class="form-control" >
    </div>

    <!-- Login/Submit Button -->

    <div>
        <c:if test="${param.logout != null}">

            <div class="alert">
                You have been logged out.
            </div>

        </c:if>
    </div>
    <div class="loginBtn">
            <input type="submit" value="Login" name="logBtn" style="text-align: center">

    </div>

<div>
        <c:if test="${param.error != null}">

        <div class="alert">
            Invalid username and password.
        </div>
        </c:if>

        <!-- Check for logout -->


</div>
</form:form>

</body>
</html>
