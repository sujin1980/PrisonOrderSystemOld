<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PrisonOrderSys.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>

<style>
    .jumbotron {
      padding: 30px;
      margin-bottom: 30px;
      font-size: 21px;
      font-weight: 200;
      line-height: 2.1428571435;
      color: inherit;
      background-color: #00FF00;
    }

   
    .jumbotron p {
      line-height: 1.4;
    }

    .container .jumbotron {
      border-radius: 6px;
    }
</style>

<body style="background-color:#1c77ac; ">
    <form id="form1" style="margin-top: 100px; " runat="server">
    <div style="padding: 0px; background-color: #FF0066; width: 100%; height: 100%; vertical-align: middle; text-align: center; ">
        <input id="Text1" type="text"  />
        <input id="Text2" type="text" />
        <input id="Submit1" type="submit" value="submit" />
        <input id="Button1" type="button" value="button" />
    </div>
    <div>
        <asp:TextBox ID="TextBox1" runat="server" Text="hello,world!"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="服务器" OnClick="Button2_click" />
    </div> 
    </form>
</body>
</html>
