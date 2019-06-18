using PrisonOrderSys.CommonUtil;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Dao
{
    public class OrderInfoDao
    {
        // 定义一个静态变量来保存类的实例
        private static OrderInfoDao orderInfoDao;

        // 定义一个标识确保线程同步
        private static readonly object locker = new object();


        // 定义私有构造函数，使外界不能创建该类实例
        private OrderInfoDao()
        {
        }

        //定义公有方法提供一个全局访问点。
        public static OrderInfoDao GetInstance()
        {
            //这里的lock其实使用的原理可以用一个词语来概括“互斥”这个概念也是操作系统的精髓
            //其实就是当一个进程进来访问的时候，其他进程便先挂起状态
            if (orderInfoDao == null)//区别就在这里
            {
                lock (locker)
                {
                    // 如果类的实例不存在则创建，否则直接返回
                    if (orderInfoDao == null)
                    {
                        orderInfoDao = new OrderInfoDao();
                    }
                }
            }
            return orderInfoDao;
        }

        public DataSet findOrderList(string userName, string password)
        {
            /*StringBuilder s = new StringBuilder();//字符串拼接对象
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


            return null;// OrderSysDataAccess.GetInstance().findDataByCommand(str);


        }


    }
}