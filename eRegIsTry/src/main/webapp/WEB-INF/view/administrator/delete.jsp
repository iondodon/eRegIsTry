<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete User</title>
</head>
<body>

<%--@elvariable id="administrator" type="com.utm.entities.Administrator"--%>
<%--@elvariable id="user" type="com.utm.entities.User"--%>
    <form:form action="/administrator/delete" method="POST" modelAttribute="user">
        <input path="id" name="id" type="hidden"  value="${user.id}" />
        <%--        <input path="administrator" name="administrator" type="hidden" value="${user.administrator.id}" />--%>

        <input type="submit" value="Delete" name="deleteBtn" />
    </form:form>

</body>
</html>
