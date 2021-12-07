using QLBH_HQTCSDL.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DAO
{
    public class BillCheckOutDAO
    {
        private static BillCheckOutDAO instance;
        public static BillCheckOutDAO Instance
        {
            get { if (instance == null) instance = new BillCheckOutDAO(); return BillCheckOutDAO.instance; }
            private set { BillCheckOutDAO.instance = value; }
        }
        private BillCheckOutDAO() { }

        public List<BillCheckOutDTO> GetlistBillCheckOut(string id)
        {
            List<BillCheckOutDTO> listBillCheckOut = new List<BillCheckOutDTO>();

            DataTable data = DataProvider.Instance.ExecuteQuery("EXEC BILL "+id);
            //string query = "SELECT C.IDHOADON ,A.TENBAN , D.TENSP ,C.SL ,SUM(C.SL*D.DONGIA) AS N'TONGTIEN'  FROM BAN A, HOADON B, CHITIETHOADON C, SANPHAM D WHERE A.ID = B.IDBAN AND B.ID = C.IDHOADON AND C.IDSP = "+id+" AND B.TRANGTHAI = 0 AND A.TRANGTHAI = 'Có khách'GROUP BY A.TENBAN, C.IDHOADON,C.SL , D.TENSP ORDER BY C.IDHOADON";

            //DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                BillCheckOutDTO billCheckOut = new BillCheckOutDTO(item);

                listBillCheckOut.Add(billCheckOut);

            }
            return listBillCheckOut;
        }
    }
}
