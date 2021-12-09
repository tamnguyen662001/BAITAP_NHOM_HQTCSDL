namespace QLBH_HQTCSDL
{
    partial class fLogin
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(fLogin));
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnLogin = new System.Windows.Forms.Button();
            this.panel3 = new System.Windows.Forms.Panel();
            this.tbmk = new System.Windows.Forms.TextBox();
            this.lmk = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.tbtdn = new System.Windows.Forms.TextBox();
            this.ltdn = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btnExit);
            this.panel1.Controls.Add(this.btnLogin);
            this.panel1.Controls.Add(this.panel3);
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Location = new System.Drawing.Point(12, -81);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(281, 345);
            this.panel1.TabIndex = 0;
            // 
            // btnExit
            // 
            this.btnExit.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnExit.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnExit.Location = new System.Drawing.Point(156, 306);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(91, 32);
            this.btnExit.TabIndex = 4;
            this.btnExit.Text = "Thoát";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // btnLogin
            // 
            this.btnLogin.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLogin.Location = new System.Drawing.Point(32, 306);
            this.btnLogin.Name = "btnLogin";
            this.btnLogin.Size = new System.Drawing.Size(91, 32);
            this.btnLogin.TabIndex = 3;
            this.btnLogin.Text = "Đăng Nhập";
            this.btnLogin.UseVisualStyleBackColor = true;
            this.btnLogin.Click += new System.EventHandler(this.btnLogin_Click);
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.tbmk);
            this.panel3.Controls.Add(this.lmk);
            this.panel3.Location = new System.Drawing.Point(20, 194);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(241, 94);
            this.panel3.TabIndex = 2;
            // 
            // tbmk
            // 
            this.tbmk.Location = new System.Drawing.Point(12, 51);
            this.tbmk.Name = "tbmk";
            this.tbmk.Size = new System.Drawing.Size(215, 20);
            this.tbmk.TabIndex = 1;
            this.tbmk.Text = "QUANLI";
            this.tbmk.UseSystemPasswordChar = true;
            // 
            // lmk
            // 
            this.lmk.AutoSize = true;
            this.lmk.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lmk.Location = new System.Drawing.Point(8, 11);
            this.lmk.Name = "lmk";
            this.lmk.Size = new System.Drawing.Size(82, 21);
            this.lmk.TabIndex = 0;
            this.lmk.Text = "Mật khẩu";
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.tbtdn);
            this.panel2.Controls.Add(this.ltdn);
            this.panel2.Location = new System.Drawing.Point(20, 94);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(241, 94);
            this.panel2.TabIndex = 0;
            // 
            // tbtdn
            // 
            this.tbtdn.Location = new System.Drawing.Point(12, 58);
            this.tbtdn.Name = "tbtdn";
            this.tbtdn.Size = new System.Drawing.Size(215, 20);
            this.tbtdn.TabIndex = 1;
            this.tbtdn.Text = "QUANLI";
            // 
            // ltdn
            // 
            this.ltdn.AutoSize = true;
            this.ltdn.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ltdn.Location = new System.Drawing.Point(8, 19);
            this.ltdn.Name = "ltdn";
            this.ltdn.Size = new System.Drawing.Size(123, 21);
            this.ltdn.TabIndex = 0;
            this.ltdn.Text = "Tên đăng nhập";
            // 
            // fLogin
            // 
            this.AcceptButton = this.btnLogin;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnExit;
            this.ClientSize = new System.Drawing.Size(305, 269);
            this.Controls.Add(this.panel1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "fLogin";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Đăng Nhập";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.fLogin_FormClosing);
            this.panel1.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.TextBox tbmk;
        private System.Windows.Forms.Label lmk;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.TextBox tbtdn;
        private System.Windows.Forms.Label ltdn;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnLogin;
    }
}

