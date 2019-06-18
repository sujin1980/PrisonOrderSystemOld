using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Models
{
    public class OrderInfo
    {
        private int id;
        private Prison prison;
        private Area area;
        private int status;
        private string createTime;
        private string updateTime;
        private string paymentTime;
        private string endTime;
        private int process; //审批流程

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public Prison Prison
        {
            get
            {
                return prison;
            }

            set
            {
                prison = value;
            }
        }

        public Area Area
        {
            get
            {
                return area;
            }

            set
            {
                area = value;
            }
        }

        public int Status
        {
            get
            {
                return status;
            }

            set
            {
                status = value;
            }
        }

        public string CreateTime
        {
            get
            {
                return createTime;
            }

            set
            {
                createTime = value;
            }
        }

        public string UpdateTime
        {
            get
            {
                return updateTime;
            }

            set
            {
                updateTime = value;
            }
        }

        public string PaymentTime
        {
            get
            {
                return paymentTime;
            }

            set
            {
                paymentTime = value;
            }
        }

        public string EndTime
        {
            get
            {
                return endTime;
            }

            set
            {
                endTime = value;
            }
        }

        public int Process
        {
            get
            {
                return process;
            }

            set
            {
                process = value;
            }
        }
    }
}