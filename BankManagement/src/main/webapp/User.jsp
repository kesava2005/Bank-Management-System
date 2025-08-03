<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Bank</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,200..800;1,200..800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body{
            font-family: "karla";
        }
        .nav{
            height: 85px;
            display: flex;
            gap:250px;
            background-color: rgb(40, 38, 38);
        }
        .nav_logo{
            display: flex;
            gap:30px;
            justify-content: center;
            align-items: center;
        }
        .nav_logo span{
            color: aliceblue;
            font-size: 30px;
            cursor: pointer;
        }
        .nav img{
            width: 80px;
            height: 80px;
            margin-left: 100px;
            border-radius: 90px;
        }
        .nav-items{
            width: 850px;
            display: flex;
            align-items: center;
            padding:20px;
            gap:50px;
            position: relative;
        }
        .nav-items a{
            list-style: none;
            text-decoration: none;
            font-size: 23px;
            color:rgb(221, 215, 215);
            z-index: 1;
        }
        .animation{
            position:absolute;
            left:18px;
            width:70px;
            height: 2px;
            bottom:23px;
            background-color:  rgb(177, 53, 53);
            border-radius: 8px;
            transition: all .8s ease 0s;
        }
        .a:nth-child(1){
            width: 70px;
        }
        .nav-items #i1:hover~.animation{
            width: 70px;
            left:18px;
        }
        .nav-items #i2:hover~.animation{
            width: 76px;
            left:128px;
        }
        .a:nth-child(2){
            width: 100px;
            left:100px;
        }
        .nav-items #i3:hover~.animation{
            width: 124px;
            left:240px;
        }
        .a:nth-child(3){
            width: 100px;
        }
        .nav-items #i4:hover~.animation{
            width: 120px;
            left:400px;
        }
        .a:nth-child(4){
            width: 100px;
        }
        .nav-items #i5:hover~.animation{
            width:79px;
            left: 664px;
        }
        .a:nth-child(5){
            width: 100px;
        }
        .left-panel{
            height: 80vh;
            width: 30%;
            background-color: rgb(45, 45, 45);
        }
        .footer{
            height: 10vh;
            border-top: 2px solid rgb(78, 76, 76);
            background-color: rgb(45, 45, 45);
        }
        .main{
            display: flex;
        }
        .right-cor{
            width: 70%;
            background-color: black;
        }
        .right-cor img{
            height: 80vh;
            opacity: 0.8;
        }
        .left-panel{
            display: flex;
            flex-direction: column;
            align-items: center;
            gap:15px;
        }
        .left-panel-head{
            display: flex;
            flex-direction: column;
            gap:15px;
            text-align: center;
        }
        .left-panel-head img{
            height: 12vh;
            width: 5vw;
            margin-top:30px;
            border-radius: 90px;
        }
        .left-panel-head span{
            color: white;
        }
        .left-panel-main{
            display: flex;
            flex-direction: column;
            gap:40px;
        }
        .left-panel-head span img{
            height: 15px;
            width: 15px;
            margin-top: -2px;
            margin-left: 5px;
        }
        #opp1{
            margin-top: 35px;
        }
        .opp{
            display: flex;
            gap:20px;
            align-items: center;
            color: white;
            font-size: 20px;
        }
        .opp img{
            height: 20px;
            width: 30px;
        }
        .opp a{
            color: rgb(194, 193, 193);
        }
        .opp span{
            color: rgb(165, 165, 165);
        }
        .b-log-out button{
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
    </style>
</head>
<body>
    <div class="nav">
        <div class="nav_logo">
            <img src="bank_logo.jpeg" alt="#">
            <span>
                ABC Bank
            </span>
        </div>
        <div class = "nav-items">
            <a href = "User.jsp" id = "i1">Home</a>
            <a href="" id = "i2">About</a>
            <a href="#"id = "i3">Contact us</a>
            <a href="#"id = "i4">FeedBack</a>
            <div class="animation"></div>
            <div class="b-log-out">
               <button onclick="openLogin()">Log-Out</button>
            </div>
        </div>
    </div>
	<%
	    String name = (String) session.getAttribute("name");
	%>
    <div class="main">
        <div class="left-panel">
            <div class="left-panel-head">
                <img src="u.png" alt=""#>
                <span><%=name%><span><a href="EditProfile.jsp"><img src="pen.png" alt=""></a></span></span>
            </div>
            <div class="left-panel-main">
                <div class="opp" id="opp1">
                    <img src="file.png" alt="#">
                    <span>Account <a href="UserDetails.jsp">Details</a></span>
                </div>
                <div class="opp" id="opp2">
                    <img src="money-withdrawal.png" alt="#">
                    <span><a href="UserOperations.jsp">Withdraw</a> Money</span>
                </div>
                <div class="opp" id="opp3">
                    <img src="deposit.png" alt="#">
                    <span><a href="UserOperations.jsp">Deposit</a> Money</span>
                </div>
                <div class="opp" id="opp4">
                    <img src="receive-money.png" alt="#">
                    <span>Fund transfer <a href="UserOperations.jsp">Request</a></span>
                </div>
            </div>
        </div>
        <div class="right-cor">
            <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="bank-4859142_1280.png" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="finance-4858797_1280.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="ai-generated-8672350_1280.png" class="d-block w-100" alt="...">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
                </div>
        </div>
    </div>
    <div class="footer">
    </div>
    <script>
        function openLogin(){
			window.location.replace("Login.jsp");
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>