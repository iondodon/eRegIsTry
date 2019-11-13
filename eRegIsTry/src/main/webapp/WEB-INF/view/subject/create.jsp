<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new subject</title>

    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 class="addS" align="center">Adding a new subject ...</h3>
    <%--@elvariable id="subject" type="com.utm.entities.Subject"--%>
    <form:form action="/subject/create" method="POST" modelAttribute="subject" >
    <div class="block">
        <label for="subject">Subject Name:</label>
        <form:input path="subject" type="text" name="subject" placeholder="subject name" />
        <form:errors path="subject" cssClass="error" />
    </div>
        <input type="submit" value="Submit" name="submitBtn">
    </form:form>
</div>
</body>
</html>
