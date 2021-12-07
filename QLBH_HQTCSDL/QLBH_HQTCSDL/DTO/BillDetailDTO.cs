using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DTO
{
    public class BillDetailDTO
    {

        public BillDetailDTO(int sl, string mhd, string msp)
        {
            this.Sl = sl;
            this.Mhd = mhd;
            this.Msp = msp;
           
        }

        public BillDetailDTO(DataRow row)
        {
            this.Sl = (int)row["SL"];
            this.Mhd = row["MHD"].ToString();
            this.Msp = row["MSP"].ToString();
        }
        private string mhd;
     
        private string msp;
        private int sl;

        public string Mhd
        {
            get { return mhd; }
            set { mhd = value; }
        }
      
        public int Sl
        {
            get { return sl; }
            set { sl = value; }
        }
        public string Msp
        {
            get { return msp; }
            set { msp = value; }
        }
    }
}
