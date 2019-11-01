<%@ page import="com.utm.entities.Student" %>
<%@ page import="com.utm.entities.Group" %>
<%@ page import="java.util.List" %>
<%--@elvariable id="students" type="com.utm.entities.Student"--%>
<%--@elvariable id="master" type="com.utm.entities.Teacher"--%>
<%--@elvariable id="name" type="com.utm.entities.Group"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show group</title>
</head>
<body>
    group name: ${group.name}
    <br/>
    master: ${group.master.user.username}
    <br/>
    students:
    <%
        Group group = (Group) request.getAttribute("group");
        List<Student> students = group.getStudents();

        for (Student student: students) {
            student.getUser().getUsername();
        }
    %>
</body>
</html>
