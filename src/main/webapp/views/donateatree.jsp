<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Donate a Tree - EcoUnity</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('images/donateatree.jpg');
            background-size: cover;
            background-position: center;
            margin-left: 88px; /* Start after sidebar */
        }

        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh; /* Ensure space for the table */
            padding: 20px;
            box-sizing: border-box;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.4); /* 80% transparency */
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin: 10px;
            width: 300px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .card h2 {
            text-align: center;
            color: #333;
        }

        .card input[type="text"],
        .card input[type="file"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .donate-button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        .donate-button:hover {
            background-color: #388E3C;
        }

        .qr-card img {
            width: 150px;
            height: 150px;
            margin-bottom: 10px;
        }

        .donations-table {
            margin-top: 20px;
            width: 100%;
            text-align: left;
        }

        .donations-table th, .donations-table td {
            padding: 10px;
            color: #f7f5f5;
        }
    </style>
</head>
<body>
    <jsp:include page="sidebar.jsp" />
    <div class="content">
        <div class="card">
            <h2>Donate a Tree</h2>
            <form action="donate" method="post" enctype="multipart/form-data">
                <label for="transactionId">Transaction ID</label>
                <input type="text" id="transactionId" name="transactionId" required>

                <label for="amount">Amount</label>
                <input type="text" id="amount" name="amount" required>

                <label for="screenshot">Payment Screenshot</label>
                <input type="file" id="screenshot" name="screenshot" accept="image/*" required>

                <button type="submit" class="donate-button">Donate</button>
            </form>
        </div>

        <div class="card qr-card">
            <h2>Payment Options</h2>
            <img src="images/qr.png" alt="QR Code">
            <p>or</p>
            <p>UPI ID: 9568742301@axl</p>
        </div>
    </div>

    <c:if test="${sessionScope.user.type == 'admin' || sessionScope.user.type == 'ecochamp'}">
        <table class="donations-table">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Transaction ID</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="donation" items="${donations}">
                    <tr>
                        <td>${donation.userId}</td>
                        <td>${donation.transactionId}</td>
                        <td>${donation.amount}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</body>
</html>