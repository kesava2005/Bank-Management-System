<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Details</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,200..800;1,200..800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            font-family: "karla";
            background-color: rgb(45, 45, 45);
        }
        .nav {
            height: 85px;
            display: flex;
            gap: 250px;
            background-color: rgb(40, 38, 38);
            margin-bottom: 70px;
        }
        .nav_logo {
            display: flex;
            gap: 30px;
            justify-content: center;
            align-items: center;
        }
        .nav_logo span {
            color: aliceblue;
            font-size: 30px;
            cursor: pointer;
        }
        .nav img {
            width: 80px;
            height: 80px;
            margin-left: 100px;
            border-radius: 90px;
        }
        .nav-items {
            width: 850px;
            display: flex;
            align-items: center;
            padding: 20px;
            gap: 50px;
            position: relative;
        }
        .nav-items a {
            list-style: none;
            text-decoration: none;
            font-size: 23px;
            color: rgb(221, 215, 215);
            z-index: 1;
        }
        .animation {
            position: absolute;
            left: 18px;
            width: 70px;
            height: 2px;
            bottom: 23px;
            background-color: rgb(177, 53, 53);
            border-radius: 8px;
            transition: all .8s ease 0s;
        }
        .nav-items #i1:hover ~ .animation {
            width: 70px;
            left: 18px;
        }
        .nav-items #i2:hover ~ .animation {
            width: 76px;
            left: 128px;
        }
        .nav-items #i3:hover ~ .animation {
            width: 124px;
            left: 240px;
        }
        .nav-items #i4:hover ~ .animation {
            width: 120px;
            left: 400px;
        }
        .nav-items #i5:hover ~ .animation {
            width: 79px;
            left: 664px;
        }
        .b-log-out button {
            width: 100px;
            height: 50px;
            background-color: rgb(85, 125, 157);
            color: white;
            font-size: 20px;
            font-weight: 600;
            border: none;
            border-radius: 10px;
            margin-left: 150px;
        }
        .b-log-out button:hover {
            background-color: rgb(70, 103, 130);
        }
        .form1 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            width: 50%;
            margin: auto;
            padding: 30px;
            grid-gap: 30px;
            font-size: 20px;
            font-weight: 700;
            color: white;
            background-color: rgb(93, 92, 90);
        }
        .form1 input {
            border-radius: 10px;
            border: 2px solid saddlebrown;
        }
        .create-heading {
            text-align: center;
            margin-bottom: 30px;
            color: rgb(204, 204, 199);
        }
        #butt {
            width: 200px;
            border: none;
            color: white;
            background-color: rgb(85, 125, 157);
        }
		.message{
		    padding: 20px;
		    margin-top: 10px;
		    text-align: center;
		}
		#message1{
		    color: rgba(255, 255, 0, 0.747);

		}
		#message2{
		    color: rgb(8, 229, 8);
		}
		.content{
		    display: flex;
		    justify-content: center;
		    align-content: center;
		}
		.content table{
		    margin-top: 50px;
		    border: 2px solid rgb(208, 201, 201);
		    color: rgb(204, 204, 199);
		    font-size: 20px;
		}
		.content table tr,th,td{
		    border: 2px solid rgb(208,201,201);
		    padding: 30px;
		}
    </style>
</head>
<body>
    <div class="nav">
        <div class="nav_logo">
            <img src="bank_logo.jpeg" alt="Bank Logo">
            <span>ABC Bank</span>
        </div>
        <div class="nav-items">
            <a href="User.jsp" id="i1">Home</a>
            <a href="#" id="i2">About</a>
            <a href="#" id="i3">Contact us</a>
            <a href="#" id="i4">FeedBack</a>
            <div class="animation"></div>
            <div class="b-log-out">
                <button onclick="openLogin()">Log-Out</button>
            </div>
        </div>
    </div>
    <div class="create-heading">
        <h2>The account details are:</h2>
    </div>
    <div>
        <form action="/Display" method="post" class="form1">
            <input type="submit" value="Display" id="butt">
        </form>
    </div>
    <div class="content">
		<%
				    String Message = (String) request.getAttribute("Message");
				    if (Message != null) {
				        if (Message.equals("content")) {
				            long id = (Long) request.getAttribute("id");
				            String name = (String) request.getAttribute("name"); 
				            long mobilenum = (Long) request.getAttribute("mobilenum");
				            String address = (String) request.getAttribute("address");
				            double balance = (Double) request.getAttribute("balance");
				%>
				            <div class="content">
				                <table>
				                    <tr>
				                        <th>User ID</th>
				                        <th>User Name</th>
				                        <th>Mobile Number</th>
				                        <th>Address</th>
				                        <th>Balance</th>
				                    </tr>
				                    <tr>
				                        <td><%= id %></td>
				                        <td><%= name %></td>
				                        <td><%= mobilenum %></td>
				                        <td><%= address %></td>
				                        <td><%= balance %></td>
				                    </tr>
				                </table>
				            </div>
				<%
				        } else if (Message.equals("error")) {
				%>
				            <p class="message" id="message1">There is no such account with given details</p>
				<%
				        }
				    }
				%>

    </div>
    <script>
        function openLogin() {
			window.location.replace("Login.jsp");
        }
    </script>
</body>
</html>
