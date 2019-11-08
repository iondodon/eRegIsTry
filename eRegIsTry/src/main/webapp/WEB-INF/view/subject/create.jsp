<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new subject</title>

    <style>
        .error {
            color: darkred;
        }
    </style>
</head>
<body>
    <%--@elvariable id="subject" type="com.utm.entities.Subject"--%>
    <form:form action="/subject/create" method="POST" modelAttribute="subject" >
        <form:input path="subject" type="text" name="subject" placeholder="subject name" />
        <form:errors path="subject" cssClass="error" />

        <input type="submit" value="Submit" name="submitBtn">
    </form:form>
</body>
</html>
