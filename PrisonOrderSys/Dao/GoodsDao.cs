using PrisonOrderSys.CommonUtil;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Dao
{
    public class GoodsDao
    {
        // 定义一个静态变量来保存类的实例
        private static GoodsDao goodsDao;

        // 定义一个标识确保线程同步
        private static readonly object locker = new object();


        // 定义私有构造函数，使外界不能创建该类实例
        private GoodsDao()
        {
        }

        //定义公有方法提供一个全局访问点。
        public static GoodsDao GetInstance()
        {
            //这里的lock其实使用的原理可以用一个词语来概括“互斥”这个概念也是操作系统的精髓
            //其实就是当一个进程进来访问的时候，其他进程便先挂起状态
            if (goodsDao == null)//区别就在这里
            {
                lock (locker)
                {
                    // 如果类的实例不存在则创建，否则直接返回
                    if (goodsDao == null)
                    {
                        goodsDao = new GoodsDao();
                    }
                }
            }
            return goodsDao;
        }

        public DataSet findGoodsList()
        {
            string str = "select * from t_goods";
            return OrderSysDataAccess.GetInstance().findDataList(str);
        }

        public bool deleteGoodsList(string goodsList)
        {
            string deleteStr = "delete from t_goods where id in( " + goodsList + ")";
            return OrderSysDataAccess.GetInstance().executeSqlCmd(deleteStr);
        }

        public bool createGoods(string name, string number, string price, string picture, string remarks)
        {
            string insertStr = "insert into t_goods(name, number, price, picture, remarks) values('" + name + "', "
                + number + ", "  + price + ", '" + picture + "', '" + remarks + " ')";


            return OrderSysDataAccess.GetInstance().executeSqlCmd(insertStr);
        }
    }
}