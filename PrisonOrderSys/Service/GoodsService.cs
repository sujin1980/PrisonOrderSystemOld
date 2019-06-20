using PrisonOrderSys.Dao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Service
{
    public class GoodsService
    {
        // 定义一个静态变量来保存类的实例
        private static GoodsService goodsService;

        // 定义一个标识确保线程同步
        private static readonly object locker = new object();


        // 定义私有构造函数，使外界不能创建该类实例
        private GoodsService()
        {
        }

        //定义公有方法提供一个全局访问点。
        public static GoodsService GetInstance()
        {
            //这里的lock其实使用的原理可以用一个词语来概括“互斥”这个概念也是操作系统的精髓
            //其实就是当一个进程进来访问的时候，其他进程便先挂起状态
            if (goodsService == null)//区别就在这里
            {
                lock (locker)
                {
                    // 如果类的实例不存在则创建，否则直接返回
                    if (goodsService == null)
                    {
                        goodsService = new GoodsService();
                    }
                }
            }
            return goodsService;
        }

        public DataSet findGoodsList()
        {
            return GoodsDao.GetInstance().findGoodsList();
        }

        public bool deleteGoodsList(string goodsList)
        {
            return GoodsDao.GetInstance().deleteGoodsList(goodsList);
        }

        public bool createGoods(string name, string number, string price, string picture, string remarks)
        {

            return GoodsDao.GetInstance().createGoods(name, number, price, picture, remarks) ;
        }

        public DataSet findGoodsById(string goodsId)
        {
            return GoodsDao.GetInstance().findGoodsById(goodsId);
        }
    }
}