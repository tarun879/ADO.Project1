<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ADO.Project1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            margin: 0;
            background: linear-gradient(to right, #000000, #555555, #FFFFFF);
            background-size: 400% 400%;
            animation: moveGradient 10s ease infinite;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        @keyframes moveGradient {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        .login-container {
            background-color: grey; 
            width: 40vw;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }

        .header {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        .form-details {
            margin-bottom: 20px;
        }

        .form-details label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }

        .form-details input[type="text"],
        .form-details input[type="password"],
        .aspNetTextBox {
            width: 90%;
            padding: 10px 12px;
            border: 1.5px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .form-details input:focus {
            outline: none;
            border-color: #ffa500;
            box-shadow: 0 0 5px rgba(255, 165, 0, 0.5);
            background-color: #fff;
        }

        .btn-login {
            padding: 12px;
            background-color: black;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
            width:50%;
            margin-left:25%;
        }

        .btn-login:hover {
            background-color: #e69500;
        }

        .form-details a {
            color: #4e54c8;
            font-weight: 600;
            text-decoration: none;
        }

        .form-details :hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <div class="login-container">
        <div class="header">Login</div>
        <form id="form1" runat="server" onsubmit="return validateForm();">
            <div class="form-details">
                <asp:Label ID="lUsername" runat="server" Text="Username" AssociatedControlID="txtusername"></asp:Label>
                <asp:TextBox ID="txtusername" runat="server" CssClass="aspNetTextBox" placeholder="Enter your username" />
            </div>

            <div class="form-details">
                <asp:Label ID="lPassword" runat="server" Text="Password" AssociatedControlID="txtpassword"></asp:Label>
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="aspNetTextBox" placeholder="Enter your password" />
            </div>
            <div class="form-details">
            New User ? <a href="SignIn.aspx">Sign In</a>
        </div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />
        </form>
    </div>
    
    <script>
        let Username = document.getElementById("txtUsername").value;
        sessionStorage.setItem("Username", Username);
    </script>
</body>
</html>