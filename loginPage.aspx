<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs" Inherits="data_Analysis_ad_Recommender_System.loginPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-image: url('Images/backgroundimage.jpg'); background-repeat: no-repeat; background-size: cover;">
    <form id="form1" runat="server">
        <div>
            <div class="container" style="height: 200px">
            </div>
            <center>
                <div class="container" style="width: 35%; height: auto; background-color: rgba(255, 255, 255, 0.8); border-radius: 20px">
                    <br />
                    <h2 style="text-align: center; font-family: 'Times New Roman'; font-size: 32px">Login Here</h2>
                    <br />
                    <table style="width: 75%; text-align: center">
                        <tr>
                            <td colspan="2" align="right">
                                <asp:Label ID="lbl1" runat="server" Text="Email :" Font-Names="Times New Roman" Font-Size="21px" Font-Bold="true"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="email" runat="server" Style="border-radius: 15px; height: 32px; width: 95%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <asp:Label ID="lbl2" runat="server" Text="Password :" Font-Names="Times New Roman" Font-Size="21px" Font-Bold="true"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="pass" runat="server" Style="border-radius: 15px; height: 32px; width: 95%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                            <td>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="login" runat="server" Text="Login" Style="border-radius: 15px; height: 40px; width: 35%; border: none; font-family: 'Times New Roman'; font-size: 20px;" BackColor="DeepSkyBlue" ForeColor="White" OnClick="login_Click" />
                    <br />
                    <br />
                    <br />
                </div>
            </center>
        </div>
    </form>
</body>
</html>
