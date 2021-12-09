using QLBH_HQTCSDL.DAO;
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
    public partial class fLogin : Form
    {
        public fLogin()
        {
            InitializeComponent();
        }

        public class tendn
        {
            static public string tk;
        }
       
        private void btnLogin_Click(object sender, EventArgs e)
        {
            //MessageBox.Show("Không tồn tại tài khoản !");

             tendn.tk = tbtdn.Text;
            string mk = tbmk.Text;
            
            if(Login(tendn.tk,mk))
            {
                MainForm f = new MainForm();
                this.Hide();
                f.ShowDialog();
                this.Show();
            }
            else
            {
                MessageBox.Show("Không tồn tại tài khoản !");
            }
        }


        bool Login(string tk,string mk)
        {
            return AccountDAO.Instance.Login(tk, mk);
        }
        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void fLogin_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Bạn có chắc muốn thoát ? ","Thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            {
                e.Cancel = true;
            }    
        }
    }
}
