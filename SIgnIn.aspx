<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SIgnIn.aspx.cs" Inherits="ADO.Project1.SignIn" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            color: black;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image:url('danielle-cerullo-CQfNt66ttZM-unsplash.jpg');
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background-position:center;
            background-size:cover;
        }

        .signup-container {
            background-color: grey;
            border-radius: 15px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
            width: 50%;
             animation: fadeSlideUp 1s ease-out;
             transition: transform 0.3s ease-in-out;
        }

        .signup-header {
            background-color: rgb(0,0,0,0.7);
            padding: 35px;
            text-align: center;
        }

        .signup-header h2 {
            font-size: 30px;
            margin-bottom: 5px;
            font-weight: bold;
            color:white;
        }

        .signup-header p {
            font-size: 16px;
            color:white;
        }

        .form-content {
            padding: 35px 30px;
        }

        .form-group {
            margin-bottom: 22px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            font-size: 14px;
            margin-bottom: 6px;
        }

        .textbox {
            width: 100%;
            padding: 12px 14px;
            border: 1.5px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            background: #f9f9f9;
        }

        .textbox:focus {
            border-color: #4e54c8;
            background: white;
            outline: none;
            box-shadow: 0 0 5px rgba(78, 84, 200, 0.3);
        }

        .btn-signup {
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 14px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            width: 40%;
            margin-left: 13vw;
            background-color: green;
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
        }

        .login-link a {
            color: #4e54c8;
            font-weight: 600;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .validation-message {
            font-size: 12px;
            color: red;
        }
       @keyframes fadeSlideUp {
        0% {
            opacity: 0;
            transform: translateY(30px);
        }
        100% {
            opacity: 1;
            transform: translateY(0);
        }
    }
    </style>
</head>
<body>
    <div class="signup-container">
        <div class="signup-header">
            <h2>Create Account</h2>
            <p>Join us today!</p>
        </div>

        <div class="form-content">
            <form id="form1" runat="server" onsubmit="return validateForm();">
                <div class="form-group">
                    <asp:Label ID="lblUsername" runat="server" Text="Username" AssociatedControlID="txtUsername"></asp:Label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="textbox" ClientIDMode="Static" placeholder="Enter your username"></asp:TextBox>
                    <div id="uservalidation" class="validation-message"></div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" Text="Email Address" AssociatedControlID="txtEmail"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" ClientIDMode="Static" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                    <div id="emailvalidation" class="validation-message"></div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" ClientIDMode="Static" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                    <div id="passwordvalidation" class="validation-message"></div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" AssociatedControlID="txtConfirmPassword"></asp:Label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="textbox" ClientIDMode="Static" TextMode="Password" placeholder="Confirm your password"></asp:TextBox>
                    <div id="confirmpasswordvalidation" class="validation-message"></div>
                </div>

                <div class="form-group">
                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn-signup" OnClick="Button1_Click" />
                </div>

                <div class="login-link">
                    Already have an account? <a href="Login.aspx">Login</a>
                </div>
                <asp:HiddenField ID="hdnJSValid" runat="server" ClientIDMode="Static" />
            </form>
        </div>


    </div>

  <script>
      window.onload = function () {
          document.getElementById("txtUsername").addEventListener("blur", validateUsername);
          document.getElementById("txtUsername").addEventListener("focus", clearUsernameError);

          document.getElementById("txtEmail").addEventListener("blur", validateEmail);
          document.getElementById("txtEmail").addEventListener("focus", clearEmailError);

          document.getElementById("txtPassword").addEventListener("blur", validatePassword);
          document.getElementById("txtPassword").addEventListener("focus", clearPasswordError);

          document.getElementById("txtConfirmPassword").addEventListener("blur", validateConfirmPassword);
          document.getElementById("txtConfirmPassword").addEventListener("focus", clearConfirmPasswordError);
      };

      function validateUsername() {
          let username = document.getElementById("txtUsername").value.trim();
          let div = document.getElementById("uservalidation");
          if (username.length < 3) {
              div.textContent = "Username must be at least 3 characters.";
              return false;
          } else if (!/^[A-Za-z]+$/.test(username)) {
              div.textContent = "Only letters allowed.";
              return false;
          }
          div.textContent = "";
          return true;
      }

      function clearUsernameError() {
          document.getElementById("uservalidation").textContent = "";
      }

      function validateEmail() {
          let email = document.getElementById("txtEmail").value.trim();
          let div = document.getElementById("emailvalidation");
          if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
              div.textContent = "Invalid email format.";
              return false;
          }
          div.textContent = "";
          return true;
      }

      function clearEmailError() {
          document.getElementById("emailvalidation").textContent = "";
      }

      function validatePassword() {
          let pass = document.getElementById("txtPassword").value;
          let div = document.getElementById("passwordvalidation");
          if (pass.length < 6) {
              div.textContent = "Password must be at least 6 characters.";
              return false;
          }
          div.textContent = "";
          return true;
      }

      function clearPasswordError() {
          document.getElementById("passwordvalidation").textContent = "";
      }

      function validateConfirmPassword() {
          let pass = document.getElementById("txtPassword").value;
          let confirm = document.getElementById("txtConfirmPassword").value;
          let div = document.getElementById("confirmpasswordvalidation");
          if (pass !== confirm) {
              div.textContent = "Passwords do not match.";
              return false;
          }
          div.textContent = "";
          return true;
      }

      function clearConfirmPasswordError() {
          document.getElementById("confirmpasswordvalidation").textContent = "";
      }

      function validateForm() {
          let valid1 = validateUsername();
          let valid2 = validateEmail();
          let valid3 = validatePassword();
          let valid4 = validateConfirmPassword();

          let allValid = valid1 && valid2 && valid3 && valid4;
          if (!valid1 || !valid2 || !valid3 || !valid4) {
              alert("Please correct the errors in the form.");
              return false;
          }
          document.getElementById("hdnJSValid").value = allValid ? "true" : "false";
          return true;
      }
  </script>

</body>
</html>