using QLBH_HQTCSDL.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLBH_HQTCSDL
{
    public partial class FormAdmin : Form
    {
        public FormAdmin()
        {
            InitializeComponent();
            loaddata();
        }

        

        void loaddata()
        {
            //string connectstring = @"Data Source = ADMIN\NGUYENLETHANHTAM; Initial Catalog = QUANLIBANHANG; Integrated Security = True";
            //string query = "select * from TAIKHOAN";
            //DataProvider provider = new DataProvider();

           // string connectstring = @"Data Source = ADMIN\SQLEXPRESS; Initial Catalog = TEST_BTN_1811; Integrated Security = True"

            string query = "EXEC DSTK @TENDN";
            dtgTaikhoan.DataSource = DataProvider.Instance.ExecuteQuery(query,new object[] { "QUẢN LÍ "});
        }

    }
}
