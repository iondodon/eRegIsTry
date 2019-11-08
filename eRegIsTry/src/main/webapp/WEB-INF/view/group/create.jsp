<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Group</title>

    <style>
        .error {
            color: darkred;
        }
    </style>
</head>
<body>
    <%--@elvariable id="group" type="com.utm.entities.Group"--%>
    <form:form action="/group/create" modelAttribute="group" method="POST" >
        name:
        <form:input path="name" type="text" name="name" placeholder="group name" />
        <form:errors path="name" cssClass="error" />

        <br/>

        master:
        <form:select path="master">
            <form:option value="-1">Select master</form:option>
            <form:options items="${teachers}" itemLabel="user.username" itemValue="id" />
        </form:select>

        <br/>

<%--        students:--%>
<%--        <form:select path="students" multiple="true">--%>
<%--            <form:option value="-1">Select students</form:option>--%>
<%--            <form:options items="${students}" itemLabel="user.username" itemValue="id" />--%>
<%--        </form:select>--%>

        <input type="submit" value="Submit" name="submitBtn">
    </form:form>

</body>
</html>
