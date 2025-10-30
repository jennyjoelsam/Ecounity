<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Event Uploading - EcoUnity</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            overflow: hidden;
            background-color: #f9f9f9;
        }
        .container {
            display: flex;
            width: 100%;
            height: 100vh;
        }
        /* Left Side (Slideshow and Gradient Divider) */
        .left-side {
            width: 45%;
            position: fixed;
            height: 100vh;
            overflow: hidden;
        }
        .left-side::after {
            content: '';
            position: absolute;
            top: 0;
            right: -25px;
            width: 50px;
            height: 100%;
            background: linear-gradient(to right, transparent, #fff);
            pointer-events: none;
        }
        .slideshow {
            width: 100%;
            height: 100%;
            position: relative;
        }
        .slideshow img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0;
            transition: opacity 1s ease-in-out;
        }
        .slideshow img.active {
            opacity: 1;
        }
        /* Right Side */
        .right-side {
            width: 55%;
            margin-left: 45%;
            overflow-y: auto;
            padding: 40px;
            height: 100vh;
            box-sizing: border-box;
            background-color: #fff;
            background-image: linear-gradient(to right, transparent, #f9f9f9 50%);
        }
        /* Form Styles */
        .form-group {
            margin-bottom: 25px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        .form-group label .required {
            color: red;
            margin-left: 4px;
        }
        .input {
            width: 100%;
            padding: 14px;
            box-sizing: border-box;
            border: 1px solid #4CAF50;
            border-radius: 8px;
            font-size: 16px;
        }
        .input:focus {
            border-color: #4CAF50;
            outline: none;
        }
        textarea.input {
            height: 300px;
            resize: vertical;
        }
        /* Button Styles */
        .button-90 {
            color: #fff;
            padding: 15px 25px;
            border-radius: 100px;
            background-color: #4CAF50;
            background-image: radial-gradient(93% 87% at 87% 89%, rgba(0, 0, 0, 0.15) 0%, transparent 86.18%),
                              radial-gradient(66% 87% at 26% 20%, rgba(255, 255, 255, 0.35) 0%, transparent 69.79%, transparent 100%);
            box-shadow: 2px 19px 31px rgba(0, 0, 0, 0.2);
            font-weight: bold;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        /* Card Styles */
        .card-container {
            margin: 25px 0;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
        }
        .card-container > label {
            width: 100%;
            margin-bottom: 10px;
            font-weight: bold;
            font-size: 18px;
            color: #333;
        }
        .card {
            display: flex;
            align-items: center;
            border: 1px solid #4CAF50;
            padding: 20px;
            border-radius: 8px;
            cursor: pointer;
            background-color: #fff;
            transition: background-color 0.3s, border-color 0.3s;
            flex: 1 1 calc(50% - 10px);
            box-sizing: border-box;
        }
        .card.selected {
            background-color: #4CAF50;
            border-color: #4CAF50;
        }
        .card.selected .card-title,
        .card.selected .card-description {
            color: #fff;
        }
        .svg-container {
            width: 60px;
            height: 60px;
            background-color: #e6ffe6;
            border-radius: 20%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 20px;
            transition: background-color 0.3s, border-color 0.3s;
        }
        .svg-container svg {
            width: 30px;
            height: 30px;
            fill: #4CAF50;
        }
        .card-text {
            display: flex;
            flex-direction: column;
        }
        .card-title {
            font-weight: bold;
            color: #333;
            font-size: 16px;
            margin-bottom: 5px;
        }
        .card-description {
            font-size: 14px;
            color: #666;
        }
        /* File Upload Styles */
        .file-upload-label input {
            display: none;
        }
        .file-upload-label {
            cursor: pointer;
            background-color: #e6ffe6;
            padding: 40px;
            border-radius: 20px;
            border: 2px dashed #4CAF50;
            width: 100%;
            text-align: center;
            box-sizing: border-box;
            color: #4CAF50;
            transition: background-color 0.3s, border-color 0.3s;
        }
        .file-upload-label:hover {
            background-color: #ccffcc;
            border-color: #4CAF50;
        }
        .file-upload-design {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }
        .file-upload-label svg {
            width: 50px;
            height: 50px;
            fill: #4CAF50;
        }
        .filename {
            display: block;
            margin-top: 10px;
            color: #333;
            font-weight: normal;
            font-size: 14px;
        }
        /* Organizer Styles */
        .organizer-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 25px;
        }
        .organizer-section {
            flex: 1;
            min-width: 250px;
        }
        @media (max-width: 800px) {
            .organizer-container, .card-container {
                flex-direction: column;
            }
            .button-container {
                flex-direction: column;
                align-items: stretch;
            }
            .button-90 {
                width: 100%;
                margin-bottom: 10px;
            }
        }
        .field-note {
            color: red;
            font-size: 12px;
            margin-top: 8px;
            margin-bottom: 0;
        }
    </style>
</head>
<body>
<jsp:include page="sidebar.jsp" />
    <div class="container">
        <div class="left-side">
            <!-- Slideshow Images -->
            <div class="slideshow">
                <img src="/images/eventuploadpageimages/beautyofthenature.jpg" alt="Beauty of the Nature">
                <img src="/images/eventuploadpageimages/CHARITY.jpg" alt="Charity">
                <img src="/images/eventuploadpageimages/beachcleanups.jpg" alt="Beach Cleanups">
                <img src="/images/eventuploadpageimages/forest.jpg" alt="Forest">
                <img src="/images/eventuploadpageimages/Thewondersofnature.jpg" alt="The Wonders of Nature">
                <img src="/images/eventuploadpageimages/beachcleanups2.jpg" alt="Beach Cleanups 2">
            </div>
        </div>
        <div class="right-side">
            <!-- Spring Form Tag for Event (modelAttribute="Event") -->
            <form:form id="eventForm" action="${pageContext.request.contextPath}/eventupload" modelAttribute="Event" method="post" enctype="multipart/form-data">
                <!-- First Section -->
                <div id="first-section">
                    <!-- File Upload (Logo) -->
                    <div class="form-group">
                        <label for="logo">Upload Logo<span class="required">*</span></label>
                        <label for="logo" class="file-upload-label">
                            <div class="file-upload-design">
                                <!-- SVG Icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                                    <path d="M144 480C64.5 480 0 415.5 0 336c0-62.8 40.2-116.2
                                    96.2-135.9c-.1-2.7-.2-5.4-.2-8.1c0-88.4
                                    71.6-160 160-160c59.3 0 111 32.2 138.7
                                    80.2C409.9 102 428.3 96 448 96c53 0 96
                                    43 96 96c0 12.2-2.3 23.8-6.4
                                    34.6C596 238.4 640 290.1 640
                                    352c0 70.7-57.3 128-128
                                    128H144zm79-217c-9.4 9.4-9.4
                                    24.6 0 33.9s24.6 9.4 33.9
                                    0l39-39V392c0 13.3 10.7 24
                                    24 24s24-10.7 24-24V257.9l39
                                    39c9.4 9.4 24.6 9.4 33.9
                                    0s9.4-24.6 0-33.9l-80-80c-9.4-9.4-24.6-9.4-33.9
                                    0l-80 80z"/>
                                </svg>
                                <span>Click to Upload or Drag and Drop</span>
                                <span class="filename"></span>
                            </div>
                            <form:input path="logo" id="logo" type="file" required="required" />
                        </label>
                    </div>
                    <!-- Event Type -->
                    <div class="form-group">
                        <label for="eventType">Event Type<span class="required">*</span></label>
                        <form:select path="eventType" id="eventType" cssClass="input" required="required">
                            <form:option value="" label="Select Event Type" />
                            <form:option value="Environmental Activities" label="Environmental Activities" />
                            <form:option value="Donation Events" label="Trust Events" />
                            <form:option value="Donation Events" label="Donation Events" />
                            <form:option value="Awareness Events" label="Awareness Events" />
                            <form:option value="Flood Relief Events" label="Flood Relief Events" />
                            <form:option value="Others" label="Others" />
                        </form:select>
                    </div>
                    <!-- Event Title -->
                    <div class="form-group">
                        <label for="eventTitle">Event Title<span class="required">*</span></label>
                        <form:input path="eventTitle" id="eventTitle" placeholder="Enter event title" cssClass="input" required="required" />
                        <p class="field-note">Note: Event Title should not be inappropriate</p>
                    </div>
                    <!-- Visibility Cards -->
                    <div class="card-container">
                        <label>Visibility<span class="required">*</span></label>
                        <!-- Public Visibility Card -->
                        <div class="card visibility-card" id="public-visibility-card" data-option="public">
                            <input type="radio" id="public-visibility" name="visibility" value="public" required="required" style="display:none;" />
                            <div class="svg-container">
                                <svg viewBox="0 0 20 20">
                                    <path d="M10 0C4.48 0 0 4.48 0 10C0 15.52 4.48 20 10 20C15.52 20 20 15.52 20 10C20 4.48 15.52 0 10 0ZM2 10C2 9.39 2.08 8.79 2.21 8.22L6.99 13V14C6.99 15.1 7.89 16 8.99 16V17.93C5.06 17.43 2 14.07 2 10ZM15.89 15.4C15.63 14.59 14.89 14 13.99 14H12.99V11C12.99 10.45 12.54 10 11.99 10H5.99V8H7.99C8.54 8 8.99 7.55 8.99 7V5H10.99C12.09 5 12.99 4.1 12.99 3V2.59C15.92 3.77 18 6.65 18 10C18 12.08 17.19 13.98 15.89 15.4Z"/>
                                </svg>
                            </div>
                            <div class="card-text">
                                <span class="card-title">Open Publicly</span>
                                <span class="card-description">Visible to all users</span>
                            </div>
                        </div>
                        <!-- Invite Only Visibility Card -->
                        <div class="card visibility-card" id="invite-visibility-card" data-option="invite">
                            <input type="radio" id="invite-visibility" name="visibility" value="invite" style="display:none;" />
                            <div class="svg-container">
                                <svg viewBox="0 0 19 22">
                                    <path d="M9.31682 0.166016C12.6413 0.166016 15.3163 2.78203 15.3163 6.01169V7.67281C17.1822 8.25522 18.5417 9.94433 18.5417 11.9618V17.3101C18.5417 19.8077 16.471 21.8327 13.9182 21.8327H4.74953C2.19564 21.8327 0.125 19.8077 0.125 17.3101V11.9618C0.125 9.94433 1.48561 8.25522 3.35039 7.67281V6.01169C3.3614 2.78203 6.03639 0.166016 9.31682 0.166016ZM9.32783 12.499C8.79944 12.499 8.37012 12.9188 8.37012 13.4356V15.8255C8.37012 16.353 8.79944 16.7729 9.32783 16.7729C9.86723 16.7729 10.2965 16.353 10.2965 15.8255V13.4356C10.2965 12.9188 9.86723 12.499 9.32783 12.499ZM9.33884 2.04998C7.10418 2.04998 5.28783 3.81552 5.27682 5.99016V7.43919H13.3898V6.01169C13.3898 3.82629 11.5735 2.04998 9.33884 2.04998Z"/>
                                </svg>
                            </div>
                            <div class="card-text">
                                <span class="card-title">Invite Only</span>
                                <span class="card-description">Accessible via link</span>
                            </div>
                        </div>
                    </div>
                    <!-- Organization -->
                    <div class="form-group">
                        <label for="organization">Organization Name<span class="required">*</span></label>
                        <form:input path="organization" id="organization" placeholder="Enter organization name" cssClass="input" required="required" />
                    </div>
                    <!-- Website URL -->
                    <div class="form-group">
                        <label for="website">Website URL<span class="required">*</span></label>
                        <form:input path="website" id="website" placeholder="https://example.com" cssClass="input" required="required" />
                    </div>
                    <!-- Festival (Optional) -->
                    <div class="form-group">
                        <label for="festival">Festival (Optional)</label>
                        <form:input path="festival" id="festival" placeholder="Enter festival name" cssClass="input" />
                    </div>
                    <!-- Event Mode Cards -->
                    <div class="card-container">
                        <label>Event Mode<span class="required">*</span></label>
                        <!-- Online Mode -->
                        <div class="card mode-card" id="online-mode-card" data-option="online">
                            <input type="radio" id="online-mode" name="mode" value="online" required="required" style="display:none;" />
                            <div class="svg-container">
                                <svg viewBox="0 0 20 20">
                                    <path d="M10 0C4.48 0 0 4.48 0 10C0 15.52 4.48 20 10 20C15.52 20 20 15.52 20 10C20 4.48 15.52 0 10 0ZM2 10C2 9.39 2.08 8.79 2.21 8.22L6.99 13V14C6.99 15.1 7.89 16 8.99 16V17.93C5.06 17.43 2 14.07 2 10ZM15.89 15.4C15.63 14.59 14.89 14 13.99 14H12.99V11C12.99 10.45 12.54 10 11.99 10H5.99V8H7.99C8.54 8 8.99 7.55 8.99 7V5H10.99C12.09 5 12.99 4.1 12.99 3V2.59C15.92 3.77 18 6.65 18 10C18 12.08 17.19 13.98 15.89 15.4Z"/>
                                </svg>
                            </div>
                            <div class="card-text">
                                <span class="card-title">Online Mode</span>
                            </div>
                        </div>
                        <!-- Offline Mode -->
                        <div class="card mode-card" id="offline-mode-card" data-option="offline">
                            <input type="radio" id="offline-mode" name="mode" value="offline" style="display:none;" />
                            <div class="svg-container">
                                <svg viewBox="0 0 21 21">
                                    <path d="M10.0006 6.17L5.49062 1.66C7.07062 0.61 8.96062 0 11.0006 0C16.5206 0 21.0006 4.48 21.0006 10C21.0006 12.04 20.3906 13.93 19.3406 15.51L17.8806 14.05C18.5906 12.87 19.0006 11.48 19.0006 10C19.0006 6.65 16.9306 3.78 14.0006 2.59V3C14.0006 4.1 13.1006 5 12.0006 5H10.0006V6.17ZM20.1906 19.19L18.7806 20.6L16.5106 18.33C14.9306 19.39 13.0406 20 11.0006 20C5.48062 20 1.00063 15.52 1.00063 10C1.00063 7.96 1.61063 6.07 2.66062 4.49L0.390625 2.22L1.80062 0.81L20.1906 19.19ZM10.0006 16C8.90062 16 8.00063 15.1 8.00063 14V13L3.21063 8.21C3.08063 8.79 3.00063 9.38 3.00063 10C3.00063 14.08 6.05062 17.44 10.0006 17.93V16Z"/>
                                </svg>
                            </div>
                            <div class="card-text">
                                <span class="card-title">Offline Mode</span>
                            </div>
                        </div>
                    </div>
                    <!-- Categories -->
                    <div class="form-group">
                        <label for="categories">Category<span class="required">*</span></label>
                        <form:select path="categories" id="categories" cssClass="input" required="required">
                            <form:option value="" label="Select a Category" />
                            <form:option value="Eco-friendly" label="Eco-friendly" />
                            <form:option value="Trust" label="Trust" />
                            <form:option value="Donation" label="Donation" />
                            <form:option value="Food Distribution" label="Food Distribution" />
                        </form:select>
                    </div>
                    <!-- Next Button -->
                    <div class="button-container">
                        <div></div>
                        <button type="button" id="next-button" class="button-90">Next</button>
                    </div>
                </div>
                <!-- Second Section -->
                <div id="second-section" style="display: none;">
                    <!-- About Event -->
                    <div class="form-group">
                    <label for="details">About Event<span class="required">*</span></label>
                    <form:textarea path="details" id="details" cssClass="input" required="required"
                        placeholder="This field helps you to mention the details of the opportunity you are listing.
                    It's better to include Rules, Eligibility, Process, Format, etc., to get the opportunity approved.
                    The more details, the better!

                    Guidelines:

                    - Mention all guidelines like eligibility, format, etc.
                    - Inter-college team members allowed or not.
                    - Inter-specialization team members allowed or not.
                    - The number of questions/problem statements.
                    - Duration of the rounds.

                    Rules:

                    - Mention the rules of the competition."></form:textarea>
                    </div>
                    <!-- Registration Start Date and Time -->
                    <div class="form-group">
                        <label for="registrationStart">Registration Start Date and Time<span class="required">*</span></label>
                        <form:input path="registrationStart" id="registrationStart" type="datetime-local" cssClass="input" required="required" placeholder="yyyy-mm-dd --:--" />
                    </div>
                    <!-- Registration End Date and Time -->
                    <div class="form-group">
                        <label for="registrationEnd">Registration End Date and Time<span class="required">*</span></label>
                        <form:input path="registrationEnd" id="registrationEnd" type="datetime-local" cssClass="input" required="required" placeholder="yyyy-mm-dd --:--" />
                    </div>
                    <!-- Organizer Details -->
                    <div class="organizer-container">
                        <!-- Organizer 1 -->
                        <div class="organizer-section">
                            <div class="form-group">
                                <label for="organizer1">Organizer 1 Name<span class="required">*</span></label>
                                <form:input path="organizer1" id="organizer1" placeholder="Enter organizer's name" cssClass="input" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="organizer1Email">Organizer 1 Email<span class="required">*</span></label>
                                <form:input path="organizer1Email" id="organizer1Email" type="email" placeholder="Enter organizer's email" cssClass="input" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="organizer1Contact">Organizer 1 Contact<span class="required">*</span></label>
                                <form:input path="organizer1Contact" id="organizer1Contact" type="tel" placeholder="Enter contact number" cssClass="input" required="required" />
                            </div>
                        </div>
                        <!-- Organizer 2 -->
                        <div class="organizer-section">
                            <div class="form-group">
                                <label for="organizer2">Organizer 2 Name (Optional)</label>
                                <form:input path="organizer2" id="organizer2" placeholder="Enter organizer's name" cssClass="input" />
                            </div>
                            <div class="form-group">
                                <label for="organizer2Email">Organizer 2 Email (Optional)</label>
                                <form:input path="organizer2Email" id="organizer2Email" type="email" placeholder="Enter organizer's email" cssClass="input" />
                            </div>
                            <div class="form-group">
                                <label for="organizer2Contact">Organizer 2 Contact (Optional)</label>
                                <form:input path="organizer2Contact" id="organizer2Contact" type="tel" placeholder="Enter contact number" cssClass="input" />
                            </div>
                        </div>
                    </div>
                    <!-- Number of Registrations Allowed -->
                    <div class="form-group">
                        <label for="registrationsAllowed">Number of Registrations Allowed<span class="required">*</span></label>
                        <form:input path="registrationsAllowed" id="registrationsAllowed" type="number" placeholder="Enter maximum registrations" cssClass="input" required="required" />
                    </div>
                    <!-- Back and Submit Buttons -->
                    <div class="button-container">
                        <button type="button" id="back-button" class="button-90">Back</button>
                        <button type="submit" class="button-90">Submit</button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
    <!-- JavaScript -->
    <script>
        function selectOption(optionType, option) {
            const cards = document.querySelectorAll('.' + optionType + '-card');
            cards.forEach(card => {
                card.classList.remove('selected');
            });
            const selectedCard = document.getElementById(option + '-' + optionType + '-card');
            selectedCard.classList.add('selected');
            const radioInput = document.getElementById(option + '-' + optionType);
            radioInput.checked = true;
        }

        function showSecondSection() {
            const firstSectionInputs = document.querySelectorAll('#first-section [required]');
            let allValid = true;
            firstSectionInputs.forEach(function(input) {
                if (!input.checkValidity()) {
                    allValid = false;
                    input.reportValidity();
                }
            });
            if (allValid) {
                document.getElementById('first-section').style.display = 'none';
                document.getElementById('second-section').style.display = 'block';
            }
        }

        function showFirstSection() {
            document.getElementById('second-section').style.display = 'none';
            document.getElementById('first-section').style.display = 'block';
        }

        window.onload = function() {
            const visibilityCards = document.querySelectorAll('.visibility-card');
            visibilityCards.forEach(card => {
                card.addEventListener('click', function() {
                    selectOption('visibility', this.dataset.option);
                });
            });
            const modeCards = document.querySelectorAll('.mode-card');
            modeCards.forEach(card => {
                card.addEventListener('click', function() {
                    selectOption('mode', this.dataset.option);
                });
            });
            document.getElementById('next-button').addEventListener('click', function(e) {
                e.preventDefault();
                showSecondSection();
            });
            document.getElementById('back-button').addEventListener('click', function(e) {
                e.preventDefault();
                showFirstSection();
            });
            document.getElementById('logo').addEventListener('change', function() {
                const fileName = this.files[0]?.name || '';
                const fileNameElem = document.querySelector('.file-upload-design .filename');
                fileNameElem.textContent = fileName ? fileName : '';
            });
            let slideIndex = 0;
            const slides = document.querySelectorAll('.slideshow img');
            const totalSlides = slides.length;
            function showSlide(index) {
                slides.forEach((slide, i) => {
                    slide.classList.remove('active');
                    if (i === index) {
                        slide.classList.add('active');
                    }
                });
            }
            function nextSlide() {
                slideIndex = (slideIndex + 1) % totalSlides;
                showSlide(slideIndex);
            }
            showSlide(slideIndex);
            setInterval(nextSlide, 3000);
        };
    </script>
</body>
</html>