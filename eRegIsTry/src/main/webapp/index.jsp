<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Index page</title>
      <style><%@include file="/WEB-INF/resource/stil.css"%></style>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>

  <body>

<%--  ADMIN MENU--%>
  <security:authorize access="hasRole('ROLE_ADMINISTRATOR')">
  <div class="navbar">
      <a class="active"  href="index.jsp">Home</a>
      <a href="<c:url value="/schedule/show?scheduleId=2"/>">Schedule</a>
      <div class="subnav">
          <button class="subnavbtn">Utilities <i class="fa fa-caret-down"></i></button>
          <div class="subnav-content">
              <a href="/administrator/list">Admin</a>
              <a href="/teacher/list">Teachers</a>
              <a href="/student/list">Students</a>
              <a href="/group/list">Groups</a>
              <a href="/subject/list">Subjects</a>
              <a href="/lesson/list">Lessons</a>
              <a href="/registry/list">Registry</a>
          </div>
      </div>
      <div class="subnav">
          <button class="subnavbtn">Register <i class="fa fa-caret-down"></i></button>
          <div class="subnav-content">
              <a href="/administrator/register">Admin</a>
              <a href="/teacher/create">Teachers</a>
              <a href="/student/create">Students</a>
              <a href="/group/create">Groups</a>
              <a href="/subject/create">Subjects</a>
              <a href="/lesson/create">Lessons</a>
              <a href="/registry/create">Registry</a>
              <a href="/schedule/create">Schedule</a>
          </div>
      </div>
<%--      <a href="<c:url value="/administrator/register"/>">Register administrator</a>--%>
      <a class="a" style="float: right" href="/showLoginPage">Logout</a>
      <a href="#" style="float: right; color: aqua">
                    User: <security:authentication property="principal.username" /> </a>

  </div>
  </security:authorize>

<%--  TEACHER MENU--%>
  <security:authorize access="hasRole('ROLE_TEACHER')">
      <div class="navbar">
          <a class="active"  href="index.jsp">Home</a>
          <a href="<c:url value="/schedule/show?scheduleId=2"/>">Schedule</a>
          <div class="subnav">
              <button class="subnavbtn">Utilities <i class="fa fa-caret-down"></i></button>
              <div class="subnav-content">
                  <a href="/group/list">Groups</a>
                  <a href="/subject/list">Subjects</a>
                  <a href="/lesson/list">Lessons</a>
                  <a href="/registry/list">Registry</a>
              </div>
          </div>
          <div class="subnav">
              <button class="subnavbtn">Register <i class="fa fa-caret-down"></i></button>
              <div class="subnav-content">
                  <a href="/lesson/create">Lessons</a>
                  <a href="/registry/create">Registry</a>
              </div>
          </div>
          <a class="a" style="float: right" href="/showLoginPage">Logout</a>
          <a href="#" style="float: right; color: aqua">
              User: <security:authentication property="principal.username" /> </a>

      </div>
  </security:authorize>

<%--STUDENT MENU--%>
<security:authorize access="hasRole('ROLE_STUDENT')">
    <div class="navbar">
        <a class="active"  href="index.jsp">Home</a>
        <a href="<c:url value="/schedule/show?scheduleId=2"/>">Schedule</a>
        <div class="subnav">
            <button class="subnavbtn">Utilities <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="/group/list">Groups</a>
                <a href="/subject/list">Subjects</a>
                <a href="/lesson/list">Lessons</a>
                <a href="/registry/list">Registry</a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn">Register <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="/lesson/create">Lessons</a>
                <a href="/registry/create">Registry</a>
            </div>
        </div>
        <a class="a" style="float: right" href="/showLoginPage">Logout</a>
        <a href="#" style="float: right; color: aqua">
            User: <security:authentication property="principal.username" /> </a>

    </div>
