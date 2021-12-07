using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBH_HQTCSDL.DAO
{
    public class DataProvider
    {

        private static DataProvider instance;
        public static DataProvider Instance
        {
            get { if (instance == null) instance = new DataProvider();  return DataProvider.instance; }
            private set { DataProvider.instance = value; }
        }

        private DataProvider() { }

        //private string connectstring = @"Data Source=ADMIN\SQLEXPRESS;Initial Catalog = QUANLIBANHANG; Integrated Security = True";

        private string connectstring = @"Data Source = ADMIN\SQLEXPRESS; Initial Catalog = TEST_BTN_1811; Integrated Security = True";


        public DataTable ExecuteQuery (string query, object[] parameter = null)
        {
            DataTable data = new DataTable();

            using (SqlConnection connect = new SqlConnection(connectstring))
            {
                connect.Open();

                SqlCommand command = new SqlCommand(query, connect);

                if(parameter != null)
                {
                    string[] listpara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listpara)
                    {
                        if (item.Contains("@"))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                SqlDataAdapter adapter = new SqlDataAdapter(command);

                adapter.Fill(data);

                connect.Close();
            }
            
            return data;
        }

        //------------------- trả về số dòng cập nhật xóa sửa
        public int ExecuteNonQuery(string query, object[] parameter = null)
        {
            int data = 0;

            using (SqlConnection connect = new SqlConnection(connectstring))
            {
                connect.Open();

                SqlCommand command = new SqlCommand(query, connect);

                if (parameter != null)
                {
                    string[] listpara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listpara)
                    {
                        if (item.Contains("@"))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteNonQuery();
               

                connect.Close();
            }

            return data;
        }



        //------------------- trả về dòng đầu tiên trong dataset <-> seclect count *
        public object ExecuteScalar(string query, object[] parameter = null)
        {
            Object data = 0;

            using (SqlConnection connect = new SqlConnection(connectstring))
            {
                connect.Open();

                SqlCommand command = new SqlCommand(query, connect);

                if (parameter != null)
                {
                    string[] listpara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listpara)
                    {
                        if (item.Contains("@"))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteScalar();


                connect.Close();
            }

            return data;
        }
    }
}
