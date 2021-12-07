using QLBH_HQTCSDL.DAO;
using QLBH_HQTCSDL.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
//using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLBH_HQTCSDL
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();

            loadTable();        
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

                /*if (item.Trangthai == "Trống")
                    btn.BackColor = Color.Cyan;
                else
                    btn.BackColor = Color.LightGreen;*/
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

        #endregion

        #region EVENT

        private void Btn_Click(object sender, EventArgs e)
        {
            string tableID = ((sender as Button).Tag as TableDTO).Mhd;
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
        #endregion

        private void fllayoutpanelTable_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