</security:authorize>


        <div>
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
        <br/>
        <a href="<c:url value="/administrator/list"/>">list administrators</a>

        <br/><br/>
        Student:
        <br/>
        <a href="<c:url value="/student/create"/>">create student</a>
        <br/>
        <a href="<c:url value="/student/show?studentId=1"/>">show student</a>
        <br/>
        <a href="<c:url value="/student/update-user-data?studentId=1"/>">update student (user data)</a>
        <br/>
        <a href="<c:url value="/student/update?studentId=1"/>">update student</a>
        <br/>
        <a href="<c:url value="/student/delete?studentId=1"/>">delete student</a>
        <br/>
        <a href="<c:url value="/student/list"/>">list students</a>

        <br/><br/>
        Group:
        <br/>
        <a href="<c:url value="/group/create"/>">create group</a>
        <br/>
        <a href="<c:url value="/group/show?groupId=2"/>">show group</a>
        <br/>
        <a href="<c:url value="/group/update?groupId=1"/>">update group</a>
        <br/>
        <a href="<c:url value="/group/delete?groupId=2"/>">delete group</a>
        <br/>
        <a href="<c:url value="/group/list"/>">list groups</a>

        <br/><br/>
        Subject:
        <br/>
        <a href="<c:url value="/subject/create" />">create subject </a>
        <br/>
        <a href="<c:url value="/subject/show?subjectId=1"/>">show subject</a>
        <br/>
        <a href="<c:url value="/subject/update?subjectId=1"/>">update subject</a>
        <br/>
        <a href="<c:url value="/subject/delete?subjectId=1"/>">delete subject</a>
        <br/>
        <a href="<c:url value="/subject/list"/>">list subjects</a>
    </div>

    <div>
        Registry:
        <br/>
        <a href="<c:url value="/registry/create" />">create registry </a>
        <br/>
        <a href="<c:url value="/registry/show?registryId=2"/>">show registry</a>
        <br/>
        <a href="<c:url value="/registry/update?registryId=2"/>">update registry</a>
        <br/>
        <a href="<c:url value="/registry/delete?registryId=2"/>">delete registry</a>
        <br/>
        <a href="<c:url value="/registry/list"/>">list registries</a>

        <br/><br/>

        Lesson:
        <br/>
        <a href="<c:url value="/lesson/create" />">create lesson</a>
        <br/>
        <a href="<c:url value="/lesson/show?lessonId=3"/>">show lesson</a>
        <br/>
        <a href="<c:url value="/lesson/update?lessonId=2"/>">update lesson</a>
        <br/>
        <a href="<c:url value="/lesson/delete?lessonId=1"/>">delete lesson</a>
        <br/>
        <a href="<c:url value="/lesson/list"/>">list lessons</a>

        <br/><br/>

        Schedule:
        <br/>
        <a href="<c:url value="/schedule/create" />">create schedule</a>
        <br/>
        <a href="<c:url value="/schedule/show?scheduleId=2"/>">show schedule</a>
        <br/>
        <a href="<c:url value="/schedule/update?scheduleId=2"/>">update schedule</a>
        <br/>
        <a href="<c:url value="/schedule/delete?scheduleId=2"/>">delete schedule</a>
        <br/>
        <a href="<c:url value="/schedule/list"/>">list schedule</a>

        <br/><br/>
        Teacher:
        <br/>
        <a href="<c:url value="/teacher/create"/>">create teacher</a>
        <br/>
        <a href="<c:url value="/teacher/show?teacherId=1"/>">show teacher</a>
        <br/>
        <a href="<c:url value="/teacher/update-user-data?teacherId=1"/>">update teacher (user data)</a>
        <br/>
        <a href="<c:url value="/teacher/update?teacherId=1"/>">update teacher</a>
        <br/>
        <a href="<c:url value="/teacher/delete?teacherId=2"/>">delete teacher</a>
        <br/>
        <a href="<c:url value="/teacher/list"/>">list teachers</a>
    </div>

    <div>
        <a href="<c:url value="/my-account"/>">my account</a>
    </div>
  <div>
      <div class="acasa">

      </div>

      <p style="font-size: 50px">News!</p>

      <h2 style="align-content: center">STUDENTS’ SELECTION CONTEST FOR ICM WITHIN ERASMUS+ PROGRAMME IN POLAND</h2>
      <br>
      <h1>Technical University of Moldova announces the organization of a selection contest of candidates for academic mobility at the Białystok University of Technology, Poland, within the Erasmus+ programme. Białystok University of Technology offers 1 mobility grant of 5 months for BSc student. The amount of BSc student’s scholarship is 800 €/month, additionally an amount of return ticket will be reimbursed (275€).

          The candidates’ applications may be submitted to the Faculty Erasmus+ Coordinator in the period 21.11.2019 – 27.11.2019.

          Selection of candidates for mobility will be conducted by the Selection Committee at the following address: within the International Relations Office, TUM, 168 Stefan cel Mare si Sfant blvd., building No. 1, room 203.

          The submitted files will contain documents in English only. The final results of the selection of candidates will be announced by the Białystok University of Technology.

          Details about the academic offer:  Electrical Engineering.</h1>
      <br>
      <br>

      <h2>SELECTION CALENDAR</h2>
      <br>
      <h1>  21.11.2019 – 27.11.2019 – REGISTRATION based on the candidature application. CONSULTATION regarding the preparation of the application</h1>
      <br>
      <h1>28.11.2019 – SELECTION INTERVIEW (location, time). International Relations Office, 168 Stefan cel Mare si Sfant blvd., building no. 1, office 203, 14.00 o’clock</h1>
      <br>
      <h1> 28.11.2019 – ANNOUNCEMENT of the preliminary results</h1>
      <br>
      <h1>28.11.2019 – TRANSMISSION of the files to Białystok University of Technology for final evaluation.</h1>

  </div>
<a style="float: right; color: #224abe; font-family: 'Bodoni MT',sans-serif" href="<c:url value="/administrator/register"/>">Register a new administrator</a>
<a class="a" style="float: left; font-family: 'Bodoni MT',sans-serif; color: #224abe;" href="/showLoginPage">Go to login page</a>
  </body>
</html>
