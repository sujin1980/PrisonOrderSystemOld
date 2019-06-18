using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace PrisonOrderSys
{
    /// <summary>
    /// ImageUpload 的摘要说明
    /// </summary>
    public class ImageUpload : IHttpHandler
    {
        public string filpath = "";

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            //context.Response.Write("Hello World");
            //后台拿到上传来的图片（拿到名为imgFile的input标签的文件）
            var file = context.Request.Files["imgFile"];

            //后台也要对拿到的数据是否为图片进行校验（因为前台可以通过浏览器改代码，前台校验完了需要后台再拦截一下）
            var ext = Path.GetExtension(file.FileName);
            if (!(ext == ".jpeg" || ext == ".jpg" || ext == ".png" || ext == ".gif"))
            {
                context.Response.Write("shit,你传的不是图片");
                context.Response.End();
            }
            else
            {
                //上传的文件保存到目录(为了保证文件名不重复，加个Guid)
                filpath = "/Upload/" + Guid.NewGuid().ToString() + file.FileName;
                file.SaveAs(context.Request.MapPath(filpath));//必须得是相对路径

                //把图片显示到前端让用户看得到
                string str = string.Format("<html><head></head><body><img src='{0}'/></body></html>",
                    filpath);//必须得是绝对路径！！！！
               // context.Response.Write(str);  
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