<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create registry</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 class="addS" align="center">Completing registry...</h3>
    <%--@elvariable id="registry" type="com.utm.entities.Registry"--%>
    <form:form action="/registry/create" method="POST" modelAttribute="registry">
    <div class="block" >
        <label for="mark">Put a mark:</label>
        <form:input path="mark" type="text" name="mark" />
        <form:errors path="mark" cssClass="error" />

        <label>Set the absence:</label>
        <form:checkbox path="absent" />
        <form:errors path="absent" cssClass="error"/>

        <label for="student">Select student:</label>
        <form:select path="student">
            <form:option value="-1" >Select student</form:option>
            <%--@elvariable id="students" type="java.util.List"--%>
            <form:options items="${students}" itemLabel="user.username" itemValue="id" />
        </form:select>
        <form:errors path="student" cssClass="error" />

        <label for="lesson">Select lesson:</label>
        <form:select path="lesson">
            <form:option value="-1" >Select lesson</form:option>
            <%--@elvariable id="lessons" type="java.util.List"--%>
            <form:options items="${lessons}" itemLabel="topic" itemValue="id" />
        </form:select>
        <form:errors path="lesson" cssClass="error" />
    </div>>
        <input type="submit" value="Submit" name="submitBtn" >
    </form:form>
</div>
</body>
</html>
