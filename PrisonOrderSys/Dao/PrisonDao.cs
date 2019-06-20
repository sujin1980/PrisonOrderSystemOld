using PrisonOrderSys.CommonUtil;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Dao
{
    public class PrisonDao
    {
        // 定义一个静态变量来保存类的实例
        private static PrisonDao prisonDao;

        // 定义一个标识确保线程同步
        private static readonly object locker = new object();


        // 定义私有构造函数，使外界不能创建该类实例
        private PrisonDao()
        {
        }

        //定义公有方法提供一个全局访问点。
        public static PrisonDao GetInstance()
        {
            //这里的lock其实使用的原理可以用一个词语来概括“互斥”这个概念也是操作系统的精髓
            //其实就是当一个进程进来访问的时候，其他进程便先挂起状态
            if (prisonDao == null)//区别就在这里
            {
                lock (locker)
                {
                    // 如果类的实例不存在则创建，否则直接返回
                    if (prisonDao == null)
                    {
                        prisonDao = new PrisonDao();
                    }
                }
            }
            return prisonDao;
        }

        public bool findUserbyNameAndPassword(string userName, string password)
        {
            string str = "select * from t_user where name = '" + userName + "' and password=" + "'" + password + "'";
            return OrderSysDataAccess.GetInstance().findDataByCommand(str);


        }
        
        public DataSet findDepListByPrisonId(int prisonId)
        {
            string str = "select d.id, d.name from t_prison p, t_dept d where d.prison_id = p.id and p.id = " + prisonId;
            return OrderSysDataAccess.GetInstance().findDataList(str);
        }

    }
}