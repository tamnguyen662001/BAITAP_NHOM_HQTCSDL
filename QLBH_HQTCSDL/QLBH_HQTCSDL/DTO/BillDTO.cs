using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DTO
{
    public class BillDTO
    {
        public BillDTO(string mhd, string ban, string mkh, DateTime ngaytao, string mnv)
        {
            this.Mhd = mhd;
            this.Ban = ban;
            this.Mkh = mkh;
            this.Ngaytao = ngaytao;
            this.Mnv = mnv;
        }

        public BillDTO(DataRow row)
        {
            this.Mhd = row["MHD"].ToString();
            this.Ban = row["BAN"].ToString();
            this.Mkh = row["MKH"].ToString();
            this.Ngaytao = (DateTime?)row["NGAYTAO"];
            this.Mnv = row["MNV"].ToString();
        }

        private string mhd;

        public string Mhd
        {
            get { return mhd; }
            set { mhd = value; }
        }
        private string ban;

        public string Ban
        {
            get { return ban; }
            set { ban = value; }
        }

        private string mkh;
        public string Mkh
        {
            get { return mkh; }
            set { mkh = value; }
        }

        private DateTime? ngaytao;
        public DateTime? Ngaytao
        {
            get { return ngaytao; }
            set { ngaytao = value; }
        }

        private string mnv;
        public string Mnv
        {
            get { return mnv; }
            set { mnv = value; }
        }
    }
}
