using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DTO
{
    public class FoodDTO
    {
        public FoodDTO(DataRow row)
        {
            this.Msp = row["MSP"].ToString();
            this.Tensp = row["TENSP"].ToString();
            this.Soluong = (Int16)row["SOLUONG"];
            this.Dongia = (float)Convert.ToDouble(row["DONGIA"].ToString());
            this.Dvt = row["DVT"].ToString();
            this.Mlsp = row["MLSP"].ToString();
            this.Anhsp = row["ANHSP"].ToString();
        }


        public FoodDTO(string msp, string tensp, int soluong, float dongia, string dvt, string mlsp,string anhsp)
        {
            this.Msp = msp;
            this.Tensp = tensp;
            this.Soluong = soluong;
            this.Dongia = dongia;
            this.Dvt = dvt;
            this.Mlsp = mlsp;
            this.Anhsp = anhsp;

        }

        private string msp;

        public string Msp
        {
            get { return msp; }
            set { msp = value; }
        }

        private string tensp;

        public string Tensp
        {
            get { return tensp; }
            set { tensp = value; }
        }
        private int soluong;

        public int Soluong
        {
            get { return soluong; }
            set { soluong = value; }
        }
        private float dongia;

        public float Dongia
        {
            get { return dongia; }
            set { dongia = value; }
        }
        private string dvt;

        public string Dvt
        {
            get { return dvt; }
            set { dvt = value; }
        }
        private string mlsp;

        public string Mlsp
        {
            get { return mlsp; }
            set { mlsp = value; }
        }
        private string anhsp;

        public string Anhsp
        {
            get { return anhsp; }
            set { anhsp = value; }
        }
    }
}
