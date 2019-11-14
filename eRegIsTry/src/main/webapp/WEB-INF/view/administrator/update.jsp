<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Update department</h3>
<%--@elvariable id="administrator" type="com.utm.entities.Administrator"--%>
<%--@elvariable id="user" type="com.utm.entities.User"--%>
    <form:form action="/administrator/update" method="POST" modelAttribute="administrator">
        <input path="id" name="id" type="hidden"  value="${administrator.id}" />

        <div class="block" >
            <label for="department">Department:</label>
            <form:input path="department" type="text" name="department" placeholder="department"/>
            <form:errors path="department" cssClass="error" />
        </div>
        <input type="submit" value="Update" name="submitBtn" />
    </form:form>
</div>
</body>
</html>
