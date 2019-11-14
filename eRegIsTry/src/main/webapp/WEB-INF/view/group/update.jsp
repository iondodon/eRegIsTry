<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update group</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Update group</h3>
    <%--@elvariable id="group" type="com.utm.entities.Group"--%>
    <form:form action="/group/update" modelAttribute="group" method="POST" >
        <input path="id" name="id" type="hidden"  value="${group.id}" />

    <div class="block" >
        <label for="name">Name:</label>
        <form:input path="name" type="text" name="name" placeholder="group name" />
        <form:errors path="name" cssClass="error" />

        <label for="master">Master:</label>
        <form:select path="master">
            <form:option value="-1">Select master</form:option>
            <form:options items="${teachers}" itemLabel="user.username" itemValue="id" />
        </form:select>

    </div>

        <%--        students:--%>
        <%--        <form:select path="students" multiple="true">--%>
        <%--            <form:option value="-1">Select students</form:option>--%>
        <%--            <form:options items="${students}" itemLabel="user.username" itemValue="id" />--%>
        <%--        </form:select>--%>

        <input type="submit" value="Update" name="updateBtn">
    </form:form>
</div>
</body>
</html>
