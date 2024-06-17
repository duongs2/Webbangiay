
namespace WindowsFormsApp1
{
    partial class frmDangKy
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
            this.lbDangKy = new System.Windows.Forms.Label();
            this.lbTenDK = new System.Windows.Forms.Label();
            this.lbMatKhau = new System.Windows.Forms.Label();
            this.lbXNMatKhau = new System.Windows.Forms.Label();
            this.btnDangKy = new System.Windows.Forms.Button();
            this.btnTroVe = new System.Windows.Forms.Button();
            this.txtDangKy = new System.Windows.Forms.TextBox();
            this.txtMatKhau = new System.Windows.Forms.TextBox();
            this.txtXacNhanMK = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // lbDangKy
            // 
            this.lbDangKy.AutoSize = true;
            this.lbDangKy.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbDangKy.Location = new System.Drawing.Point(331, 57);
            this.lbDangKy.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbDangKy.Name = "lbDangKy";
            this.lbDangKy.Size = new System.Drawing.Size(103, 29);
            this.lbDangKy.TabIndex = 10;
            this.lbDangKy.Text = "Đăng Ký";
            // 
            // lbTenDK
            // 
            this.lbTenDK.AutoSize = true;
            this.lbTenDK.Location = new System.Drawing.Point(183, 147);
            this.lbTenDK.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbTenDK.Name = "lbTenDK";
            this.lbTenDK.Size = new System.Drawing.Size(109, 17);
            this.lbTenDK.TabIndex = 11;
            this.lbTenDK.Text = "Tên Đăng Nhập";
            // 
            // lbMatKhau
            // 
            this.lbMatKhau.AutoSize = true;
            this.lbMatKhau.Location = new System.Drawing.Point(183, 217);
            this.lbMatKhau.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbMatKhau.Name = "lbMatKhau";
            this.lbMatKhau.Size = new System.Drawing.Size(66, 17);
            this.lbMatKhau.TabIndex = 12;
            this.lbMatKhau.Text = "Mật khẩu";
            // 
            // lbXNMatKhau
            // 
            this.lbXNMatKhau.AutoSize = true;
            this.lbXNMatKhau.Location = new System.Drawing.Point(183, 285);
            this.lbXNMatKhau.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbXNMatKhau.Name = "lbXNMatKhau";
            this.lbXNMatKhau.Size = new System.Drawing.Size(130, 17);
            this.lbXNMatKhau.TabIndex = 13;
            this.lbXNMatKhau.Text = "Xác nhận mật khẩu";
            // 
            // btnDangKy
            // 
            this.btnDangKy.Location = new System.Drawing.Point(213, 364);
            this.btnDangKy.Margin = new System.Windows.Forms.Padding(4);
            this.btnDangKy.Name = "btnDangKy";
            this.btnDangKy.Size = new System.Drawing.Size(100, 28);
            this.btnDangKy.TabIndex = 17;
            this.btnDangKy.Text = "Đăng Ký";
            this.btnDangKy.UseVisualStyleBackColor = true;
            this.btnDangKy.Click += new System.EventHandler(this.btnDangKy_Click);
            // 
            // btnTroVe
            // 
            this.btnTroVe.Location = new System.Drawing.Point(461, 364);
            this.btnTroVe.Margin = new System.Windows.Forms.Padding(4);
            this.btnTroVe.Name = "btnTroVe";
            this.btnTroVe.Size = new System.Drawing.Size(99, 28);
            this.btnTroVe.TabIndex = 18;
            this.btnTroVe.Text = "Trở về";
            this.btnTroVe.UseVisualStyleBackColor = true;
            this.btnTroVe.Click += new System.EventHandler(this.btnTroVe_Click);
            // 
            // txtDangKy
            // 
            this.txtDangKy.Location = new System.Drawing.Point(336, 147);
            this.txtDangKy.Margin = new System.Windows.Forms.Padding(4);
            this.txtDangKy.Name = "txtDangKy";
            this.txtDangKy.Size = new System.Drawing.Size(245, 22);
            this.txtDangKy.TabIndex = 19;
            // 
            // txtMatKhau
            // 
            this.txtMatKhau.Location = new System.Drawing.Point(336, 217);
            this.txtMatKhau.Margin = new System.Windows.Forms.Padding(4);
            this.txtMatKhau.Name = "txtMatKhau";
            this.txtMatKhau.Size = new System.Drawing.Size(245, 22);
            this.txtMatKhau.TabIndex = 20;
            // 
            // txtXacNhanMK
            // 
            this.txtXacNhanMK.Location = new System.Drawing.Point(336, 280);
            this.txtXacNhanMK.Margin = new System.Windows.Forms.Padding(4);
            this.txtXacNhanMK.Name = "txtXacNhanMK";
            this.txtXacNhanMK.Size = new System.Drawing.Size(245, 22);
            this.txtXacNhanMK.TabIndex = 21;
            // 
            // frmDangKy
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.txtXacNhanMK);
            this.Controls.Add(this.txtMatKhau);
            this.Controls.Add(this.txtDangKy);
            this.Controls.Add(this.btnTroVe);
            this.Controls.Add(this.btnDangKy);
            this.Controls.Add(this.lbXNMatKhau);
            this.Controls.Add(this.lbMatKhau);
            this.Controls.Add(this.lbTenDK);
            this.Controls.Add(this.lbDangKy);
            this.Name = "frmDangKy";
            this.Text = "Đăng Ký";
            this.Load += new System.EventHandler(this.frmDangKy_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbDangKy;
        private System.Windows.Forms.Label lbTenDK;
        private System.Windows.Forms.Label lbMatKhau;
        private System.Windows.Forms.Label lbXNMatKhau;
        private System.Windows.Forms.Button btnDangKy;
        private System.Windows.Forms.Button btnTroVe;
        private System.Windows.Forms.TextBox txtDangKy;
        private System.Windows.Forms.TextBox txtMatKhau;
        private System.Windows.Forms.TextBox txtXacNhanMK;
    }
}