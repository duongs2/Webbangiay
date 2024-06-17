
namespace WindowsFormsApp1
{
    partial class QMK
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
            this.lbQMK = new System.Windows.Forms.Label();
            this.lbTenTaiKhoan = new System.Windows.Forms.Label();
            this.lbMatKhau = new System.Windows.Forms.Label();
            this.btnLayMK = new System.Windows.Forms.Button();
            this.btnClose = new System.Windows.Forms.Button();
            this.txtTenTaiKhoan = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // lbQMK
            // 
            this.lbQMK.AutoSize = true;
            this.lbQMK.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbQMK.Location = new System.Drawing.Point(278, 68);
            this.lbQMK.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbQMK.Name = "lbQMK";
            this.lbQMK.Size = new System.Drawing.Size(211, 29);
            this.lbQMK.TabIndex = 7;
            this.lbQMK.Text = "QUÊN MẬT KHẨU";
            // 
            // lbTenTaiKhoan
            // 
            this.lbTenTaiKhoan.AutoSize = true;
            this.lbTenTaiKhoan.Location = new System.Drawing.Point(133, 132);
            this.lbTenTaiKhoan.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbTenTaiKhoan.Name = "lbTenTaiKhoan";
            this.lbTenTaiKhoan.Size = new System.Drawing.Size(102, 17);
            this.lbTenTaiKhoan.TabIndex = 8;
            this.lbTenTaiKhoan.Text = "Tên Tài Khoản";
            // 
            // lbMatKhau
            // 
            this.lbMatKhau.AutoSize = true;
            this.lbMatKhau.Location = new System.Drawing.Point(133, 212);
            this.lbMatKhau.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbMatKhau.Name = "lbMatKhau";
            this.lbMatKhau.Size = new System.Drawing.Size(70, 17);
            this.lbMatKhau.TabIndex = 9;
            this.lbMatKhau.Text = "Mật khẩu:";
            // 
            // btnLayMK
            // 
            this.btnLayMK.Location = new System.Drawing.Point(187, 325);
            this.btnLayMK.Margin = new System.Windows.Forms.Padding(4);
            this.btnLayMK.Name = "btnLayMK";
            this.btnLayMK.Size = new System.Drawing.Size(165, 28);
            this.btnLayMK.TabIndex = 10;
            this.btnLayMK.Text = "Lấy mật khẩu";
            this.btnLayMK.UseVisualStyleBackColor = true;
            this.btnLayMK.Click += new System.EventHandler(this.btnLayMK_Click);
            // 
            // btnClose
            // 
            this.btnClose.Location = new System.Drawing.Point(458, 325);
            this.btnClose.Margin = new System.Windows.Forms.Padding(4);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(100, 28);
            this.btnClose.TabIndex = 11;
            this.btnClose.Text = "Thoát";
            this.btnClose.UseVisualStyleBackColor = true;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // txtTenTaiKhoan
            // 
            this.txtTenTaiKhoan.Location = new System.Drawing.Point(320, 132);
            this.txtTenTaiKhoan.Margin = new System.Windows.Forms.Padding(4);
            this.txtTenTaiKhoan.Name = "txtTenTaiKhoan";
            this.txtTenTaiKhoan.Size = new System.Drawing.Size(217, 22);
            this.txtTenTaiKhoan.TabIndex = 12;
            // 
            // QMK
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.txtTenTaiKhoan);
            this.Controls.Add(this.btnClose);
            this.Controls.Add(this.btnLayMK);
            this.Controls.Add(this.lbMatKhau);
            this.Controls.Add(this.lbTenTaiKhoan);
            this.Controls.Add(this.lbQMK);
            this.Name = "QMK";
            this.Text = "Form2";
            this.Load += new System.EventHandler(this.QMK_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbQMK;
        private System.Windows.Forms.Label lbTenTaiKhoan;
        private System.Windows.Forms.Label lbMatKhau;
        private System.Windows.Forms.Button btnLayMK;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.TextBox txtTenTaiKhoan;
    }
}