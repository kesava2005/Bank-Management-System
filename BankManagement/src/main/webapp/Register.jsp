<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Regitration-page</title>
    <style>
        :root{
            font-family: sans-serif;
            font-size: 23px;
            font-weight: 600;
            color:rgb(3, 32, 12)
        }
        body{
            overflow: hidden;
            background-color: rgb(30, 30, 30);
            background-image: url(bank2.jpeg);
            background-blend-mode: lighten;
            display: flex;
            flex-direction: column;
            gap:100px;
        }
        .login{
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }
        input{
            width: 250px;
            border: 1px solid saddlebrown;
            border-radius: 5px;
            font-size: 18px;
            font-weight: 600;
        }
        input:focus{
            outline:1px solid rgb(84, 42, 12);
        }
        .loginf{
            display: grid;
            grid-template-columns: 1fr 1fr;
            padding: 50px;
            grid-gap: 30px;
            background-color: rgb(198, 187, 173);
            box-shadow: 0px 2px 2px 0px rgb(73, 73, 73);
        }
        .butt{
            height: 35px;
            font-size: 20px;
            font-weight: 600;
            color: white;
            border:none;
            background-color: rgb(84, 84, 248);
            border-radius: 5px;
        }
        #button:hover{
            color: rgb(209, 208, 208);
            background-color: rgb(63, 63, 186);
        }
        .heading{
            text-align: center;
            font-weight: 800;
            color: white;
        }
        .heading h2{
            position: relative;
            display: inline-block;
        }
        .heading h2 span{
            width:100%;
            height: 100%;
            position: absolute;
            bottom: 0px;
            left: 0px;
            background-color: rgb(30, 30, 30);
            animation: headingAnimation 6s steps(25) infinite;
        }
        @keyframes headingAnimation {
            40%,60%{
                left:100%;
            }
            100%{
                left:0%;
            }
        }
        #loginAdm{
            display: none;
            transition: opacity 1s;
        }
		#error-message{
			color:red;
		    font-size: 15px;
		    margin-top: 5px;
		}
		h4{
		    font-size: 15px;
		    color: rgb(133, 133, 124);
		    margin-top:5px;
		    margin-bottom: -20px;
		}
		h4 a{
		    color: rgb(119, 119, 114);
		}
		h4 a:hover{
		    color: rgb(50, 50, 48);
		}
    </style>
</head>
<body>
    <div class="heading">
        <h2>Register to get access to ABC Bank<span></span></h2>
    </div>
    <div class="login">
    <form action = "/UserRegister" method="post" class="loginf" id="loginStu" onsubmit="return validate(id)">
        <label for="uid">User ID:</label>
        <input type="number" name="uid" id="uid" autocomplete = "off">
        <label for="uname">User Name:</label>
        <input type="text" name="uname" id = "uname" autocomplete = "off">
        <label for="pass">Enter Password:</label>
        <input type= "password" name="pass" id="pass" autocomplete = "off">
        <label for="re-pass">ReEnter Password:</label>
        <input  type="password" name="re-pass" id="re-pass" autocomplete = "off">
        <input type="submit" value="Register" class = "butt">
		<h4>Click here to <a href="Login.jsp">Login</a></h4>
		<%
			String errorMessage = (String) request.getAttribute("errorMessage");
			if (errorMessage != null) {
			%>
				<p id = "error-message"><%= errorMessage %></p>
			<%
			 }
		%>
    </form>
    <script>
        function validate(formId) {
            var form = document.getElementById(formId);
            var uid = form.querySelector('input[name="uid"]').value;
            var uname = form.querySelector('input[name="uname"]').value;
            var pass = form.querySelector('input[name="pass"]').value;
            var rePass = form.querySelector('input[name="re-pass"]').value;
            if (uid === "" || uid === null) {
                alert("The ID should not be empty");
                return false;
            }
            if (uname === "" || uname === null) {
                alert("The name should not be empty");
                return false;
            }
            if (pass === "" || pass === null) {
                alert("The password should not be empty");
                return false;
            }
            if (rePass === "" || rePass === null) {
                alert("The re-entered password should not be empty");
                return false;
            }
            if (pass !== rePass) {
                alert("The re-entered password should match the password");
                return false;
            }
			if (isNaN(parseInt(uid)) || !isNaN(parseInt(uname)) ) {
			        window.alert("Invalid data entered");
			        return false
			 }
            return true;
        }
    </script>
    </div>
</body>
</html>