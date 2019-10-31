<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Index page</title>
  </head>
  <body>
    Administrator:
    <br/>
    <a href="<c:url value="/administrator/register"/>">register administrator</a>
    <br/>
    <a href="<c:url value="/administrator/show?administratorId=1"/>">show administrator</a>
    <br/>
    <a href="<c:url value="/administrator/update-user-data?administratorId=1"/>">update administrator (user data)</a>
    <br/>
    <a href="<c:url value="/administrator/update?administratorId=1"/>">update administrator</a>
    <br/>
    <a href="<c:url value="/administrator/delete?administratorId=1"/>">delete administrator</a>

    <br/><br/>
    Teacher:
    <br/>
    <a href="<c:url value="/teacher/create"/>">register teacher</a>
    <br/>
    <a href="<c:url value="/teacher/show?teacherId=1"/>">show teacher</a>
    <br/>
    <a href="<c:url value="/teacher/update-user-data?teacherId=1"/>">update teacher (user data)</a>
    <br/>
    <a href="<c:url value="/teacher/update?teacherId=1"/>">update teacher</a>
    <br/>
    <a href="<c:url value="/teacher/delete?teacherId=2"/>">delete teacher</a>


  </body>
</html>
