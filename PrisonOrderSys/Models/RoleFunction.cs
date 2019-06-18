using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Models
{
    public class RoleFunction
    {
        private Role role;
        private Function function;
        private string permission;
        private string remarks;

        public Role Role
        {
            get
            {
                return role;
            }

            set
            {
                role = value;
            }
        }

        public Function Function
        {
            get
            {
                return function;
            }

            set
            {
                function = value;
            }
        }

        public string Permission
        {
            get
            {
                return permission;
            }

            set
            {
                permission = value;
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