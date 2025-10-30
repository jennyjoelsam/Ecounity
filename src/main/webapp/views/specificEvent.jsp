<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ecounity.ecounity.utils.Base64Utils" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>${eventType} - EcoUnity Events</title>
    <style>
        /* Global Styles */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            height: 100vh;
        }
        /* Left Side Enhancements with Larger Patterned Background */
        .left-side {
            width: 30%;
            background-color: #4CAF50; /* Base color */
            background-image: linear-gradient(45deg, #388E3C 25%, transparent 25%),
                              linear-gradient(-45deg, #388E3C 25%, transparent 25%),
                              linear-gradient(45deg, transparent 75%, #388E3C 75%),
                              linear-gradient(-45deg, transparent 75%, #388E3C 75%);
            background-size: 80px 80px; /* Adjusted size for larger squares */
            background-position: 0 0, 0 40px, 40px -40px, -40px 0px;
            color: #fff;
            padding: 40px 20px;
            box-sizing: border-box;
            position: fixed;
            height: 100vh;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .left-side-content {
            margin-left: 60px; /* Add margin to move content away from the sidebar */
        }

        .left-side h1 {
            margin-top: 0;
            margin-left: 100px;
            font-size: 36px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .left-side p {
            font-size: 18px;
            line-height: 1.6;
            margin-top: 20px;
            margin-left: 100px;
            max-width: 80%;
        }

        .left-side .cta-button {
            margin-top: 30px;
            margin-left: 115px;
            background-color: #fff;
            color: #4CAF50;
            padding: 12px 24px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s, color 0.3s;
        }

        .left-side .cta-button:hover {
            background-color: #4CAF50;
            color: #fff;
        }
        /* Right Side */
        .right-side {
            margin-left: 30%;
            width: 70%;
            height: 100vh;
            overflow-y: auto;
            padding: 20px;
            box-sizing: border-box;
        }
        .event-card {
            display: flex;
            margin-bottom: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .event-card img {
            width: 200px;
            height: 200px;
            object-fit: cover;
        }
        .event-details {
            flex: 1;
            padding: 20px;
            position: relative;
        }
        .event-details h2 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 24px;
            color: #333;
        }
        .event-details p {
            margin: 5px 0;
            color: #666;
        }
        .event-details .register-btn {
            position: absolute;
            bottom: 20px;
            right: 20px;
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
        }
        .event-details .register-btn:hover {
            background-color: #45a049;
        }
        .no-events {
            text-align: center;
            color: #666;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<jsp:include page="sidebar.jsp" />
    <div class="container">
        <!-- Left Side -->
        <div class="left-side">
            <h1>${eventType}</h1>
            <p>Explore all our ${eventType.toLowerCase()} and participate to make a difference!</p>
            <a href="#" class="cta-button">Join Us Now</a>
        </div>
        <!-- Right Side -->
        <div class="right-side">
            <c:if test="${not empty events}">
                <c:forEach var="event" items="${events}">
                   <c:if test="${event.flag != 1}">
                        <div class="event-card">
                            <c:choose>
                                <c:when test="${not empty event.logo}">
                                        <%
                                            // Retrieve 'event' from page context
                                            com.ecounity.ecounity.model.Event currentEvent = (com.ecounity.ecounity.model.Event) pageContext.getAttribute("event");
                                            String base64Logo = Base64Utils.encode(currentEvent.getLogo());
                                        %>
                                        <img src="data:image/png;base64,<%= base64Logo %>" alt="<%= currentEvent.getEventTitle() %> Logo">
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/images/default-logo.png" alt="Default Event Logo">
                                </c:otherwise>
                            </c:choose>
                            <div class="event-details">
                                <h2>${event.eventTitle}</h2>
                                <p><strong>Organization:</strong> ${event.organization}</p>
                                <p><strong>Event Type:</strong> ${event.eventType}</p>
                                <p><strong>Registration:</strong> From ${event.registrationStart} to ${event.registrationEnd}</p>
                                <a href="${pageContext.request.contextPath}/eventDescription?id=${event.id}" class="register-btn">Register</a>
                            </div>
                        </div>
                   </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${empty events}">
                <div class="no-events">
                    <p>No events found for this category.</p>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>