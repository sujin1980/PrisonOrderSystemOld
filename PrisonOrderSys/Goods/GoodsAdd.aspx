<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master"  CodeBehind="GoodsAdd.aspx.cs" Inherits="PrisonOrderSys.GoodsAdd" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="navbar-inverse" style="background-color: #008080; line-height: normal; width: 100%; height: 50px; color: #FFFF00;">
            <ul class="nav navbar-nav">
                <li><a runat="server" href="~/GoodsType">商品类型管理</a></li>
                <li><a runat="server" href="~/Goods">商品管理</a></li>
                <li><a runat="server" href="~/Goods">->新建商品</a></li>
            </ul>
    </div>
    <div class="container">
        <div  class="ordersys-op" style="padding-top: 20px">
            <asp:Label ID="Label1" runat="server" Text="名称"></asp:Label>&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <div  class="ordersys-op" style="padding-top: 20px">
            <asp:Label ID="Label2" runat="server" Text="价格"></asp:Label>&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </div>
        <div  class="ordersys-op" style="padding-top: 20px">
            <asp:Label ID="Label3" runat="server" Text="数量"></asp:Label>&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </div>
        <div  class="ordersys-op" style="padding-top: 20px">
            <asp:Label ID="Label4" runat="server" Text="图片"></asp:Label>&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </div>
        <div  class="ordersys-op" style="padding-top: 20px">
            <asp:Label ID="Label5" runat="server" Text="状态"></asp:Label>&nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </div>
        <div  class="ordersys-op" style="padding-top: 20px">
            <asp:Label ID="Label6" runat="server" Text="描述"></asp:Label>&nbsp;<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </div>
    </div>

</asp:Content>
