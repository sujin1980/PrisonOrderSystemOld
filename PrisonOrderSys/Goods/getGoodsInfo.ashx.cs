using PrisonOrderSys.Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Goods
{
    /// <summary>
    /// getGoodsInfo 的摘要说明
    /// </summary>
    public class getGoodsInfo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json"; //指定返回数据格式为json
            string goodsId = context.Request.Form["goodsId"]; //读取post过来的数据

            DataSet dataset = GoodsService.GetInstance().findGoodsById(goodsId);
            if ((dataset != null) && (dataset.Tables[0].Rows.Count > 0))
            {
                context.Response.Write("ok");//向客户端返回数据
                context.Response.End();
            }
            
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}