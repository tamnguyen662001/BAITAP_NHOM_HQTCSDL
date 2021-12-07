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
    }
}
