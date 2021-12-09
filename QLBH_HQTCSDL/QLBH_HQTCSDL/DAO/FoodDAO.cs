using QLBH_HQTCSDL.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DAO
{
    public class FoodDAO
    {
        
        private static FoodDAO instance;

        public static FoodDAO Instance
        {
            get { if (instance == null) instance = new FoodDAO(); return FoodDAO.instance; }
            private set { FoodDAO.instance = value; }
        }
        private FoodDAO() { }

        public List<FoodDTO> loadListFood(string mlsp)
        {
            List<FoodDTO> listfood = new List<FoodDTO>();

           
            string query = "exec sp "+ mlsp;
            
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                FoodDTO table = new FoodDTO(item);
                listfood.Add(table);
            }

            return listfood;
        }

        public List<FoodDTO> loadListFood2()
        {
            List<FoodDTO> listfood = new List<FoodDTO>();


            string query = "select * from san_pham";
            //string query = "select MSP as N'Mã SP' ,TENSP as N'Món', SOLUONG as N'SL', DVT as N'Đơn vị tính'  from SAN_PHAM";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                FoodDTO table = new FoodDTO(item);
                listfood.Add(table);
            }

            return listfood;
        }

        public bool insertFood(string msp, string tensp, int sl, float dongia, string dvt, string mlsp, string anhsp)
        {
            string query = string.Format("exec insertfood '{0}', N'{1}', {2}, {3}, N'{4}','{5}','{6}','{7}'", msp, tensp, sl, dongia, dvt, mlsp, anhsp, "nl07");

            int kq = DataProvider.Instance.ExecuteNonQuery(query); 
            return kq > 0;
        }
        public bool updateFood(string msp, string tensp,int sl, float dongia, string dvt, string mlsp, string anhsp)
        {
            string query = string.Format("update SAN_PHAM set DONGIA = '{0}', SOLUONG = '{1}' where MSP = '{2}'", dongia,sl,msp);
            int kq = DataProvider.Instance.ExecuteNonQuery(query);
            return kq > 0;
        }
        //public deleteFood()
        //{

        //}
    }
}
