<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile - EcoUnity</title>
    <style>
        /* Add your CSS here */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f4f8;
            display: flex;
            background-image: url('treeimage.jpg');
            background-size: cover;
            background-position: center;
        }

        .left-side {
            width: 30%;
            background-color: rgba(76, 175, 80, 0.9);
            background-image: linear-gradient(135deg, #388E3C 25%, transparent 25%),
                              linear-gradient(225deg, #388E3C 25%, transparent 25%),
                              linear-gradient(135deg, transparent 75%, #388E3C 75%),
                              linear-gradient(225deg, transparent 75%, #388E3C 75%);
            background-size: 80px 80px;
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
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            margin-left: 88px;
        }

        .left-side h1 {
            margin-top: 0;
            font-size: 36px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .left-side p {
            font-size: 18px;
            line-height: 1.6;
            margin-top: 20px;
            max-width: 80%;
        }

        .left-side .cta-button {
            margin-top: 30px;
            background-color: #fff;
            color: #4CAF50;
            padding: 12px 24px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s, color 0.3s;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }

        .left-side .cta-button:hover {
            background-color: #388E3C;
            color: #fff;
        }

        .profile-container {
            margin-left: 35%;
            padding: 40px;
            max-width: 800px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s;
            position: relative; /* Added for positioning the EcoCreds box */
        }

        .profile-header {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .profile-details {
            margin-bottom: 20px;
            background-color: #e3f2fd;
            padding: 20px;
            border-radius: 8px;
            box-shadow: inset 0 0 10px rgba(0,0,0,0.05);
        }

        .profile-details p {
            margin: 5px 0;
            color: #333;
        }

        .event-list {
            list-style: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .event-list li {
            flex: 1 1 calc(50% - 15px);
            background-color: #ffeb3b;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.2s, background-color 0.3s;
            font-weight: bold;
            color: #333;
        }

        .event-list li:hover {
            transform: translateY(-5px);
            background-color: #fdd835;
        }

        /* EcoCreds Box Styles */
        .ecocreds-box {
            position: absolute;
            top: 20px;
            right: 5px;
            display: flex;
            align-items: center;
            background-color: #fff;
            padding: 10px 15px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(76, 175, 80, 0.3);
            z-index: 1000;
        }

        .ecocreds-box span {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin: 0 5px;
        }

        .ecocreds-box img {
            width: 30px;
            height: 30px;
        }
    </style>
</head>
<body>
    <jsp:include page="sidebar.jsp" />
    <div class="left-side">
        <h1>Welcome, ${sessionScope.user.fullName}</h1>
        <p>Your EcoCreds: ${sessionScope.user.ecoCreds}</p>
        <a href="#" class="cta-button">Edit Profile</a>
    </div>
    <div class="profile-container">
        <div class="ecocreds-box">
            <span>EcoCreds :</span>
            <img src="${pageContext.request.contextPath}/images/EcoCredsimage/EcoCreds.png" alt="EcoCreds">
            <span>${sessionScope.user.ecoCreds}</span>
        </div>
        <div class="profile-header">
            <h1>${sessionScope.user.fullName}</h1>
        </div>
        <div class="profile-details">
            <h2>Personal Information</h2>
            <p><strong>Email:</strong> ${sessionScope.user.email}</p>
            <p><strong>Phone Number:</strong> ${sessionScope.user.phoneNumber}</p>
            <p><strong>Birth Date:</strong> ${sessionScope.user.birthDate}</p>
            <p><strong>Gender:</strong> ${sessionScope.user.gender}</p>
            <p><strong>Address:</strong> ${sessionScope.user.address}, ${sessionScope.user.city}, ${sessionScope.user.region}, ${sessionScope.user.postalCode}</p>
        </div>
        <h2>Registered Events</h2>
        <ul class="event-list">
            <c:forEach var="registration" items="${registrations}">
                <li>
                    <strong>${registration.event.eventTitle}</strong>
                </li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>