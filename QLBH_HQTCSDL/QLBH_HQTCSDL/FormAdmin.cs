using QLBH_HQTCSDL.DAO;
using QLBH_HQTCSDL.DTO;
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
        BindingSource foodList = new BindingSource();
        BindingSource AccountList = new BindingSource();
        public FormAdmin()
        {
            InitializeComponent();
            loaddata();
            show();

        }

        void show()
        {
            dgvMonan.DataSource = foodList;
            dvgTaikhoan.DataSource = AccountList;
            showFood();
            foodBinding();
            accountBindig();
            showCategory(cbbdanhmuc);
            showAccount();
        }

        void loaddata()
        {
            string query = "EXEC DSTK @TENDN";
            dvgTaikhoan.DataSource = DataProvider.Instance.ExecuteQuery(query,new object[] { "quanli"});
        }
       
        void showCategory(ComboBox cb)
        {
            cbbdanhmuc.DataSource = CategoryDAO.Instance.loadListCate();
            cbbdanhmuc.DisplayMember = "TENLSP";
        }
        void foodBinding()
        {
            tbtenmon.DataBindings.Add(new Binding("Text", dgvMonan.DataSource, "Tensp", true,DataSourceUpdateMode.Never));
            tbmsp.DataBindings.Add(new Binding("Text", dgvMonan.DataSource, "MSP", true, DataSourceUpdateMode.Never));
            numgia.DataBindings.Add(new Binding("Value", dgvMonan.DataSource, "DONGIA", true, DataSourceUpdateMode.Never));
            numsl.DataBindings.Add(new Binding("Value", dgvMonan.DataSource, "SOLUONG", true, DataSourceUpdateMode.Never));
        }
        void showFood()
        {
            foodList.DataSource = FoodDAO.Instance.loadListFood2();
        }
        private void btnXem_Click(object sender, EventArgs e)
        {
            showFood();
        }

        private void tbmsp_TextChanged(object sender, EventArgs e)
        {
            if(dgvMonan.SelectedCells.Count > 0)
            {
                string id = dgvMonan.SelectedCells[0].OwningRow.Cells["MLSP"].Value.ToString();
                CategoryDTO cate = CategoryDAO.Instance.loadCate2(id);
                cbbdanhmuc.SelectedItem = cate;

                int index = -1;
                int i = 0;
                foreach (CategoryDTO item in cbbdanhmuc.Items)
                {
                    if (item.Mlsp == cate.Mlsp)
                    {
                        index = i;
                        break;

                    }
                    i++;
                   
                }
                cbbdanhmuc.SelectedIndex = index;
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string msp = tbmsp.Text;
            string tensp = tbtenmon.Text;
            float dongia =(float) numgia.Value;
            int sl = 10;
            string mlsp = (cbbdanhmuc.SelectedItem as CategoryDTO).Mlsp;
            string anhsp = "#";
            string dvt = "#";

            if(FoodDAO.Instance.insertFood(msp,tensp,sl,dongia,dvt,mlsp,anhsp))
            {
                MessageBox.Show("Đã thêm thành công");
                showFood();
            }
            else
            {
                MessageBox.Show("Thêm không thành công");
            }    
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            string msp = tbmsp.Text;
            string tensp = tbtenmon.Text;
            float dongia = (float)numgia.Value;
            string mlsp = (cbbdanhmuc.SelectedItem as CategoryDTO).Mlsp;
            int sl = (int)numsl.Value;
            string anhsp = "#";
            string dvt = "#";

            if (FoodDAO.Instance.updateFood(msp, tensp,sl, dongia, dvt, mlsp, anhsp))
            {
                MessageBox.Show("Đã sửa thành công");
                showFood();
            }
            else
            {
                MessageBox.Show("Sửa không thành công");
            }
        }
        void accountBindig()
        {
            tbchucvu.DataBindings.Add(new Binding("Text", dvgTaikhoan.DataSource, "CHUCVU", true, DataSourceUpdateMode.Never));
            tbtennv.DataBindings.Add(new Binding("Text", dvgTaikhoan.DataSource, "TENNV", true, DataSourceUpdateMode.Never));
            tbtendangnhap.DataBindings.Add(new Binding("Text", dvgTaikhoan.DataSource, "TENDN", true, DataSourceUpdateMode.Never));
            tbmnv.DataBindings.Add(new Binding("Text", dvgTaikhoan.DataSource, "MNV", true, DataSourceUpdateMode.Never));
            tbmk.DataBindings.Add(new Binding("Text", dvgTaikhoan.DataSource, "MK", true, DataSourceUpdateMode.Never));
            tbngaysinh.DataBindings.Add(new Binding("Text", dvgTaikhoan.DataSource, "NGAYSINH", true, DataSourceUpdateMode.Never));
            tbsdt.DataBindings.Add(new Binding("Text", dvgTaikhoan.DataSource, "SDT", true, DataSourceUpdateMode.Never));
            tbdiachi.DataBindings.Add(new Binding("Text", dvgTaikhoan.DataSource, "DIACHI", true, DataSourceUpdateMode.Never));
            tbgioitinh.DataBindings.Add(new Binding("Text", dvgTaikhoan.DataSource, "GIOITINH", true, DataSourceUpdateMode.Never));


        }
        void showAccount()
        {
            AccountList.DataSource = AccountDAO.Instance.loadListAccount();
        }
        private void xem_Click(object sender, EventArgs e)
        {
            showAccount();
        }

        private void them_Click(object sender, EventArgs e)
        {
            string tendn = tbtendangnhap.Text;
            string tennv = tbtennv.Text;
      
            string chucvu = tbchucvu.Text;
            string mk = tbmk.Text;
            string diachi = tbdiachi.Text;
            string sdt = tbsdt.Text;
            string ns = tbngaysinh.Text;
            DateTime ngaysinh = DateTime.Parse(ns);
            string gioitinh = tbgioitinh.Text;
            string mnv = tbmnv.Text;

            if (AccountDAO.Instance.insertAccount(mnv, tennv, diachi, gioitinh, ngaysinh, sdt, chucvu, tendn, mk))
            {
                MessageBox.Show("Đã thêm thành công");
                showAccount();
            }
            else
            {
                MessageBox.Show("Thêm không thành công");
            }
        }

        private void sua_Click(object sender, EventArgs e)
        {
            string tendn = tbtendangnhap.Text;
            string tennv = tbtennv.Text;

            string chucvu = tbchucvu.Text;
            string mk = tbmk.Text;
            string diachi = tbdiachi.Text;
            string sdt = tbsdt.Text;
            string ns = tbngaysinh.Text;
            DateTime ngaysinh = DateTime.Parse(ns);
            string gioitinh = tbgioitinh.Text;
            string mnv = tbmnv.Text;
            if (AccountDAO.Instance.updateAccount(mnv, tennv, diachi, gioitinh, ngaysinh, sdt, chucvu, tendn, mk))
            {
                MessageBox.Show("Đã sửa thành công");
                showAccount();
            }
            else
            {
                MessageBox.Show("Sửa không thành công");
            }
        }

        private void xoa_Click(object sender, EventArgs e)
        {
            string mnv = tbmnv.Text;
            string tendn = tbtendangnhap.Text;
            if(fLogin.tendn.tk.Equals(tendn))
            {
                MessageBox.Show("Đây là khoản đang đăng nhập !");
                return;
            }    
            if (AccountDAO.Instance.deleteAccount(mnv))
            {
                MessageBox.Show("Đã xoá thành công");
                showAccount();
            }
            else
            {
                MessageBox.Show("Xoá không thành công");
            }
        }
    }
}
