using PrisonOrderSys.CommonUtil;
using PrisonOrderSys.Dao;
using PrisonOrderSys.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Service
{
    public class DepartmentService
    {
        // 定义一个静态变量来保存类的实例
        private static DepartmentService departmentService;

        // 定义一个标识确保线程同步
        private static readonly object locker = new object();


        // 定义私有构造函数，使外界不能创建该类实例
        private DepartmentService()
        {
        }

        //定义公有方法提供一个全局访问点。
        public static DepartmentService GetInstance()
        {
            //这里的lock其实使用的原理可以用一个词语来概括“互斥”这个概念也是操作系统的精髓
            //其实就是当一个进程进来访问的时候，其他进程便先挂起状态
            if (departmentService == null)//区别就在这里
            {
                lock (locker)
                {
                    // 如果类的实例不存在则创建，否则直接返回
                    if (departmentService == null)
                    {
                        departmentService = new DepartmentService();
                    }
                }
            }
            return departmentService;
        }
        
        public List<User> findUserListByDepartmentId(int departmentId, string departmentName)
        {
            List<User> userList = new List<User>();
            Department department = new Department();
            department.Name = departmentName; // 传参，减少内部的new Department 操作  

            DataSet dataset = DepartmentDao.GetInstance().findUserListByDepartmentId(departmentId);
            if ((dataset != null) && (dataset.Tables[0].Rows.Count > 0))
            {
                for (int i = 0; i < dataset.Tables[0].Rows.Count; i++)
                {
                    User user = new User();
                    user.Name = dataset.Tables[0].Rows[i]["name"].ToString().Trim();
                    user.Id = Convert.ToInt32(dataset.Tables[0].Rows[i]["id"].ToString());
                    user.Department = department;
                    
                    if( Convert.ToInt32(dataset.Tables[0].Rows[i]["id"].ToString()) == 1) // 1 -- 男  2--女
                    {
                        user.Sex = "男";
                    }
                    else
                    {
                        user.Sex = "女";
                    }
                    user.Telephone = dataset.Tables[0].Rows[i]["telephone"].ToString().Trim();
                    user.Remarks = dataset.Tables[0].Rows[i]["remarks"].ToString().Trim();
                    userList.Add(user);

                }
            }
            return userList;
        }
    }
}