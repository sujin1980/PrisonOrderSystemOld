using PrisonOrderSys.CommonUtil;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Dao
{
    public class DepartmentDao
    {
        // 定义一个静态变量来保存类的实例
        private static DepartmentDao departmentDao;

        // 定义一个标识确保线程同步
        private static readonly object locker = new object();


        // 定义私有构造函数，使外界不能创建该类实例
        private DepartmentDao()
        {
        }

        //定义公有方法提供一个全局访问点。
        public static DepartmentDao GetInstance()
        {
            //这里的lock其实使用的原理可以用一个词语来概括“互斥”这个概念也是操作系统的精髓
            //其实就是当一个进程进来访问的时候，其他进程便先挂起状态
            if (departmentDao == null)//区别就在这里
            {
                lock (locker)
                {
                    // 如果类的实例不存在则创建，否则直接返回
                    if (departmentDao == null)
                    {
                        departmentDao = new DepartmentDao();
                    }
                }
            }
            return departmentDao;
        }

        public DataSet findUserListByDepartmentId(int departmentId)
        {
            string str = "select u.id as id, u.name as name, u.sex as sex, " + 
                "u.telephone as telephone, u.remarks as remarks from t_user u, t_dept d where " + 
                "u.dep_id = d.id and d.id = " + departmentId;
            return OrderSysDataAccess.GetInstance().findDataList(str);
        }
    }
}