<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Group</title>

    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 class="add" align="center">Creating a new group ...</h3>
    <%--@elvariable id="group" type="com.utm.entities.Group"--%>
    <form:form action="/group/create" modelAttribute="group" method="POST" >
    <div class="block" >
        <label for="name">Name:</label>
        <form:input path="name" type="text" name="name" placeholder="group name" />
        <form:errors path="name" cssClass="error" />

        <label for="master">Select master:</label>
        <form:select path="master">
            <form:option value="-1">Select master</form:option>
            <form:options items="${teachers}" itemLabel="user.username" itemValue="id" />
        </form:select>

<%--        students:--%>
<%--        <form:select path="students" multiple="true">--%>
<%--            <form:option value="-1">Select students</form:option>--%>
<%--            <form:options items="${students}" itemLabel="user.username" itemValue="id" />--%>
<%--        </form:select>--%>
    </div>
        <input type="submit" value="Submit" name="submitBtn">
    </form:form>
</div>
</body>
</html>