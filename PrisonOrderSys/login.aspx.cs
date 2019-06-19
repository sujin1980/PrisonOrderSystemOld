using PrisonOrderSys.CommonUtil;
using PrisonOrderSys.Service;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrisonOrderSys
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (OrderSysDataAccess.GetInstance().CreateDBConnect() == false)
            {
                Response.Write("<script language=javascript>alert('数据库连接失败，请稍后刷新重试！');window.location = 'login.aspx';</script>");
            }

            /*
            string connstring2 = "server =.; database = PrisonOrder; integrated security = SSPI";
            //database=test_login 数据库名
            SqlConnection conn = new SqlConnection(connstring2);
            SqlCommand cmd = conn.CreateCommand();    //创建数据库命令 

            UserService.GetInstance().findUserbyNameAndPassword();

            try
            {
                conn.Open();//打开数据库 

                string user_number = "admin2";
                string user_pwd = "admin2";
                cmd.CommandText = "select * from t_user where user_name = '" + user_number + "' and user_password=" + "'" + user_pwd + "'";    //创建查询语句 
                SqlDataReader sdr = cmd.ExecuteReader();    //从数据库中读取数据流存入reader中                                              
                if (sdr.Read()) //从sdr中读取下一行数据,如果没有数据,sdr.Read()返回flase 
                {
                    HttpContext.Current.Session["UserId"] = user_number;
                    HttpContext.Current.Session["Userpwd"] = user_pwd;
                    Response.Redirect("welcome.aspx");
                }
                else
                {
                    //Message.Text = "输入错误，请重新输入！";

                    // Response.Redirect("login.aspx");
                    // Response.Write("<script>confirm('输入账号或密码错误！');</script>");

                    Response.Write("<script language=javascript>alert('输入账号或密码错误！');window.location = 'login.aspx';</script>");

                }
            }
            catch (Exception ee)
            {
               //Response.Write("The connection is fair");
                String str = ee.ToString();
                Console.WriteLine("Hello,world");
                Console.WriteLine(str);
            }
            finally
            {
                String str2 = "dasafs";
                Console.WriteLine(str2);
                conn.Close();
            }
            */
        }

        protected void ResetUserInfo_Click(object sender, EventArgs e)
        {
            
            this.TextBox1.Text = "";
            this.TextBox2.Text = "";
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            if(UserService.GetInstance().findUserbyNameAndPassword(this.TextBox1.Text.Trim(), this.TextBox2.Text.Trim()))
            {
               Server.Transfer("Default.aspx?", true);
               //Server.Transfer("./Goods/GoodsList.aspx?", true); 地址跳转Debug正确
            }
            else
            {
                this.TextBox1.Text = "";
                this.TextBox2.Text = "";

                Response.Write("<script language=javascript>alert('输入账号或密码错误！');window.location = 'login.aspx';</script>");
            }
        }

   

       

    }
}