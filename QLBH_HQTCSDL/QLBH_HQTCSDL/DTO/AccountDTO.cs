using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DTO
{
    public class AccountDTO
    {
        public AccountDTO(DataRow row)
        {
            this.Mnv = row["MNV"].ToString();
            this.Tendn = row["TENDN"].ToString();
            this.Mk = row["MK"].ToString();
            this.Ngaysinh = (DateTime?)row["NGAYSINH"];
            this.Tennv = row["TENNV"].ToString();
            this.Sdt = row["SDT"].ToString();
            this.Chucvu = row["CHUCVU"].ToString();
            this.Diachi = row["DIACHI"].ToString();
            this.Gioitinh = row["GIOITINH"].ToString();
        }

        public AccountDTO()
        {
            this.Mnv = mnv;
            this.Tendn = tendn;
            this.Mk = mk;
            this.Ngaysinh = ngaysinh;
            this.Tennv = tennv;
            this.Sdt = sdt;
            this.Chucvu = chucvu;
            this.Diachi = diachi;
            this.Gioitinh = gioitinh;
        }

        private string mnv;

        public string Mnv
        {
            get { return mnv; }
            set { mnv = value; }
        }
        private string tennv;

        public string Tennv
        {
            get { return tennv; }
            set { tennv = value; }
        }

        private string tendn;

        public string Tendn
        {
            get { return tendn; }
            set { tendn = value; }
        }
        private string mk;
        public string Mk
        {
            get { return mk; }
            set { mk = value; }
        }

        private DateTime? ngaysinh;
        public DateTime? Ngaysinh
        {
            get { return ngaysinh; }
            set { ngaysinh = value; }
        }

        private string diachi;
        public string Diachi
        {
            get { return diachi; }
            set { diachi = value; }
        }

        private string sdt;

        public string Sdt
        {
            get { return sdt; }
            set { sdt = value; }
        }
        private string gioitinh;

        public string Gioitinh
        {
            get { return gioitinh; }
            set { gioitinh = value; }
        }
        private string chucvu;

        public string Chucvu
        {
            get { return chucvu ; }
            set { chucvu = value; }
        }
    }
}
