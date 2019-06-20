using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.CommonUtil
{
    public class OrderSysDataAccess
    {
        private SqlConnection conn = null;

        // 定义一个静态变量来保存类的实例
        private static OrderSysDataAccess orderDataAccess;

        // 定义一个标识确保线程同步
        private static readonly object locker = new object();

 
        // 定义私有构造函数，使外界不能创建该类实例
        private OrderSysDataAccess()
        {
        }

        //定义公有方法提供一个全局访问点。
        public static OrderSysDataAccess GetInstance()
        {
            //这里的lock其实使用的原理可以用一个词语来概括“互斥”这个概念也是操作系统的精髓
            //其实就是当一个进程进来访问的时候，其他进程便先挂起状态
            if (orderDataAccess == null)//区别就在这里
            {
                lock (locker)
                {
                    // 如果类的实例不存在则创建，否则直接返回
                    if (orderDataAccess == null)
                    {
                        orderDataAccess = new OrderSysDataAccess();
                    }
                }
            }
            return orderDataAccess;
        }

        public bool CreateDBConnect()
        {
            lock (locker)
            { 
                if(conn != null)
                {
                    return true;
                }

                string connstring = ConfigurationManager.ConnectionStrings["dbConnStr"].ConnectionString;
                conn = new SqlConnection(connstring);
                try
                {
                    conn.Open();//打开数据库 
                    return true;
                }
                catch (Exception ee)
                {
                    Console.WriteLine(ee.ToString());
                    return false;
                }
            }

        }

        public bool findDataByCommand(string str)
        {
            using (SqlCommand cmd = conn.CreateCommand())    //创建数据库命令 
            {
                try
                {
                    cmd.CommandText = str;    //创建查询语句 
                    SqlDataReader sdr = cmd.ExecuteReader();    //从数据库中读取数据流存入reader中                                              
                    if (sdr.Read()) //从sdr中读取下一行数据,如果没有数据,sdr.Read()返回flase 
                    {
                        sdr.Close();
                        return true;
                    }
                    sdr.Close();
                    return false;
                }
                catch (Exception ee)
                {
                    Console.WriteLine(ee.ToString());
                    return false;
                }
            }
        }

        public DataSet findDataList(string str)
        {
            using (SqlCommand cmd = conn.CreateCommand())
            {
                //DataSet离线数据集
                cmd.CommandText = str;
                try
                {
                    DataSet dataset = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dataset);
                    if(dataset.Tables[0].Rows.Count <= 0)
                    {
                        return null;
                    }
                    return dataset;
                }
                catch (Exception ee)
                {
                    Console.WriteLine("执行的SQL语句为：" + str);
                    Console.WriteLine("执行的异常信息为：" + ee.ToString());
                    return null;
                }

                /*DataSet dataset = new DataSet();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataset);
                ShowDsTable(dataset.Tables[0]);
                for (int i = 0; i <= dataset.Tables[0].Rows.Count - 1; i++)
                {
                    dataset.Tables[0].Rows[i]["Name"] += i.ToString();
                }
                SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
                adapter.Update(dataset);
                ShowDsTable(dataset.Tables[0]);

                StringBuilder s = new StringBuilder();//字符串拼接对象
                s.Append("select * from Equip where 1=1");//要执行的sql语句
                SqlDataAdapter adsa = new SqlDataAdapter(s.ToString(), con);
                //或直接写成  SqlDataAdapter adsa = new SqlDataAdapter("select * from Equip", con);
                DataSet ds = new DataSet();
                adsa.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }*/
            }

        }

        public bool  executeSqlCmd(string str)
        {
            using (SqlCommand cmd = conn.CreateCommand())
            {
                cmd.CommandText = str;
                try
                {
                    int i = cmd.ExecuteNonQuery();

                    Console.WriteLine("影响行数为：{0}。", i);
                    if (i > 0)
                    {
                        return true;
                    }
                    return false;
                }
                catch (Exception ee)
                {
                    Console.WriteLine("执行的SQL语句为：" + str);
                    Console.WriteLine("执行的异常信息为：" + ee.ToString());
                    return false;
                }
               
            }
            
        }

    }
}