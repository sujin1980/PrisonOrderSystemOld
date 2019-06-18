using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PrisonOrderSys.Models
{
    public class Prisoner
    {
        private int id;
        private string name;
        private string fingerPath;
        private string facePath;
        private string remarks;
        private Area area;

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

        public string FingerPath
        {
            get
            {
                return fingerPath;
            }

            set
            {
                fingerPath = value;
            }
        }

        public string FacePath
        {
            get
            {
                return facePath;
            }

            set
            {
                facePath = value;
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
    }
}