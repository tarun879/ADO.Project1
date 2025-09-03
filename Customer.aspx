<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="ADO.Project1.Customer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Management</title>
    <style>
        body {
            font-family: Arial;
            text-align: center;
            margin: 0;
            padding: 0;
            background-color: silver;
        }

        #form1 {
            width: 100%;
        }

        .form-container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        .form-table {
            margin: 0 auto;
            border-spacing: 10px;
        }

        .form-table td {
            padding: 5px;
            text-align: left;
        }

        .button-container {
            margin-top: 20px;
        }

        .button-container asp\:Button {
            margin: 5px 15px;
        }

        #GridView1 {
            margin: 30px auto;
            width: 90%;
            text-align: center;
            background-color: white;
        }

        h2 {
            margin-top: 30px;
        }

        #display {
            background-color: lawngreen;
            padding: 5px;
        }

        #insert {
            background-color: lightgreen;
            padding: 5px;
        }

        #delete {
            background-color: red;
            padding: 5px;
        }

        #update {
            background-color: yellow;
            padding: 5px;
        }

        #search {
            background-color: aquamarine;
            padding: 5px;
        }

        #count {
            background-color: cyan;
            padding: 5px;
        }

        #clear {
            background-color: antiquewhite;
            padding: 5px;
        }

        .top-right-fixed {
            position: absolute;
            top: 10px;
            right: 20px;
            z-index: 999;
            background-color: red;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Customer Management</h2>

            <asp:Button ID="logout" runat="server" Text="Logout" CssClass="top-right-fixed" OnClick="logout_Click" />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" />

            <table class="form-table">
                <tr>
                    <td><asp:Label ID="Label1" runat="server" Text="Customer ID:" /></td>
                    <td><asp:TextBox ID="CustomerId" runat="server" /></td>

                    <td><asp:Label ID="Label2" runat="server" Text="Name:" /></td>
                    <td><asp:TextBox ID="Name" runat="server" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label3" runat="server" Text="Email:" /></td>
                    <td><asp:TextBox ID="Email" runat="server" /></td>

                    <td><asp:Label ID="Label4" runat="server" Text="Phone:" /></td>
                    <td><asp:TextBox ID="Phone" runat="server" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label5" runat="server" Text="Date of Birth:" /></td>
                    <td><asp:TextBox ID="DateOfBirth" runat="server" TextMode="Date" /></td>

                    <td><asp:Label ID="Label6" runat="server" Text="Join Date:" /></td>
                    <td><asp:TextBox ID="JoinDate" runat="server" TextMode="Date" /></td>
                </tr>
            </table>

            <div class="button-container">
                <asp:Button ID="display" runat="server" Text="Display" OnClick="display_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="insert" runat="server" Text="Insert" OnClick="insert_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="delete" runat="server" Text="Delete" OnClick="delete_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="update" runat="server" Text="Update" OnClick="update_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="search" runat="server" Text="Search" OnClick="search_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="count" runat="server" Text="Count" OnClick="count_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="clear" runat="server" Text="Clear" OnClick="clear_Click" />
            </div>
        </div>
    </form>
</body>
</html>
