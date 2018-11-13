using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNangCaoNhom5.Models
{
    public class ItemCart
    {
        public SanPham SP { get; set; }
        public int soLuong { get; set; }
        public decimal TongTien { get; set; }
    }
}