using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Models
{
    public class Goods
    {
        private int id;
        private string name;
        private GoodsType goodsType;
        private int number;
        private decimal price;
        private string picture;
        private int status;
        private string remarks;

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

        public string Name
        {
            get
            {
                return name;
            }

            set
            {
                name = value;
            }
        }

        public GoodsType GoodsType
        {
            get
            {
                return goodsType;
            }

            set
            {
                goodsType = value;
            }
        }

        public int Number
        {
            get
            {
                return number;
            }

            set
            {
                number = value;
            }
        }

        public decimal Price
        {
            get
            {
                return price;
            }

            set
            {
                price = value;
            }
        }

        public string Picture
        {
            get
            {
                return picture;
            }

            set
            {
                picture = value;
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