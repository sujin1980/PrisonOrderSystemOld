<%@ Page Title="商品列表"  Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"  CodeBehind="GoodsList.aspx.cs" Inherits="PrisonOrderSys.GoodsList" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="../Content/bootstrap.css">	


<script type="text/javascript">

    var idPre = "MainContent_";

    $(function () {
        $('#myModal').on('show.bs.modal', function (event) {
            var modal = $(this);  //get modal itself
            modal.find('.modal-body #MainContent_GoodsName').text('your message');
        });
    });


    function checkInput(){
        if ($("#" + idPre + "GoodsName").val().trim().length == 0) {
            alert("请输入商品名称！");
            console.log("请输入商品名称！");
            return false;
        }

        if ($("#" + idPre + "GoodsPrice").val().trim().length == 0) {
            alert("请输入商品价格！");
            console.log("请输入商品价格！");
            return false;
        }

        var priceval = $("#" + idPre + "GoodsPrice").val().trim();
        var r = /^\d{1,18}(.\d{1,2})?$/gi;
        if (!r.test(priceval)) {
            alert("输入的商品价格不是有效的数字");
            console.log("输入的商品价格不是有效的数字");
            return false;
        }

        if ($("#" + idPre + "GoodsNumber").val().trim().length == 0) {
            alert("请输入商品数量！");
            console.log("请输入商品数量！");
            return false;
        }

        var numberval = $("#" + idPre + "GoodsNumber").val().trim();
        var reg=/^[1-9]\d*$/; //由 1-9开头 的正则表达式
        //先判断是否为整数 在判断 是否在 1-总页 整数范围之内
        if (!reg.test(numberval)) {
            alert("输入的商品数量不是有效的数字");
            console.log("输入的商品数量不是有效的数字");
            return false;
        }

        

        if ($("#" + idPre + "goodsimg").attr('src').indexOf("upload") < 0) {
            alert("请上传商品图片！");
            console.log("请先上传商品图片！");
            return false;
        }

       // alert("输入信息正确");
        return true;

    }

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

    function openMotai(){    
        $("#myModal").modal({ backdrop: 'static', keyboard: false });
    }

    function goodRefresh()
    {
        window.location.reload();
    }

    function queryGoods2(goodsId, name, number, price, picture) {
        alert("queryGoods2");
        alert(picture);
        return true;
    }

    function queryGoods(goodsId, name, number, price, picture, remarks) {
        alert(name);

        $("#MainContent_GoodsName").val = name;
        $("#myModal").modal('show');
        $("#MainContent_GoodsName").val = name;
        $("#" + idPre + "GoodsPrice").val = price;
        $("#" + idPre + "GoodsNumber").va = number;
        //$("#" + idPre + "goodsimg").src     = picture;
        $("#" + idPre + "GoodsRemarks").val = remarks;
        return true;
    }

    function editGoods(goodsId, name, number, price, picture, remarks) {
        $("#" + idPre + "GoodsName").val = name;
        $("#" + idPre + "GoodsPrice").val = price;
        $("#" + idPre + "GoodsNumber").va = number;
        $("#" + idPre + "goodsimg").src = picture;
        $("#" + idPre + "GoodsRemarks").val = remarks;
        return true;
    }
</script>


<div class="navbar-inverse" style="background-color: #008080; line-height: normal; width: 100%; height: 50px; color: #FFFF00;">
        <ul class="nav navbar-nav">
            <li><a runat="server" href="~/GoodsType">商品类型管理</a></li>
            <li><a runat="server" href="~/Goods">商品管理</a></li>
        </ul>
</div>
<div class="container">
    <div id="goods_op" class="ordersys-op" style="padding-top: 20px">
        <asp:Label ID="Label1" runat="server" Text="商品名称"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" class="operation-button" Text="查询" Width="80px" />

       
        <div  class="ordersys-op" style="padding-top: 20px">
            <asp:Button ID="Button2" runat="server"  Text="新建" data-toggle="modal" data-target="#myModal" Width="80px" />&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="删除"  Width="80px" OnClick="Goods_Delete"/>&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="刷新"  Width="80px" OnClientClick="window.location.reload();"/>
        </div>

   
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
                    <asp:BoundField DataField="id" HeaderText="商品ID"  >
                    <HeaderStyle Width="8%" />
                    </asp:BoundField>

                    <asp:BoundField DataField="name" HeaderText="名称" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="number" HeaderText="数量" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="价格" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>

                    <asp:BoundField DataField="picture" HeaderText="图片"  Visible="False" >
                    <HeaderStyle Width="10%" />
                    </asp:BoundField>

                    <asp:BoundField DataField="remarks" HeaderText="描述">
                    <HeaderStyle Width="40%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="操作" >
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" Text='查看'
                                onClick='<%# "return queryGoods(" + Eval("id") + ", \"" + Eval("name") + "\"," + Eval("number") + ", " + Eval("price") + ", \"" + Eval("picture") + "\" , \"" + Eval("remarks") + "\")" %>'   > </asp:HyperLink>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "return editGoods(" + Eval("id") + "," + Eval("name") + "," + Eval("number") + "," + Eval("price") + "," + Eval("picture") + "," + Eval("remarks") + ")" %>' Text='修改'> </asp:HyperLink>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加商品
				</h4>
			</div>

            <div class="container">
			    <div  class="ordersys-op" style="padding-top: 20px">
                    <asp:Label ID="Label2" runat="server" Text="名称"></asp:Label>&nbsp;<asp:TextBox ID="GoodsName" runat="server"></asp:TextBox>
                </div>
                <div  class="ordersys-op" style="padding-top: 20px">
                    <asp:Label ID="Label3" runat="server" Text="价格"></asp:Label>&nbsp;<asp:TextBox ID="GoodsPrice" runat="server"></asp:TextBox>&nbsp;<asp:Label ID="Label6" runat="server" Text="(元)
                        "></asp:Label>
                </div>
                <div  class="ordersys-op" style="padding-top: 20px">
                    <asp:Label ID="Label4" runat="server" Text="数量"></asp:Label>&nbsp;<asp:TextBox ID="GoodsNumber" runat="server"></asp:TextBox>
                </div>
                <div  class="ordersys-op" style="padding-top: 20px">
                    <asp:Label ID="Label5" runat="server" Text="图片"></asp:Label>&nbsp;
                </div>
                <img id="goodsimg" runat="server" src="" />
                <asp:FileUpload ID="FileUpload" runat="server" />
                <asp:Button ID="BtnUp" runat="server" onclick="BtnUp_Click" Text="上 传" />
                <asp:Label ID="LabMsg" runat="server"></asp:Label>
                
                
                <div  class="ordersys-op" style="padding-top: 20px">
                    <asp:Label ID="Label7" runat="server" Text="描述"></asp:Label>&nbsp;<asp:TextBox ID="GoodsRemarks" runat="server"></asp:TextBox>
                </div>
            </div>
			<div class="modal-footer">
                <asp:Button ID="Button5" runat="server" Text="保存" OnClientClick="return checkInput();"  OnClick="SaveGoods_Click" Width="80px" />
                <asp:Button ID="Button6" runat="server" Text="取消" OnClick="CancelSave_Click"  Width="80px" />
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->

</div>
        
</asp:Content>
