using QLBH_HQTCSDL.DAO;
using QLBH_HQTCSDL.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLBH_HQTCSDL
{
    public partial class FormAcount : Form
    {
        public FormAcount()
        {
            InitializeComponent();
            taikhoan();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnExit2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        public void taikhoan()
        {

            string id = fLogin.tendn.tk;
            AccountDTO account = AccountDAO.Instance.loadAccount2(id);
            tbtdn2.Text = account.Tendn;
            tbmk2.Text = account.Mk;
            tbtngdung.Text = account.Tennv;
        }

        void ResetPass()
        {
            string tendn = tbtdn2.Text;
            string mkm = tbxacnhanmk.Text;
            if(mkm == "")
            {
                MessageBox.Show("Chưa nhập mật khẩu !");
                return;
            }    

            if (AccountDAO.Instance.resetPass(tendn, mkm))
            {
                MessageBox.Show("Đã đặt lại mật khẩu");
                taikhoan();
            }
            else
            {
                MessageBox.Show("Không thành công");
            }
        }
        private void btnCapnhat_Click(object sender, EventArgs e)
        {

            ResetPass();
        }
    }
}
