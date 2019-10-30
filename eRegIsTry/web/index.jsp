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
    <a href="<c:url value="/administrator/update?id=4"/>">update administrator</a>

  </body>
</html>
