<%@ Page Title="组织列表"  Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"  CodeBehind="OrganizationList.aspx.cs" Inherits="PrisonOrderSys.OrganizationList" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript">   
    function cbSelectAll(aDgTableName, index) {
        var e = event.srcElement;
        var i = index;
        try {
            var id = null;
            /*if (i < 10) {
                id = aDgTableName + "_ctl0" + String(i) + "_cbtSelect";
            }
            else {
                id = aDgTableName + "_ctl" + String(i) + "_cbtSelect";
            }*/

            id = aDgTableName + String(i);
            while (document.getElementById(id) != null) {
                document.getElementById(id).checked = e.checked;
                i++;
                id = aDgTableName + String(i);
                //id = aDgTableName + check;
            }
        }
        catch (e) {
            alert(e);
        };
    }
</script>

<div class="navbar-inverse" style="background-color: #008080; line-height: normal; width: 100%; height: 50px; color: #FFFF00;">
        <ul class="nav navbar-nav">
            <li><a runat="server" href="~/GoodsType">组织管理</a></li>
        </ul>
</div>
<div class="container">
    <div style="float:left; width:20%">
        <asp:TreeView runat="server" ID="Organization_View" OnSelectedNodeChanged="Tree_SelectedNodeChanged" ></asp:TreeView>
    </div>

    <div  style="float:left; width:80%">
        <div id="goods_op" class="ordersys-op" style="padding-top: 20px">
            <asp:Label ID="Label1" runat="server" Text="商品名称"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" class="operation-button" Text="查询" Width="80px" />

       
            <div  class="ordersys-op" style="padding-top: 20px">
                <asp:Button ID="Button2" runat="server"  Text="新建"  Width="80px" />&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="删除"  Width="80px" />&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" Text="刷新"  Width="80px" OnClientClick="window.location.reload();"/>

                <div  class="ordersys-op" style="padding-top: 20px">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True"  OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" Width="90%">
                        <Columns>
                            <asp:TemplateField HeaderStyle-Width="3%">
                                    <HeaderTemplate>
                                        &nbsp;&nbsp;&nbsp;
                                    <asp:CheckBox ID="cbtSelectAll" runat="server"  onclick="cbSelectAll('MainContent_GridView1_cbtSelect_',0)"  autopostback="true"  />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbtSelect" runat="server"  />
                                </ItemTemplate>
                                <HeaderStyle Width="3%"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="id" HeaderText="用户ID"  Visible="False">
                            <HeaderStyle Width="8%" />
                            </asp:BoundField>

                            <asp:BoundField DataField="name" HeaderText="名称" >
                            <HeaderStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sex" HeaderText="性别" >
                            <HeaderStyle Width="10%" />
                            </asp:BoundField>

                            <asp:BoundField DataField="remarks" HeaderText="描述">
                            <HeaderStyle Width="40%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="操作" >
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='查看' > </asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink2" runat="server" Text='修改' > </asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle Width="10%" />
                            </asp:TemplateField>
                        </Columns>
                   </asp:GridView>

                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
