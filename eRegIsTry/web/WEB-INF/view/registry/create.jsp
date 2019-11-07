<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create registry</title>
</head>
<body>

    <%--@elvariable id="registry" type="com.utm.entities.Registry"--%>
    <form:form action="/registry/create" method="POST" modelAttribute="registry">
        mark:
        <form:input path="mark" type="text" name="mark" />
        <form:errors path="mark" cssClass="error" />

        <br/>

        absent:
        <form:checkbox path="absent" />
        <form:errors path="absent" cssClass="error"/>

        <br/>

        student:
        <form:select path="student">
            <form:option value="-1" >Select student</form:option>
            <%--@elvariable id="students" type="java.util.List"--%>
            <form:options items="${students}" itemLabel="user.username" itemValue="id" />
        </form:select>
        <form:errors path="student" cssClass="error" />

        <br/>

        lesson:
        <form:select path="lesson">
            <form:option value="-1" >Select lesson</form:option>
            <%--@elvariable id="lessons" type="java.util.List"--%>
            <form:options items="${lessons}" itemLabel="topic" itemValue="id" />
        </form:select>
        <form:errors path="lesson" cssClass="error" />

        <br/>

        <input type="submit" value="Submit" name="submitBtn" >
    </form:form>

</body>
</html>
