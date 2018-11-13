using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNangCaoNhom5.Models
{
    public class Product
    {
        public int masp { get; set; }
        public string tensp { get; set; }
        public decimal? dongia { get; set; }
        public int? soluong { get; set; }
        public int? maNSX { get; set; }
        public string tenNSX { get; set; }
    }
}