using QLBH_HQTCSDL.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DAO
{
     public class BillDetailDAO
    {
        private static BillDetailDAO instance;
        public static BillDetailDAO Instance
        {
            get { if (instance == null) instance = new BillDetailDAO(); return BillDetailDAO.instance; }
            private set { BillDetailDAO.instance = value; }
        }
        private BillDetailDAO() { }

        public List<BillDetailDTO> GetlistBillDetail(string id)
        {
            List<BillDetailDTO> listBillDetail = new List<BillDetailDTO>();

            //DataTable data = DataProvider.Instance.ExecuteQuery("SELECT * FROM CHITIETHOADON WHERE IDHOADON = " + id);
            DataTable data = DataProvider.Instance.ExecuteQuery("EXEC BILL "+id);

            foreach (DataRow item in data.Rows)
            {
                BillDetailDTO billDetail = new BillDetailDTO(item);

                listBillDetail.Add(billDetail);
                
            }
            return listBillDetail;
        }


    }
}
