using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Models
{
    public class LogInfo
    {
        private int id;
        private int userId;
        private string userName;
        private string logAction;
        private string logTime;
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

        public int UserId
        {
            get
            {
                return userId;
            }

            set
            {
                userId = value;
            }
        }

        public string UserName
        {
            get
            {
                return userName;
            }

            set
            {
                userName = value;
            }
        }

        public string LogAction
        {
            get
            {
                return logAction;
            }

            set
            {
                logAction = value;
            }
        }

        public string LogTime
        {
            get
            {
                return logTime;
            }

            set
            {
                logTime = value;
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