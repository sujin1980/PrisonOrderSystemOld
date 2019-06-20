using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Models
{
    public class Prison
    {
        private int id;
        private string name;
        private string remarks;
        private List<Department> departmentList;

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

        public List<Department> DepartmentList
        {
            get
            {
                return departmentList;
            }

            set
            {
                departmentList = value;
            }
        }
    }
}