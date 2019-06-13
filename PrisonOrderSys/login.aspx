<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PrisonOrderSys.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link   rel="stylesheet" type="text/css" href="common/css/style.css"  />
</head>
<body>
   <div class="loginbody" align="center">
	    <div class="systemlogo"></div> 
	    <div class="loginbox" align="left">
            <ul>
		    	<li>
                    <input id="UserName" type="text" />
		    	</li>
		    	<li>
                    <input id="Password" type="password" />
		    	</li>
		    	<span id="loginValidate" style="color:red;font-size:14px"></span>
		    	<li>
		    		<br/>
                    <input id="Button1" type="button" value="button" />
		    		
		    	</li>
		    </ul>
        </div>
   </div>    
</body>
</html>
