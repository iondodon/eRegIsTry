<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="forgot_password.css">
<head>
    <title>Forgot password</title>
    <style> <%@include file="/cssresource/forgot_password.css"%>
    </style>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
    <style> <%@include file="/WEB-INF/resource/stil.css"%></style>
</head>
<body>
<div id="highlighted" class="hl-basic hidden-xs">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-9 col-sm-offset-3 col-md-9 col-md-offset-3 col-lg-10 col-lg-offset-2">
                <h1>
                    Forgot Password
                </h1>
            </div>
        </div>
    </div>
</div>
<div id="content" class="interior-page">
    <div class="container-fluid">
        <div class="row">
    <form:form action="/user/createResetPasswordToken" method="POST">
        <div class="col-sm-9 col-md-9 col-lg-10 content equal-height">
            <div class="content-area-right">
                <div class="content-crumb-div">
                    <a href="">Home</a> / <a href="">Your Account</a> / Forgot Password
                </div>
                <div class="row">
                    <div class="col-md-5 forgot-form">
                        <p>
                            Please enter your email address below and we will send you information to change your password.
                        </p>
                        <label class="label-default">Email Address</label>
                        <label>
                            <input class="form-control" type="text" name="email" placeholder="email"/>
                        </label>
                    </div>

                </div>
            </div>
        </div>
        <input  type="submit" value="Submit" name="submitBtn" />


    </form:form>

</body>
</html>
