<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload Post</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v6.0.0-beta1/css/all.css">
    <style>
        /* Import Fonts */
        @import url("https://fonts.googleapis.com/css2?family=Exo+2:wght@300;500;700&display=swap");
        /* Reset and Global Styles */
        *, *::before, *::after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            --color: rgba(34, 139, 34, 1); /* Dark Green */
            --bgColor: #E4E9F7; /* Light Gray */
            --accent-color: rgba(0, 100, 0, 1); /* Deep Green */

            min-height: 100vh;
            display: flex;
            font-family: "Exo 2", sans-serif;
            color: var(--color);
            background: var(--bgColor);
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #FFF;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            padding: 10px 14px;
            z-index: 100;
            transition: width 0.3s;
        }

        .sidebar.close {
            width: 88px;
        }

        /* Left Part */
        .left {
            width: 300px;
            padding: 20px;
            background-color: transparent;
            margin-left: 100px; /* Adjust for sidebar width */
            transition: margin-left 0.3s;
        }

        .sidebar.close + .left {
            margin-left: 88px;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 20px;
            margin-left: -100px; /* Decrease this value to move posts closer to the left section */
            background-color: var(--bgColor); /* Set to #E4E9F7 */
            transition: margin-left 0.3s;
        }

        .sidebar.close + .left + .main-content {
            margin-left: 388px;
        }

        /* EcoChamp Section Styles */
        .ecochamp-gif-card {
            position: relative;
            width: 100%;
            max-width: 400px;
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
            color: #FF636E;
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

        /* Donate Tree Card Styles */
        .donate-tree-card {
            position: relative;
            width: 100%;
            max-width: 400px;
            height: 250px;
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
            background-color: rgba(0, 0, 0, 0.5);
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

        /* Modal Styles */
        .plus-button {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #695CFE;
            color: white;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 24px;
            cursor: pointer;
            z-index: 101;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 102;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            width: 300px;
        }

        .modal-content input[type="file"],
        .modal-content textarea {
            width: 100%;
            margin-bottom: 10px;
        }

        .modal-content button {
            background-color: #695CFE;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .post {
                    background-color: #fff;
                    border-radius: 8px;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                    margin-bottom: 20px;
                    padding: 20px;
                    width: 100%;
                    max-width: 600px;
                    margin: 20px auto;
                }

                .post-header {
                    display: flex;
                    align-items: center;
                    margin-bottom: 10px;
                }

                .post-header img {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    margin-right: 10px;
                }

                .post-description {
                    margin-bottom: 10px;
                }

                .post-image {
                    width: 100%;
                    height: auto;
                    border-radius: 8px;
                    margin-bottom: 10px;
                }

                .like-button {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    width: 100%;
                    padding: 10px;
                    background-color: #E4E9F7;
                    border: none;
                    border-radius: 8px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }

                .like-button img {
                    width: 24px;
                    height: 24px;
                }

                .like-button.liked {
                    background-color: #A8D5BA; /* Light green when liked */
                }

                .like-count {
                    margin-left: 10px;
                    font-size: 14px;
                }

    </style>
</head>
<body>
    <jsp:include page="sidebar.jsp" />

    <!-- Left Part -->
    <div class="left">
        <!-- EcoChamp Section -->
        <div class="ecochamp-gif-card">
            <img src="${pageContext.request.contextPath}/images/EcoChampimages/EcoChamp.gif" alt="EcoChamp" class="ecochamp-gif">
            <a href="${pageContext.request.contextPath}/#" class="ecochamp-join-btn">Join</a>
        </div>

        <!-- Donate a Tree Section -->
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

    <!-- Main Content -->
    <div class="main-content">

        <!-- Your main content goes here -->
        <button class="plus-button" onclick="showModal()">+</button>

        <div class="modal" id="uploadModal">
            <div class="modal-content">
                <h3>Upload Post</h3>
                <form action="/upload" method="post" enctype="multipart/form-data">
                    <input type="file" name="image" accept="image/*" required>
                    <textarea name="description" placeholder="Enter description" required></textarea>
                    <button type="submit">Upload</button>
                </form>
            </div>
        </div>

        <!-- Posts Section -->
        <div class="posts">
            <c:choose>
                <c:when test="${empty posts}">
                    <p>No posts available.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="post" items="${posts}">
                        <div class="post">
                            <div class="post-header">
                                <img src="${pageContext.request.contextPath}/images/community/userprofile.png" alt="User Profile">
                                <span>${post.userName}</span>
                            </div>
                            <div class="post-description">
                                <p>${post.description}</p>
                            </div>
                            <img src="data:image/png;base64,${post.imageBase64}" alt="Post Image" class="post-image">
                            <form action="${pageContext.request.contextPath}/community" method="post">
                                <input type="hidden" name="postId" value="${post.postId}">
                                <button type="submit" class="like-button">
                                    <img src="${pageContext.request.contextPath}/images/community/communitylikebutton.png" alt="Like Button">
                                    <span class="like-count">${post.likesCount}</span>
                                </button>
                            </form>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script>
        function showModal() {
            document.getElementById('uploadModal').style.display = 'flex';
        }

        window.onclick = function(event) {
            const modal = document.getElementById('uploadModal');
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        }

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