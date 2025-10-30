<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ecounity.ecounity.utils.Base64Utils" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>${event.eventTitle} - EcoUnity</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
        }
        .event-container {
            max-width: 800px;
            margin: auto;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            padding: 20px;
        }
        .event-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .event-header img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-right: 20px;
            border-radius: 8px;
        }
        .event-header h1 {
            margin: 0;
            font-size: 32px;
        }
        .event-details p {
            margin: 10px 0;
            color: #333;
        }
        .register-button {
            display: block;
            text-align: center;
            margin-top: 30px;
            background-color: #4CAF50;
            color: #fff;
            padding: 15px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            font-size: 18px;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .register-button:hover {
            background-color: #45a049;
        }
        .user-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .user-table th, .user-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .user-table th {
            background-color: #f2f2f2;
            color: #333;
        }
        .notification {
            position: fixed;
            top: 20px;
            right: -300px; /* Start off-screen */
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: right 0.5s ease-in-out;
            z-index: 1000;
        }
        .notification.show {
            right: 20px; /* Slide into view */
        }
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            width: 400px;
            text-align: center;
        }
        .popup h3 {
            margin-bottom: 20px;
        }
        .popup p {
            margin: 10px 0;
            font-size: 16px;
            color: #555;
        }
        .popup button {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 12px 24px;
            margin-top: 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 16px;
        }
        .popup button:hover {
            background-color: #45a049;
        }
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 500;
        }
    </style>
</head>
<body>
<jsp:include page="sidebar.jsp" />
    <c:if test="${not empty successMessage}">
        <div class="notification">${successMessage}</div>
    </c:if>

    <div class="event-container">
        <div class="event-header">
            <c:choose>
                <c:when test="${not empty base64Logo}">
                    <img src="data:image/png;base64,${base64Logo}" alt="${event.eventTitle} Logo">
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/images/default-logo.png" alt="Default Event Logo">
                </c:otherwise>
            </c:choose>
            <h1>${event.eventTitle}</h1>
        </div>
        <div class="event-details">
            <p><strong>Organization:</strong> ${event.organization}</p>
            <p><strong>Event Type:</strong> ${event.eventType}</p>
            <p><strong>Festival:</strong> ${event.festival}</p>
            <p><strong>Event Mode:</strong> ${event.mode}</p>
            <p><strong>Category:</strong> ${event.categories}</p>
            <p><strong>Website:</strong> <a href="${event.website}" target="_blank">${event.website}</a></p>
            <p><strong>Registration Start:</strong> ${event.registrationStart}</p>
            <p><strong>Registration End:</strong> ${event.registrationEnd}</p>
            <p><strong>Details:</strong></p>
            <p>${event.details}</p>
            <p><strong>Organizer 1:</strong> ${event.organizer1} (${event.organizer1Email}, ${event.organizer1Contact})</p>
            <c:if test="${not empty event.organizer2}">
                <p><strong>Organizer 2:</strong> ${event.organizer2} (${event.organizer2Email}, ${event.organizer2Contact})</p>
            </c:if>
        </div>
        <c:choose>
            <c:when test="${registered}">
                <button disabled class="register-button">Registered</button>
            </c:when>
            <c:otherwise>
                <button id="registerButton" class="register-button">Register Now</button>
            </c:otherwise>
        </c:choose>

        <!-- User Type-Based Content -->
        <!-- User Type-Based Content -->
        <c:choose>
            <c:when test="${sessionScope.user.type == 'ecochamp' || sessionScope.user.type == 'admin'}">
                <div class="user-section">
                    <h2>Registered Users</h2>
                    <form action="${pageContext.request.contextPath}/assignEcoCreds" method="post">
                        <input type="hidden" name="eventId" value="${event.id}">
                        <table class="user-table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Participated</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="registration" items="${registrations}">
                                    <tr>
                                        <td>${registration.userName}</td>
                                        <td>${registration.userEmail}</td>
                                        <td>
                                            <input type="checkbox" name="participatedUsers" value="${registration.user.id}">
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <button type="submit" class="register-button">Assign EcoCreds</button>
                    </form>
                </div>
            </c:when>
        </c:choose>
    </div>

    <!-- Registration Popup -->
    <div class="overlay" id="overlay"></div>
    <div class="popup" id="registrationPopup">
        <h3>Confirm Your Details</h3>
        <p><strong>Name:</strong> ${sessionScope.user.fullName}</p>
        <p><strong>Email:</strong> ${sessionScope.user.email}</p>
        <p><strong>Phone Number:</strong> ${sessionScope.user.phoneNumber}</p>
        <p><strong>Address:</strong> ${sessionScope.user.address}, ${sessionScope.user.city}, ${sessionScope.user.region}, ${sessionScope.user.postalCode}</p>
        <form action="${pageContext.request.contextPath}/register" method="post">
            <input type="hidden" name="eventId" value="${event.id}" />
            <input type="hidden" name="userId" value="${sessionScope.user.id}" />
            <input type="hidden" name="userName" value="${sessionScope.user.fullName}" />
            <input type="hidden" name="userEmail" value="${sessionScope.user.email}" />
            <button type="submit">Confirm Registration</button>
            <button type="button" id="cancelRegistration">Cancel</button>
        </form>
    </div>

    <script>
        document.getElementById('registerButton').addEventListener('click', function() {
            document.getElementById('overlay').style.display = 'block';
            document.getElementById('registrationPopup').style.display = 'block';
        });

        document.getElementById('cancelRegistration').addEventListener('click', function() {
            document.getElementById('overlay').style.display = 'none';
            document.getElementById('registrationPopup').style.display = 'none';
        });

        // Show notification if successMessage is present
        window.onload = function() {
            const notification = document.querySelector('.notification');
            if (notification) {
                setTimeout(() => {
                    notification.classList.add('show');
                }, 100); // Delay to allow CSS transition
                setTimeout(() => {
                    notification.classList.remove('show');
                }, 5000); // Hide after 5 seconds
            }
        };
    </script>
</body>
</html>