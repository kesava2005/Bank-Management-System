<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Account</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,200..800;1,200..800&display=swap"
        rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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

        .nav-items #i1:hover~.animation {
            width: 70px;
            left: 18px;
        }

        .nav-items #i2:hover~.animation {
            width: 76px;
            left: 128px;
        }

        .nav-items #i3:hover~.animation {
            width: 124px;
            left: 240px;
        }

        .nav-items #i4:hover~.animation {
            width: 120px;
            left: 400px;
        }

        .nav-items #i5:hover~.animation {
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
            display: none;
        }

        .form1 input {
            border-radius: 10px;
            border: 2px solid saddlebrown;
        }

        .main-heading {
            color: rgb(204, 204, 199);
        }

        #butt {
            width: 200px;
            border: none;
            color: white;
            background-color: rgb(85, 125, 157);
            display: none;
        }

        .message {
            padding: 20px;
            margin-top: 10px;
            text-align: center;
        }

        #message1 {
            color: rgba(255, 255, 0, 0.747);

        }

        #message2 {
            color: rgb(8, 229, 8);
        }

        .blank {
            height: 70px;
        }

        .content {
            display: flex;
            justify-content: center;
            align-content: center;
        }

        .content table {
            margin-top: 50px;
            border: 2px solid rgb(208, 201, 201);
            color: rgb(204, 204, 199);
            font-size: 20px;
        }

        .content table tr,
        th,
        td {
            border: 2px solid rgb(208, 201, 201);
            padding: 30px;
        }

        .main {
            display: flex;
            gap: 30px;
            width: 40%;
            margin: auto;
        }

        .uid {
            display: none;
        }

        .rid {
            display: none;
        }

        .amount {
            display: none;
        }

        #ca {
            cursor: pointer;
        }
        label[name="luid"]{
            display: none;
        }
        label[name="lrid"]{
            display: none;
        }
        label[name="lamount"]{
            display: none;
        }
    </style>
</head>

<body>
    <div class="nav">
        <div class="nav_logo">
            <img src="bank_logo.jpeg" alt="#">
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
    <div class="main">
        <div class="main-heading">
            <h2>Select type of action</h2>
        </div>
        <div class="main-select">
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="ch-butt">
                  Actions
                </button>
                <ul class="dropdown-menu" id="ca">
                  <li><a class="dropdown-item" onclick="visible(1)">Withdraw</a></li>
                  <li><a class="dropdown-item" onclick="visible(2)">Deposit</a></li>
                  <li><a class="dropdown-item" onclick="visible(3)">Fund Request</a></li>
                </ul>
              </div>
        </div>
    </div>
    <div class="blank"></div>
    <div>
        <form action="/Withdraw" class="form1" onsubmit="return validate()" method="post">
            <label for="rid" name="lrid">Enter ReceiverID</label>
            <input type="number" name="rid" id="rid" class="rid" value="100">
            <label for="amount" name="lamount">Enter Amount</label>
            <input type="number" name="amount" id="amount" class="amount">
            <input type="submit" value="Submit" id="butt">
        </form>
    </div>
	<%
	    String Message = (String) request.getAttribute("Message");
	    if (Message != null) {
	%>
			<p class="message" id="message2"><%=Message%></p>
	<%
	        }
	%>
	<%
		Message = (String) request.getAttribute("ErrorMessage");
		if(Message!=null){
	%>
	            <p class="message" id="message1"><%=Message%></p>
	<%
	     }
	%>
    <script>
        function openLogin() {
			window.location.replace("Login.jsp");
        }

        function validate() {
            var form = document.querySelector(".form1");
            var rid = form.querySelector('input[name="rid"]').value;
            var amount = form.querySelector('input[name="amount"]').value;
            if (amount === "" || rid === ""){
                window.alert("All fields should be filled");
                return false;
            }
            return true;
        }

        function visible(num) {
            var dict = {1:'Widthdraw',2:'Deposit',3:'Fund Request'};
            var actions = {1:'/Widthdraw',2:'/Deposit',3:'/FundRequest'};
            document.getElementById("ch-butt").innerText = dict[num];
            var form = document.querySelector(".form1");
            form.setAttribute("action",actions[num]);
            var lrid = form.querySelector('label[name="lrid"]');
            var rid = form.querySelector('input[name="rid"]');
            var lamount = form.querySelector('label[name="lamount"]');
            var amount = form.querySelector('input[name="amount"]');
            var submitButton = document.querySelector("#butt");
            if(num==3){
                lrid.style.display = "block";
                rid.style.display = "block";
            }
            else{
                lrid.style.display = "none";
                rid.style.display = "none";
            }
            lamount.style.display = "block";
            amount.style.display = "block";
            submitButton.style.display = "block";
            form.style.display = "grid";
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>