<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update subject</title>
    <style>
        .error {
            color: darkred;
        }
    </style>
</head>
<body>

    <%--@elvariable id="subject" type="com.utm.entities.Subject"--%>
    <form:form action="/subject/update" modelAttribute="subject" method="POST" >
        <input path="id" name="id" type="hidden"  value="${subject.id}" />

        <form:input path="subject" type="text" name="subject" placeholder="subject name" />
        <form:errors path="subject" cssClass="error" />

        <input type="submit" value="Update" name="updateBtn">
    </form:form>

</body>
</html>
