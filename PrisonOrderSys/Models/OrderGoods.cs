using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Models
{
    public class OrderGoods
    {
        private int orderId;
        private List<Goods> goodsList;
        private decimal totalFee;
        private string remarks;

        public int OrderId
        {
            get
            {
                return orderId;
            }

            set
            {
                orderId = value;
            }
        }

        public List<Goods> GoodsList
        {
            get
            {
                return goodsList;
            }

            set
            {
                goodsList = value;
            }
        }

        public decimal TotalFee
        {
            get
            {
                return totalFee;
            }

            set
            {
                totalFee = value;
            }
        }

        public string Remarks
        {
            get
            {
                return remarks;
            }

            set
            {
                remarks = value;
            }
        }
    }
}