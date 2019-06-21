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
        private int departmentId = -1;
        private string departmentName = "";

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
                prisonNode.Value = "" + prison.Id; 
                rootNode.ChildNodes.Add(prisonNode);

                foreach(Department department in prison.DepartmentList)
                {
                    TreeNode departmentNode = new TreeNode();

                    if(departmentId == -1)
                    {
                        departmentId = department.Id;
                        departmentName = department.Name;
                    }
                    departmentNode.Text = department.Name;
                    departmentNode.NavigateUrl = null;
                    departmentNode.Value = "" + department.Id;
                    prisonNode.ChildNodes.Add(departmentNode);
                }
            }

            RefreshGridViewByUserList();

        }

        protected void Tree_SelectedNodeChanged(object sender, EventArgs e)
        {
            string str = "节点的值：" + Organization_View.SelectedNode.Value + ", 节点的路径：" + Organization_View.SelectedNode.ValuePath + ", 节点的数据路径：" + Organization_View.SelectedNode.DataPath;

            if(CommonFunction.SubstringCount(Organization_View.SelectedNode.ValuePath, "/")  == 2)
            {
                //在二级节点，即部门下才执行下列操作
                departmentId = Convert.ToInt32(Organization_View.SelectedNode.Value);
                departmentName = Organization_View.SelectedNode.Text.Trim();
                RefreshGridViewByUserList();
                return;
            }    
        }

        private void RefreshGridViewByUserList()
        {
            List<User> userList = DepartmentService.GetInstance().findUserListByDepartmentId(departmentId, departmentName);

            if ((userList != null) && userList.Count > 0)
            {
                GridView1.DataSource = userList;
                GridView1.DataBind();
            }
            return;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            RefreshGridViewByUserList();
        }
    }
}