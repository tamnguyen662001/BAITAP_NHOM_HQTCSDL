using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DTO
{
    public class BillCheckOutDTO
    {

        public BillCheckOutDTO (string tensp, byte sl, float dongia, float thanhtien = 0)
        {
        
            this.Tensp = tensp;
            this.Sl = sl;
            this.Dongia = dongia;
            this.Thanhtien = thanhtien;
        }
        public BillCheckOutDTO(DataRow row)
        {
            this.Tensp = row["TÊN MÓN"].ToString();
            this.Sl = (byte)row["SL"];
            this.Dongia = (float)Convert.ToDouble(row["ĐƠN GIÁ"].ToString());
            this.Thanhtien = (float)Convert.ToDouble(row["THÀNH TIỀN"].ToString());
        }
        private float dongia;
        public float Dongia
        {
            get { return dongia; }
            set { dongia = value; }
        }
        private string tensp;
        
        private byte sl;
        private float thanhtien;
        public float Thanhtien
        {
            get { return thanhtien; }
            set { thanhtien = value; }
        }
        public byte Sl
        {
            get { return sl; }
            set { sl = value; }
        }
        public string Tensp
        {
            get { return tensp; }
            set { tensp = value; }
        }
    }

}