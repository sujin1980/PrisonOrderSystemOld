using PrisonOrderSys.CommonUtil;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrisonOrderSys
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (OrderSysDataAccess.GetInstance().CreateDBConnect() == false)
            {
                Response.Write("<script language=javascript>alert('数据库连接失败，请稍后刷新重试！');window.location = 'Default.aspx';</script>");
            }
        }
    }
}