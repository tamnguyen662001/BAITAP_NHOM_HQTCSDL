using QLBH_HQTCSDL.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DAO
{
    public class BillDAO
    {
        private static BillDAO instance;
        public static BillDAO Instance
        {
            get { if (instance == null) instance = new BillDAO(); return BillDAO.instance; }
            private set { BillDAO.instance = value; }
        }
        private BillDAO() { }

        /*public int UncheckBillByTableId(string id)
        {
            DataTable data = DataProvider.Instance.ExecuteQuery("SELECT * FROM HOADON WHERE IDBAN = "+ id + " AND TRANGTHAI = 0");

            if (data.Rows.Count > 0)
            {
                BillDTO bill = new BillDTO(data.Rows[0]);
                return bill.Mkh;
            }
            else
                return -1;

        }*/
        /*public void insertBill(string mhd)
        {
            DataProvider.Instance.ExecuteNonQuery("exec them_hoadon ...", new object[] { mhd });


        }*/
    }
}
