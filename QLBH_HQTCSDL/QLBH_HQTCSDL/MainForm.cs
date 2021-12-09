using QLBH_HQTCSDL.DAO;
using QLBH_HQTCSDL.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Drawing;
//using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Button = System.Windows.Forms.Button;

namespace QLBH_HQTCSDL
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();

            loadTable();
            loadCate();
            //loadFood() ;
        }


        #region METHOD

        void loadTable()
        {
            List<TableDTO> tablelist = LoadTableDAO.Instance.loadListTable();
            foreach (TableDTO item in tablelist)
            {
                Button btn = new Button() { Width = LoadTableDAO.width, Height = LoadTableDAO.heigh };

                btn.Text = item.Ban + Environment.NewLine + item.Mhd;

                btn.Click += Btn_Click;
                btn.Tag = item;

               
                    btn.BackColor = Color.Cyan;
                
                    
                fllayoutpanelTable.Controls.Add(btn);
            }
        }

        void showBill(string Ban)
        {
            listView1.Items.Clear();
            float tongtien = 0;
            //List<BillDetailDTO> billDetailDTOs = BillDetailDAO.Instance.GetlistBillDetail(BillDAO.Instance.UncheckBillByTableId(id));
            List<BillCheckOutDTO> billCheckOutDTOs = BillCheckOutDAO.Instance.GetlistBillCheckOut(Ban);
            foreach (BillCheckOutDTO item in billCheckOutDTOs)
            {

                ListViewItem lvitem = new ListViewItem(item.Tensp.ToString());
                lvitem.SubItems.Add(item.Sl.ToString());
                lvitem.SubItems.Add(item.Dongia.ToString());
                lvitem.SubItems.Add(item.Thanhtien.ToString());
                listView1.Items.Add(lvitem);
                tongtien += item.Thanhtien;
            }
            //CultureInfo culture = new CultureInfo("vi-VN");
            //tbtongtien.Text = tongtien.ToString("c, culture");
            tbtongtien.Text = tongtien.ToString("c");
        }

        void loadCate()
        {
            List<CategoryDTO> listcate = CategoryDAO.Instance.loadListCate();
            cbbtypefood.DataSource = listcate;
            cbbtypefood.DisplayMember = "TENLSP";
        }
        void loadFood(string mlsp)
        {
            List<FoodDTO> listfood = FoodDAO.Instance.loadListFood(mlsp);
            cbbfood.DataSource = listfood;
            cbbfood.DisplayMember = "TENSP";
        }


        #endregion

        #region EVENT

        private void Btn_Click(object sender, EventArgs e)
        {
            string tableID = ((sender as Button).Tag as TableDTO).Mhd;
            listView1.Tag = ((sender as Button)).Tag;
            showBill(tableID);
        }
        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void thôngTinCáNhânToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormAcount f = new FormAcount();
            //this.Hide();
            f.ShowDialog();
            //this.Show();
        }

        private void adminToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormAdmin f = new FormAdmin();
            f.ShowDialog();
        }


        private void fllayoutpanelTable_Paint(object sender, PaintEventArgs e)
        {

        }

        private void cbbtypefood_SelectedIndexChanged(object sender, EventArgs e)
        {
            string mlsp = "CA01";

            ComboBox cb = sender as ComboBox;

            if (cb.SelectedItem == null)
                return;
            CategoryDTO selected = cb.SelectedItem as CategoryDTO;
            mlsp = selected.Mlsp;
            loadFood(mlsp);
            
           
        }
        void loaddata()
        {
            
        }
        private void btnAddfood_Click(object sender, EventArgs e)
        {
           /* Table table = listView1.Tag as Table;

            BillDAO.Instance.insertBill(table.ID);
            BillDetailDAO.Instance.insertBillDetail(1, 1, 1);
           */
        }
        #endregion
    }
}
