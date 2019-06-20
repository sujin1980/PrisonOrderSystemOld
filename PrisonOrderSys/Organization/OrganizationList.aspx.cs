using PrisonOrderSys.CommonUtil;
using PrisonOrderSys.Dao;
using PrisonOrderSys.Models;
using PrisonOrderSys.Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrisonOrderSys
{
    public partial class OrganizationList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GenTreeNode();  //调用GenTreeNode()方法以建立TreeView之节点
            }
        }

        private void GenTreeNode()
        {
            if (OrderSysDataAccess.GetInstance().CreateDBConnect() == false)
            {
                Response.Write("<script language=javascript>alert('数据库连接失败，请稍后刷新重试！');window.location = 'Default.aspx';</script>");
                return;
            }

            List<Prison> prisonList = UserService.GetInstance().findPrisonInfoByUser("admin");

            TreeNode rootNode = new TreeNode();

            this.Organization_View.Nodes.Add(rootNode);
            Organization_View.ShowLines = true;

            foreach(Prison prison in prisonList)
            {
                TreeNode prisonNode = new TreeNode();

                prisonNode.Text = prison.Name;
                prisonNode.NavigateUrl = null;
                rootNode.ChildNodes.Add(prisonNode);

                foreach(Department department in prison.DepartmentList)
                {
                    TreeNode departmentNode = new TreeNode();

                    departmentNode.Text = department.Name;
                    departmentNode.NavigateUrl = null;
                    prisonNode.ChildNodes.Add(departmentNode);
                }
            }
            
        }
    }
}