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

<script type="text/javascript">
window.onload = function(){ 
    /*
    console.log(
        "屏幕分辨率为：" + screen.width + "*" + screen.height
        +
        "屏幕可用大小：" + screen.availWidth + "*" + screen.availHeight
        +
        "网页可见区域宽：" + document.body.clientWidth
        +
        "网页可见区域高：" + document.body.clientHeight
        +
        "网页可见区域宽(包括边线的宽)：" + document.body.offsetWidth
        +
        "网页可见区域高(包括边线的宽)：" + document.body.offsetHeight
        +
        "网页正文全文宽：" + document.body.scrollWidth
        +
        "网页正文全文高：" + document.body.scrollHeight
        +
        "网页被卷去的高：" + document.body.scrollTop
        +
        "网页被卷去的左：" + document.body.scrollLeft
        +
        "网页正文部分上：" + window.screenTop
        +
        "网页正文部分左：" + window.screenLeft
        +
        "屏幕分辨率的高：" + window.screen.height
        +
        "屏幕分辨率的宽：" + window.screen.width
        +
        "屏幕可用工作区高度：" + window.screen.availHeight
        +
        "屏幕可用工作区宽度：" + window.screen.availWidth
        );*/
    var userinfoHeight = 200;
    var userinfoWidth  = 500;

    document.getElementById("form1").style.width  = userinfoWidth + "px";
    document.getElementById("form1").style.height = userinfoHeight + "px";

    document.getElementById("form1").style.marginTop = ((window.screen.availHeight - userinfoHeight)/2 - 100) + "px";
    document.getElementById("form1").style.marginLeft = (window.screen.availWidth - userinfoWidth) / 2 + "px";

    document.getElementById("TextBox1").style.width = "160px";
    document.getElementById("TextBox1").style.height = "24px";
    document.getElementById("TextBox2").style.width = "160px";
    document.getElementById("TextBox2").style.height = "24px";

    document.getElementById("Login").style.width = "80px";
    document.getElementById("Login").style.height = "40px";
    document.getElementById("ResetUserInfo").style.width = "80px";
    document.getElementById("ResetUserInfo").style.height = "40px";
}; 



</script>
<body style="background-color:#1c77ac; ">
    <form id="form1" style="background-color: #FF0066; width:0px; height:0px" runat="server">
        <div id="userinfo" runat="server" style=""  >
            </br></br>
            <asp:Label ID="Label1" runat="server" style="margin-left: 94px" Text="用户名"></asp:Label>&nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="0px" Width="0px"  ></asp:TextBox></br></br>
            <asp:Label ID="Label2" runat="server" style="margin-left: 94px" Text="密码"></asp:Label>&emsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server" Height="0px"  Width="0px" TextMode="Password"></asp:TextBox></br></br>
            <asp:Button ID="Login" runat="server" style="margin-left: 94px"  Height="0px" Width="0px" Text="登录" OnClick="Login_Click" />
            <asp:Button ID="ResetUserInfo" runat="server" style="margin-left: 64px" Height="0px" Width="0px" Text="重新输入" OnClick="ResetUserInfo_Click" />
        </div> 
    </form>  
</body>
</html>
