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
    <a href="<c:url value="/administrator/show?administratorId=2"/>">show administrator</a>
    <br/>
    <a href="<c:url value="/administrator/update-user-data?administratorId=2"/>">update administrator (user data)</a>
    <br/>
    <a href="<c:url value="/administrator/update?administratorId=2"/>">update administrator</a>
    <br/>
    <a href="<c:url value="/administrator/delete?administratorId=2"/>">delete administrator</a>

    <br/><br/>



  </body>
</html>
