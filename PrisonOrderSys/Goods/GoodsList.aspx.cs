using PrisonOrderSys.CommonUtil;
using PrisonOrderSys.Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrisonOrderSys
{
    public partial class GoodsList : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                return;
            }

            if (OrderSysDataAccess.GetInstance().CreateDBConnect() == false)
            {
                Response.Write("<script language=javascript>alert('数据库连接失败，请稍后刷新重试！');window.location = 'Default.aspx';</script>");
                return;
            }
            
            DataSet dataset = GoodsService.GetInstance().findGoodsList();
            if ((dataset != null) && (dataset.Tables[0].Rows.Count > 0))
            {
                GridView1.DataSource = dataset;
                GridView1.DataBind();
            }
        }

        protected void GoodsAllCheck(object sender, EventArgs e)
        {
            int i = 0;
            Console.WriteLine("hello,world");
            return;
        }

        protected void Goods_Create(object sender, EventArgs e)
        {
            Server.Transfer("GoodsAdd.aspx?", true);
            return;
        }

        protected void Goods_Delete(object sender, EventArgs e)
        {
            string wid = "";
            foreach (GridViewRow row in GridView1.Rows)
            {
                Control ctl = row.FindControl("cbtSelect");
                CheckBox ck = (CheckBox)ctl;
                if (ck.Checked)
                {
                    TableCellCollection cell = row.Cells;
                    wid += cell[1].Text + ",";
                }
            }

            if(wid.Trim().Length > 0)
            {
                Console.WriteLine("wid = " + wid);
                string goodsList = wid.Substring(0, wid.LastIndexOf(','));
                GoodsService.GetInstance().deleteGoodsList(goodsList);
            }
            return;
        }

        protected void Goods_Refresh(object sender, EventArgs e)
        {
            return;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GoodsService.GetInstance().findGoodsList();
            DataSet dataset = GoodsService.GetInstance().findGoodsList();
            if ((dataset != null) && (dataset.Tables[0].Rows.Count > 0))
            {
                GridView1.DataSource = dataset;
                GridView1.DataBind();
            }
        }

        protected void SaveGoods_Click(object sender, EventArgs e)
        {
            string str = this.goodsimg.Src.Trim();
            int goodsId = -1;


            string goodsIdStr = this.GoodsId.Text.Trim();
            try
            {
                goodsId = Convert.ToInt32(goodsIdStr);
            }
            catch(Exception ee)
            {
                Console.WriteLine(ee.ToString());
                GoodsService.GetInstance().createGoods(this.GoodsName.Text.Trim(), this.GoodsPrice.Text.Trim(),
                    this.GoodsNumber.Text.Trim(), this.goodsimg.Src.Trim(), this.GoodsRemarks.Text.Trim());
                return;
            }

            if(goodsId < 0)
            {
                GoodsService.GetInstance().createGoods(this.GoodsName.Text.Trim(), this.GoodsPrice.Text.Trim(),
                    this.GoodsNumber.Text.Trim(), this.goodsimg.Src.Trim(), this.GoodsRemarks.Text.Trim());
            }
            else
            {
                Console.WriteLine(this.goodsimg.Src);
                GoodsService.GetInstance().modifyGoods(goodsId, this.GoodsName.Text.Trim(), this.GoodsPrice.Text.Trim(),
                    this.GoodsNumber.Text.Trim(), this.goodsimg.Src.Trim(), this.GoodsRemarks.Text.Trim());
            }
           
        }

        protected void CancelSave_Click(object sender, EventArgs e)
        {
            this.GoodsName.Text   = "";
            this.GoodsPrice.Text  = "";
            this.GoodsNumber.Text = "";
            this.GoodsRemarks.Text = "";
        }

        /*
        override public void ProcessRequest(HttpContext context)
        {
            /*
            context.Response.ContentType = "text/html";
            //context.Response.Write("Hello World");
            //后台拿到上传来的图片（拿到名为imgFile的input标签的文件）
            var file = context.Request.Files["imgFile"];

            //后台也要对拿到的数据是否为图片进行校验（因为前台可以通过浏览器改代码，前台校验完了需要后台再拦截一下）
            var ext = Path.GetExtension(file.FileName);
            if (!(ext == ".jpeg" || ext == ".jpg" || ext == ".png" || ext == ".gif"))
            {
                context.Response.Write("shit,你传的不是图片");
                context.Response.End();
            }
            else
            {
                //上传的文件保存到目录(为了保证文件名不重复，加个Guid)
                string path = "/Upload/" + Guid.NewGuid().ToString() + file.FileName;
                file.SaveAs(context.Request.MapPath(path));//必须得是相对路径

                //把图片显示到前端让用户看得到
                string str = string.Format("<html><head></head><body><img src='{0}'/></body></html>",
                    path);//必须得是绝对路径！！！！
                context.Response.Write(str);
            }

        }*/
    
        protected void BtnUp_Click(object sender, EventArgs e)
        {
            if (FileUpload.HasFile)
            {
                string savePath = Server.MapPath("~/upload/");//指定上传文件在服务器上的保存路径
                //检查服务器上是否存在这个物理路径，如果不存在则创建
                if (!System.IO.Directory.Exists(savePath))
                {
                    System.IO.Directory.CreateDirectory(savePath);
                }
                savePath = savePath + "\\" + FileUpload.FileName;
                FileUpload.SaveAs(savePath);
                LabMsg.Text = string.Format("<a href='upload/{0}'>upload/{0}</a>", FileUpload.FileName);
                this.goodsimg.Src = "upload/" + FileUpload.FileName;
            }
            else
            {
                LabMsg.Text = "你还没有选择上传文件!";
            }
        }

        protected void ProcessRequest(object sender, EventArgs e)
        {

        }

    }
}