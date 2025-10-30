<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ecounity.ecounity.utils.Base64Utils" %>
<!DOCTYPE html>
<html>
<head>
    <title>Events Page</title>
    <!-- Link to the external CSS file -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/events.css">
    <!-- Import Font Awesome (if needed for icons) -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v6.0.0-beta1/css/all.css">
    <style>
    /* Import Fonts */
@import url("https://pro.fontawesome.com/releases/v6.0.0-beta1/css/all.css");
@import url("https://fonts.googleapis.com/css2?family=Exo+2:wght@300;500;700&display=swap");
    /* Reset and Global Styles */
    *, *::before, *::after {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
      --color: rgba(34, 139, 34, 1); /* Dark Green */
      --bgColor: rgba(245, 245, 245, 1); /* Light Gray */
      --accent-color: rgba(0, 100, 0, 1); /* Deep Green */

      min-height: 100vh;
      display: grid;
      align-content: center;
      gap: 2rem;
      padding: 2rem;
      font-family: "Exo 2", sans-serif;
      color: var(--color);
      background: var(--bgColor);
    }

    /* Left Part */
    .left {
        width: 30%;
        height: 100vh;
        position: fixed;
        top: 0;
        left: 0;
        overflow: auto;
        padding: 20px;
        background-color: transparent; /* Remove the green background */
    }

    /* Right Part */
    .right {
        position: relative;
        margin-left: 30%;
        width: 70%;
        padding: 20px;
        background-color: #fff;
    }

    /* EcoCreds Box Styles */
    .ecocreds-box {
        position: absolute;
        top: 20px;
        right: 20px;
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

    /* Image Grid Styles */
    .image-grid {
        margin-top: 80px;
    }

    .grid-row {
        display: flex;
        justify-content: space-evenly;
        margin-bottom: 20px;
    }

    .grid-item {
        position: relative;
        width: 43%;
        overflow: hidden;
        border-radius: 8px;
        cursor: pointer;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .grid-item img {
        width: 100%;
        height: auto;
        display: block;
    }

    .grid-item .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.6);
        color: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
        padding: 20px;
        box-sizing: border-box;
    }

    .grid-item .overlay-content {
        max-width: 90%;
    }

    .grid-item .overlay h3 {
        margin-bottom: 10px;
        font-size: 20px;
    }

    .grid-item .overlay p {
        font-size: 14px;
        line-height: 1.5;
    }

    .grid-item:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }

    .grid-item:hover .overlay {
        background: rgba(0, 0, 0, 0.8);
    }

    /* EcoChamp Section Styles */
    .ecochamp-gif-card {
        position: relative;
        width: 100%;
        max-width: 400px; /* Adjust as needed */
        margin-bottom: 20px;
        overflow: hidden;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .ecochamp-gif {
        width: 100%;
        height: auto;
        display: block;
    }

    .ecochamp-join-btn {
        display: inline-block;
        background-color: #fff;
        color: #FF636E; /* Accent color */
        border: 2px solid #FF636E;
        padding: 8px 20px;
        font-size: 0.9em;
        border-radius: 8px;
        cursor: pointer;
        text-decoration: none;
        transition: background-color 0.3s, color 0.3s;
        position: absolute;
        bottom: 10px;
        left: 50%;
        transform: translateX(-50%);
    }

    .ecochamp-join-btn:hover {
        background-color: #FF636E;
        color: #fff;
    }
    /* Events Section Styles */
    .events-section {
        margin-top: 60px;
        text-align: center;
    }

    .events-section:not(:first-of-type) {
        margin-top: 80px;
    }

    .events-section .section-heading {
        font-size: 28px;
        color: #333;
        margin-bottom: 40px;
    }

    .events-section .section-heading a {
        color: #333;
        text-decoration: none;
        transition: color 0.3s;
    }

    .events-section .section-heading a:hover {
        color: #4CAF50;
    }

    /* Event Cards Styles */
h1 { text-align: center; }

ol.event-cards {
  width: min(60rem, 90%);
  margin-inline: auto;
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  gap: 2rem;
  list-style: none;
  counter-reset: stepnr;
  padding: 0;
}




    ol.event-cards li {
      counter-increment: stepnr;
      width: 18rem;
      --borderS: 2rem;
      aspect-ratio: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding-left: calc(var(--borderS) + 2rem);
      position: relative;
    }

    ol.event-cards li::before,
    ol.event-cards li::after {
      inset: 0;
      position: absolute;
      border-radius: 50%;
      border: var(--borderS) solid var(--bgColor);
      line-height: 1.1;
    }

    ol.event-cards li::before {
      content: counter(stepnr);
      color: var(--accent-color);
      padding-left: 10rem;
      font-size: 12rem;
      font-weight: 700;
      overflow: hidden;
    }

    ol.event-cards li::after {
      content: "";
      filter: drop-shadow(-0.25rem 0.25rem 0.2rem rgba(0, 255, 0, 0.9)) blur(8px);
    }

    ol.event-cards li > * {
      width: 7.5rem;
    }

    ol.event-cards li .icon {
      font-size: 2rem;
      color: var(--accent-color);
      text-align: center;
    }

    ol.event-cards li .icon img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    ol.event-cards li .title {
      font-size: 2rem;
      font-weight: 500;
    }


ol.event-cards li .descr {
  font-size: 0.8rem;
  font-weight: 300;
}



    .credits {
      margin-top: 2rem;
      text-align: right;
    }

    .credits a {
      color: var(--color);
    }


    /* Adjustments for Smaller Size */
    @media (max-width: 768px) {
      ol.event-cards li {
        width: 12rem; /* Further reduce size on smaller screens */
        --borderS: 1.2rem;
      }

      ol.event-cards li .title {
        font-size: 0.9rem;
      }

      ol.event-cards li .descr {
        font-size: 0.7rem;
      }
    }

    .donate-tree-card {
        position: relative;
        width: 100%;
        max-width: 400px; /* Increased width */
        height: 250px; /* Increased height */
        margin-top: 20px;
        overflow: hidden;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .donate-tree-images {
        position: absolute;
        width: 100%;
        height: 100%;
    }

    .tree-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        position: absolute;
        opacity: 0;
        transition: opacity 1s ease-in-out;
    }

    .donate-tree-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Transparent black overlay */
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        color: #fff;
        text-align: center;
        padding: 20px;
        box-sizing: border-box;
    }

    .donate-tree-overlay h2 {
        font-size: 1.5em;
        margin-bottom: 10px;
    }

    .donate-btn {
        display: inline-block;
        background-color: #fff;
        color: #4CAF50;
        border: 2px solid #4CAF50;
        padding: 8px 20px;
        font-size: 0.9em;
        border-radius: 8px;
        cursor: pointer;
        text-decoration: none;
        transition: background-color 0.3s, color 0.3s;
    }

    .donate-btn:hover {
        background-color: #4CAF50;
        color: #fff;
    }

    </style>
