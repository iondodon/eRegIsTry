<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html>
<head>
    <style> <%@ include file="assets/css/style.css" %>
    </style>
    <style> <%@ include file="assets/js/util.js" %></style>
<style> <%@ include file= "assets/js/main.js"%></style>
    <style> <%@ include file= "assets/js/doc.js"%></style>
    <style><%@include file="/WEB-INF/resource/stil.css"%></style>
<%--     document.getElementsByTagName("html")[0].className += " js";--%>

    <title>Schedule Template | CodyHouse</title>
    </head>
    <body>
    <ul class="ul">
        <li class="li"><a class="active" href="../../../index.jsp">Home</a></li>
        <li class="li"><a class="a" href="<c:url value="my-account"/>">My account</a></li>
        <li class="li"><a class="a" href="<c:url value="/schedule/show?scheduleId=2"/>">Schedule</a></li>
        <li class="li" class="dropdown"><a class="a" href="javascript:void(0)" class="dropbtn">Utilities</a>
            <div class="dropdown-content">
                <a href="#">Link 1</a>
                <a href="#">Link 2</a>
                <a href="#">Link 3</a>
            </div>
        </li>
        <li class="li" style="float: right"><a class="a" href="/showLoginPage">Logout</a></li>
    </ul>

    <header class="cd-main-header text-center flex flex-column flex-center">
        <!--    <p class="margin-top-md margin-bottom-xl">👈 <a class="cd-article-link" href="https://codyhouse.co/gem/schedule-template">Article &amp; Download</a></p>-->

        <h1 class="text-xl">Schedule: </h1>
    </header>

    <div class="cd-schedule cd-schedule--loading margin-top-lg margin-bottom-lg js-cd-schedule">
        <div class="cd-schedule__timeline">
            <ul>
                <li><span>08:00-09:30</span></li>
                <li><span>09:45-11:15 </span></li>
                <li><span>11:30-13:00</span></li>
                <li><span>13:30-15:00</span></li>
                <li><span>15:15-16:45</span></li>
                <li><span>17:00-18:30</span></li>
                <li><span>18:45-20:15</span></li>
            </ul>
        </div> <!-- .cd-schedule__timeline -->

        <div class="cd-schedule__events">
            <ul>
                <li class="cd-schedule__group">
                    <div class="cd-schedule__top-info"><span>Monday</span></div>

                    <ul>

                        <li class="cd-schedule__event">
                            <ul>
                                <li>
                                    <a data-start="08:00" data-end="09:30" data-content="event-abs-circuit" data-event="event-1" href="#0">
                                        <em class="cd-schedule__name">Network Programming</em>
                                    </a>
                                </li>
                                <li>
                                    <a data-start="09:45" data-end="11:15" data-content="event-abs-circuit" data-event="event-1" href="#0">
                                        <em class="cd-schedule__name">Project</em>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="cd-schedule__event">
                            <ul>
                                <li>
                                    <a data-start="08:00" data-end="09:30" data-content="event-rowing-workout" data-event="event-2" href="#0">
                                        <em class="cd-schedule__name">Programming</em>
                                    </a>
                                </li>
                                <li>
                                    <a data-start="15:15" data-end="16:45" data-content="event-rowing-workout" data-event="event-2" href="#0">
                                        <em class="cd-schedule__name">Project</em>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="cd-schedule__event">
                            <a data-start="13:30" data-end="15:00"  data-content="event-yoga-1" data-event="event-3" href="#0">
                                <em class="cd-schedule__name">Design Patterns</em>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="cd-schedule__group">
                    <div class="cd-schedule__top-info"><span>Tuesday</span></div>

                    <ul>
                        <li class="cd-schedule__event">
                            <a data-start="09:45" data-end="11:15"  data-content="event-rowing-workout" data-event="event-2" href="#0">
                                <em class="cd-schedule__name">Graphics</em>
                            </a>
                        </li>

                        <li class="cd-schedule__event">
                            <a data-start="11:30" data-end="13:00"  data-content="event-restorative-yoga" data-event="event-4" href="#0">
                                <em class="cd-schedule__name">Object Oriented Programming</em>
                            </a>
                        </li>

                        <li class="cd-schedule__event">
                            <a data-start="13:30" data-end="15:00" data-content="event-abs-circuit" data-event="event-1" href="#0">
                                <em class="cd-schedule__name">Circuits</em>
                            </a>
                        </li>

                        <li class="cd-schedule__event">
                            <a data-start="15:15" data-end="16:45"  data-content="event-yoga-1" data-event="event-3" href="#0">
                                <em class="cd-schedule__name">Programming</em>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="cd-schedule__group">
                    <div class="cd-schedule__top-info"><span>Wednesday</span></div>

                    <ul>
                        <li class="cd-schedule__event">
                            <a data-start="09:00" data-end="10:15" data-content="event-restorative-yoga" data-event="event-4" href="#0">
                                <em class="cd-schedule__name">Law</em>
                            </a>
                        </li>

                        <li class="cd-schedule__event">
                            <a data-start="09:45" data-end="11:15" data-content="event-yoga-1" data-event="event-3" href="#0">
                                <em class="cd-schedule__name">English Language</em>
                            </a>
                        </li>

                        <li class="cd-schedule__event">
                            <a data-start="08:00" data-end="09:30"  data-content="event-rowing-workout" data-event="event-2" href="#0">
                                <em class="cd-schedule__name">Data Bases</em>
                            </a>
                        </li>

                        <li class="cd-schedule__event">
                            <a data-start="13:30" data-end="15:00" data-content="event-yoga-1" data-event="event-3" href="#0">
                                <em class="cd-schedule__name">Data Bases</em>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="cd-schedule__group">
                    <div class="cd-schedule__top-info"><span>Thursday</span></div>

                    <ul>
                        <li class="cd-schedule__event">
                            <a data-start="09:45" data-end="11:15" data-content="event-abs-circuit" data-event="event-1" href="#0">
                                <em class="cd-schedule__name">Circuits</em>
                            </a>
                        </li>

                        <li class="cd-schedule__event">
                            <a data-start="15:15" data-end="16:45" data-content="event-restorative-yoga" data-event="event-4" href="#0">
                                <em class="cd-schedule__name">Project</em>
                            </a>
                        </li>

                        <li class="cd-schedule__event">
                            <a data-start="15:15" data-end="16:45" data-content="event-abs-circuit" data-event="event-1" href="#0">
                                <em class="cd-schedule__name">Circuits</em>
                            </a>
                        </li>

                        <li class="cd-schedule__event">
                            <a data-start="17:00" data-end="18:30"  data-content="event-rowing-workout" data-event="event-2" href="#0">
                                <em class="cd-schedule__name">Design Patterns</em>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="cd-schedule__group">
                    <div class="cd-schedule__top-info"><span>Friday</span></div>

                    <ul>
                        <li class="cd-schedule__event">
                            <a data-start="08:00" data-end="09:30"  data-content="event-rowing-workout" data-event="event-2" href="#0">
                                <em class="cd-schedule__name">Cryptography</em>
                            </a>
                        </li>

                        <li class="cd-schedule__event">
                            <a data-start="11:30" data-end="13:00" data-content="event-abs-circuit" data-event="event-1" href="#0">
                                <em class="cd-schedule__name">Circuits</em>
                            </a>
                        </li>

                        <li class="cd-schedule__event">
                            <a data-start="15:15" data-end="16:45"  data-content="event-yoga-1" data-event="event-3" href="#0">
                                <em class="cd-schedule__name">Project</em>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="cd-schedule-modal">
            <header class="cd-schedule-modal__header">
                <div class="cd-schedule-modal__content">
                    <span class="cd-schedule-modal__date"></span>
                    <h3 class="cd-schedule-modal__name"></h3>
                </div>

                <div class="cd-schedule-modal__header-bg"></div>
            </header>

            <div class="cd-schedule-modal__body">
                <div class="cd-schedule-modal__event-info"></div>
                <div class="cd-schedule-modal__body-bg"></div>
            </div>

            <a href="#0" class="cd-schedule-modal__close text-replace">Close</a>
        </div>

        <div class="cd-schedule__cover-layer"></div>
    </div> <!-- .cd-schedule -->

    </body>

</html>



