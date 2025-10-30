<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <style>
        /* Import Google font - Poppins */
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            padding: 20px;
            background: url('/images/loginandsignupimages/EcoUnitySignupimage.png') no-repeat center center fixed;
            background-size: cover;
        }

        .notification {
            position: fixed;
            top: 20px;
            right: -300px; /* Start off-screen */
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: right 0.5s ease-in-out;
            z-index: 1000;
        }
        .notification.show {
            right: 20px; /* Slide into view */
        }


        .container {
            position: relative;
            max-width: 600px;
            width: 100%;
            background: rgba(255, 255, 255, 0); /* Transparent background */
            padding: 15px; /* Reduced padding */
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .container header {
            font-size: 1.5rem;
            color: #333;
            font-weight: 500;
            text-align: center;
        }

        .container .form {
            margin-top: 15px; /* Reduced margin */
        }

        .form .input-box {
            width: 100%;
            margin-top: 10px; /* Reduced margin */
        }

        .input-box label {
            color: #333;
        }

        .form :where(.input-box input, .select-box) {
            position: relative;
            height: 30px; /* Reduced height */
            width: 100%;
            outline: none;
            font-size: 0.9rem; /* Slightly smaller font */
            color: #555;
            margin-top: 5px; /* Reduced margin */
            border: 1px solid #ccc;
            border-radius: 6px;
            padding: 0 10px; /* Reduced padding */
            background: rgba(255, 255, 255, 0.9); /* Slightly transparent */
        }

        .input-box input:focus {
            box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
        }

        .form .column {
            display: flex;
            column-gap: 10px;
        }

        .form .gender-box {
            margin-top: 10px; /* Reduced margin */
        }

        .gender-box h3 {
            color: #333;
            font-size: 1rem;
            font-weight: 400;
            margin-bottom: 5px; /* Reduced margin */
        }

        .form :where(.gender-option, .gender) {
            display: flex;
            align-items: center;
            column-gap: 20px; /* Reduced gap */
            flex-wrap: wrap;
        }

        .form .gender {
            column-gap: 5px;
        }

        .gender input {
            accent-color: #FFA500; /* Sunset-like color */
        }

        .form :where(.gender input, .gender label) {
            cursor: pointer;
        }

        .gender label {
            color: #555;
        }

        .address :where(input, .select-box) {
            margin-top: 5px; /* Reduced margin */
        }

        .select-box select {
            height: 100%;
            width: 100%;
            outline: none;
            border: none;
            color: #555;
            font-size: 0.9rem; /* Slightly smaller font */
            background: rgba(255, 255, 255, 0.9); /* Slightly transparent */
        }

        .form button {
            height: 40px; /* Reduced height */
            width: 100%;
            color: #fff;
            font-size: 1rem;
            font-weight: 400;
            margin-top: 15px; /* Reduced margin */
            border: none;
            cursor: pointer;
            transition: all 0.2s ease;
            background: #FFA500; /* Sunset-like color */
        }

        .form button:hover {
            background: #FF8C00; /* Darker sunset color */
        }

        /*Responsive*/
        @media screen and (max-width: 500px) {
            .form .column {
                flex-wrap: wrap;
            }
            .form :where(.gender-option, .gender) {
                row-gap: 10px; /* Reduced gap */
            }
        }
    </style>
</head>
<body>
    <c:if test="${not empty error}">
        <div class="notification">
            <span>${error}</span>
        </div>
    </c:if>
    <section class="container">
        <header>Registration Form</header>
        <form action="signup" class="form" method="post">
            <div class="input-box">
                <label>Full Name</label>
                <input type="text" name="fullName" placeholder="Enter full name" required />
            </div>
            <div class="input-box">
                <label>Email Address</label>
                <input type="email" name="email" placeholder="Enter email address" required />
                <c:if test="${not empty error}">
                    <div class="error">${error}</div>
                </c:if>
            </div>
            <div class="column">
                <div class="input-box">
                    <label>Phone Number</label>
                    <input type="text" name="phoneNumber" placeholder="Enter phone number" required />
                </div>
                <div class="input-box">
                    <label>Birth Date</label>
                    <input type="date" name="birthDate" required />
                </div>
            </div>
            <div class="gender-box">
                <h3>Gender</h3>
                <div class="gender-option">
                    <div class="gender">
                        <input type="radio" id="check-male" name="gender" value="Male" checked />
                        <label for="check-male">Male</label>
                    </div>
                    <div class="gender">
                        <input type="radio" id="check-female" name="gender" value="Female" />
                        <label for="check-female">Female</label>
                    </div>
                    <div class="gender">
                        <input type="radio" id="check-other" name="gender" value="Prefer not to say" />
                        <label for="check-other">Prefer not to say</label>
                    </div>
                </div>
            </div>
            <div class="input-box address">
                <label>Address</label>
                <input type="text" name="address" placeholder="Enter street address" required />
                <div class="column">
                    <div class="select-box">
                        <select name="country" required>
                            <option hidden>Country</option>
                            <option>America</option>
                            <option>Japan</option>
                            <option>India</option>
                            <option>Nepal</option>
                        </select>
                    </div>
                    <div class="input-box">
                        <input type="text" name="city" placeholder="Enter your city" required />
                    </div>
                </div>
                <div class="column">
                    <input type="text" name="region" placeholder="Enter your region" required />
                    <input type="text" name="postalCode" placeholder="Enter postal code" required />
                </div>
            </div>
            <div class="column">
                <div class="input-box">
                    <label>Password</label>
                    <input type="password" name="password" id="password" placeholder="Enter password" required />
                </div>
                <div class="input-box">
                    <label>Confirm Password</label>
                    <input type="password" id="confirm-password" placeholder="Confirm password" required />
                </div>
            </div>
            <button type="submit">Submit</button>
        </form>
    </section>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const notification = document.querySelector('.notification');
            if (notification) {
                setTimeout(() => {
                    notification.classList.add('show');
                }, 100); // Delay to allow CSS transition
                setTimeout(() => {
                    notification.classList.remove('show');
                }, 5000); // Hide after 5 seconds
            }
        });
    </script>


</body>
</html>