</head>
<body>
    <jsp:include page="sidebar.jsp" />
    <!-- Left Part -->
    <div class="left">
        <!-- Content for the left part goes here -->
        <!-- You can add navigation links or any other content if desired -->
        <!-- EcoChamp Section -->
        <div class="ecochamp-gif-card">
            <img src="${pageContext.request.contextPath}/images/EcoChampimages/EcoChamp.gif" alt="EcoChamp" class="ecochamp-gif">
            <a href="${pageContext.request.contextPath}/#" class="ecochamp-join-btn">Join</a>
        </div>

        <div class="donate-tree-card">
            <div class="donate-tree-images">
                <img src="${pageContext.request.contextPath}/images/DonateATreeimages/tree1.jpg" alt="Tree 1" class="tree-image">
                <img src="${pageContext.request.contextPath}/images/DonateATreeimages/tree2.jpg" alt="Tree 2" class="tree-image">
                <img src="${pageContext.request.contextPath}/images/DonateATreeimages/tree3.jpg" alt="Tree 3" class="tree-image">
            </div>
            <div class="donate-tree-overlay">
                <h2>Donate a Tree</h2>
                <a href="${pageContext.request.contextPath}/donate" class="donate-btn">Donate</a>
            </div>
        </div>
    </div>

    <!-- Right Part -->
    <div class="right">
        <!-- EcoCreds Box -->
        <div class="ecocreds-box">
            <span>EcoCreds :</span>
            <img src="${pageContext.request.contextPath}/images/EcoCredsimage/EcoCreds.png" alt="EcoCreds">
            <span>${sessionScope.user.ecoCreds}</span>
        </div>

        <!-- Image Grid -->
        <div class="image-grid">
            <!-- First Row -->
            <div class="grid-row">
                <!-- Environmental Events Banner -->
                <div class="grid-item" onclick="location.href='${pageContext.request.contextPath}/events?type=Environmental Activities'">
                    <img src="${pageContext.request.contextPath}/images/eventspagebanners/Environmental.jpg" alt="Environmental Events">
                    <div class="overlay">
                        <div class="overlay-content">
                            <h3>Environmental Events</h3>
                            <p>Join us for beach, river, and pond restoration projects. Let's preserve nature together.</p>
                        </div>
                    </div>
                </div>

                <!-- Flood Relief Events Banner -->
                <div class="grid-item" onclick="location.href='${pageContext.request.contextPath}/events?type=Flood Relief Events'">
                    <img src="${pageContext.request.contextPath}/images/eventspagebanners/FloodRelief.jpg" alt="Flood Relief Events">
                    <div class="overlay">
                        <div class="overlay-content">
                            <h3>Flood Relief Events</h3>
                            <p>Be a helping hand in flood relief efforts. Support communities in need.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Second Row -->
            <div class="grid-row">
                <!-- Donation Events Banner -->
                <div class="grid-item" onclick="location.href='${pageContext.request.contextPath}/events?type=Donation Events'">
                    <img src="${pageContext.request.contextPath}/images/eventspagebanners/FoodDonation.jpg" alt="Donation Events">
                    <div class="overlay">
                        <div class="overlay-content">
                            <h3>Donation Events</h3>
                            <p>Contribute to food distribution and support the less privileged.</p>
                        </div>
                    </div>
                </div>

                <!-- Awareness Events Banner -->
                <div class="grid-item" onclick="location.href='${pageContext.request.contextPath}/events?type=Awareness Events'">
                    <img src="${pageContext.request.contextPath}/images/eventspagebanners/PlasticAwareness.jpg" alt="Awareness Events">
                    <div class="overlay">
                        <div class="overlay-content">
                            <h3>Awareness Events</h3>
                            <p>Participate in sessions on plastic pollution and environmental conservation.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Environmental Events Section -->
        <div class="events-section">
            <h2 class="section-heading">
                <a href="${pageContext.request.contextPath}/events?type=Environmental Activities">Environmental Events</a>
            </h2>

            <!-- Check if there are environmental events -->
            <c:if test="${empty environmentalEvents}">
                <p>No Environmental Events available at the moment.</p>
            </c:if>

            <!-- Event Cards -->
            <ol class="event-cards">
                <c:set var="count" value="0"/>
                <c:forEach var="event" items="${environmentalEvents}">
                    <c:if test="${count lt 4}">
                        <li onclick="location.href='${pageContext.request.contextPath}/eventDescription?id=${event.id}'">
                            <div class="icon">
                                <c:choose>
                                    <c:when test="${not empty eventLogoMap[event.id]}">
                                        <img src="data:image/png;base64,${eventLogoMap[event.id]}" alt="${event.eventTitle}">
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fa-solid fa-bicycle"></i> <!-- Default icon if no image -->
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="title">${event.eventTitle}</div>
                            <div class="descr">${event.organization}</div>
                        </li>
                        <!-- Increment the count -->
                        <c:set var="count" value="${count + 1}"/>
                    </c:if>
                </c:forEach>
            </ol>
        </div>

        <!-- Flood Relief Events Section -->
        <div class="events-section">
            <h2 class="section-heading">
                <a href="${pageContext.request.contextPath}/events?type=Flood Relief Events">Flood Relief Events</a>
            </h2>

            <!-- Check if there are flood relief events -->
            <c:if test="${empty floodReliefEvents}">
                <p>No Flood Relief Events available at the moment.</p>
            </c:if>

            <!-- Event Cards -->
            <ol class="event-cards">
                <c:set var="count" value="0"/>
                <c:forEach var="event" items="${floodReliefEvents}">
                    <c:if test="${count lt 4}">
                        <li onclick="location.href='${pageContext.request.contextPath}/eventDescription?id=${event.id}'">
                            <div class="icon">
                                <c:choose>
                                    <c:when test="${not empty eventLogoMap[event.id]}">
                                        <img src="data:image/png;base64,${eventLogoMap[event.id]}" alt="${event.eventTitle}">
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fa-solid fa-bicycle"></i> <!-- Default icon if no image -->
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="title">${event.eventTitle}</div>
                            <div class="descr">${event.organization}</div>
                        </li>
                        <!-- Increment the count -->
                        <c:set var="count" value="${count + 1}"/>
                    </c:if>
                </c:forEach>
            </ol>
        </div>

        <!-- Donation Events Section -->
        <div class="events-section">
            <h2 class="section-heading">
                <a href="${pageContext.request.contextPath}/events?type=Donation Events">Donation Events</a>
            </h2>

            <!-- Check if there are donation events -->
            <c:if test="${empty donationEvents}">
                <p>No Donation Events available at the moment.</p>
            </c:if>

            <!-- Event Cards -->
            <ol class="event-cards">
                <c:set var="count" value="0"/>
                <c:forEach var="event" items="${donationEvents}">
                    <c:if test="${count lt 4}">
                        <li onclick="location.href='${pageContext.request.contextPath}/eventDescription?id=${event.id}'">
                            <div class="icon">
                                <c:choose>
                                    <c:when test="${not empty eventLogoMap[event.id]}">
                                        <img src="data:image/png;base64,${eventLogoMap[event.id]}" alt="${event.eventTitle}">
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fa-solid fa-bicycle"></i> <!-- Default icon if no image -->
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="title">${event.eventTitle}</div>
                            <div class="descr">${event.organization}</div>
                        </li>
                        <!-- Increment the count -->
                        <c:set var="count" value="${count + 1}"/>
                    </c:if>
                </c:forEach>
            </ol>
        </div>

        <!-- Awareness Events Section -->
        <div class="events-section">
            <h2 class="section-heading">
                <a href="${pageContext.request.contextPath}/events?type=Awareness Events">Awareness Events</a>
            </h2>

            <!-- Check if there are awareness events -->
            <c:if test="${empty awarenessEvents}">
                <p>No Awareness Events available at the moment.</p>
            </c:if>

            <!-- Event Cards -->
            <ol class="event-cards">
                <c:set var="count" value="0"/>
                <c:forEach var="event" items="${awarenessEvents}">
                    <c:if test="${count lt 4}">
                        <li onclick="location.href='${pageContext.request.contextPath}/eventDescription?id=${event.id}'">
                            <div class="icon">
                                <c:choose>
                                    <c:when test="${not empty eventLogoMap[event.id]}">
                                        <img src="data:image/png;base64,${eventLogoMap[event.id]}" alt="${event.eventTitle}">
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fa-solid fa-bicycle"></i> <!-- Default icon if no image -->
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="title">${event.eventTitle}</div>
                            <div class="descr">${event.organization}</div>
                        </li>
                        <!-- Increment the count -->
                        <c:set var="count" value="${count + 1}"/>
                    </c:if>
                </c:forEach>
            </ol>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const images = document.querySelectorAll('.tree-image');
            let currentIndex = 0;

            // Initially show the first image
            images[currentIndex].style.opacity = 1;

            function showNextImage() {
                images[currentIndex].style.opacity = 0; // Hide current image
                currentIndex = (currentIndex + 1) % images.length; // Move to next image
                images[currentIndex].style.opacity = 1; // Show next image
            }

            setInterval(showNextImage, 4000); // Change image every 4 seconds
        });
    </script>
</body>
</html>