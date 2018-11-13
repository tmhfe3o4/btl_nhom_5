using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNangCaoNhom5.App_Start
{
    public static class PageList
    {
        public static int totalPage { get; set; }
        public static int maxPage = 4;
        public static int pageSize = 4;
        public static  int pageIndex { get; set; }
        public static int pageFirst = 1;
        
    }
}