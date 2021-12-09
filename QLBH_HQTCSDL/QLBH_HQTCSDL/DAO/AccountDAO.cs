using QLBH_HQTCSDL.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DAO
{
    public class AccountDAO
    {
        private static AccountDAO instance;

        public static AccountDAO Instance 
        {
            get { if (instance == null) instance = new AccountDAO(); return instance; }
            private set { instance = value; }
        }

        private AccountDAO() { }

        public bool Login(string tk, string mk)
        {
            //string query = "SELECT* FROM TAIKHOAN WHERE TK = N'"+ tk +"' AND MK = '"+ mk +"' ";
            string query = "EXEC LOGIN @TK , @MK";
            DataTable result = DataProvider.Instance.ExecuteQuery(query, new object[]{tk, mk });
            return result.Rows.Count > 0;
        }

        public AccountDTO loadAccount2(string tendn)
        {
            AccountDTO account = null;

            string query = "EXEC DSTK "+ tendn;

            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                account = new AccountDTO(item);

                return account;

            }
            return account;
        }


        public DataTable loadListAccount()
        {
            string query = "select * from NHAN_VIEN";
            return DataProvider.Instance.ExecuteQuery(query);

        }


        public bool insertAccount(string mnv, string tennv, string diachi , string gioitinh, DateTime ngaysinh, string sdt, string chucvu, string tendn,string mk)
        {
            string query = string.Format("INSERT NHAN_VIEN VALUES('{0}',N'{1}',N'{2}',N'{3}','{4}','{5}',N'{6}','{7}','{8}')", mnv,tennv,diachi,gioitinh,ngaysinh,sdt,chucvu,tendn,mk);

            int kq = DataProvider.Instance.ExecuteNonQuery(query);
            return kq > 0;
        }
        public bool updateAccount(string mnv, string tennv, string diachi, string gioitinh, DateTime ngaysinh, string sdt, string chucvu, string tendn, string mk)
        {
            string query = string.Format("update NHAN_VIEN set TENDN = '{0}',TENNV = N'{1}',NGAYSINH = '{2}', SDT = '{3}',GIOITINH = N'{4}',DIACHI = N'{5}', MK='{6}', CHUCVU = N'{7}' where MNV = '{8}'", tendn, tennv, ngaysinh, sdt, gioitinh, diachi,mk, chucvu, mnv);
            int kq = DataProvider.Instance.ExecuteNonQuery(query);
            return kq > 0;
        }
        public bool deleteAccount(string mnv)
        {
            string query = string.Format("delete from NHAN_VIEN where MNV = '{0}'",  mnv);
            int kq = DataProvider.Instance.ExecuteNonQuery(query);
            return kq > 0;
        }

        public bool resetPass(string tendn, string mkm)
        {
            string query = string.Format("update NHAN_VIEN set MK = '{0}' where TENDN = '{1}'", mkm,tendn);
            int kq = DataProvider.Instance.ExecuteNonQuery(query);
            return kq > 0;
        }
    }
}
