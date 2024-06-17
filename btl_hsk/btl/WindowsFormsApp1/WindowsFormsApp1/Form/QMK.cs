using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsApp1.Class;

namespace WindowsFormsApp1
{
    public partial class QMK : Form
    {
        public QMK()
        {
            InitializeComponent();
        }
        private void QMK_Load(object sender, EventArgs e)
        {

        }
        Modify modify = new Modify();
        private void btnLayMK_Click(object sender, EventArgs e)
        {
            string tentk = txtTenTaiKhoan.Text;
            if (tentk.Trim() == "")
            {
                MessageBox.Show("Hãy nhập tên tài khoản", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                string query = "SELECT * FROM tblLogin where sTenDangNhap = '" + tentk + "'";
                if (modify.TaiKhoans(query).Count != 0)// Khác 0 vì tài khoản đã tồn tại
                {
                    lbMatKhau.ForeColor = Color.Blue;
                    lbMatKhau.Text = "Mật khẩu: " + modify.TaiKhoans(query)[0].MatKhau;

                }
                else
                {
                    lbMatKhau.ForeColor = Color.Red;
                    lbMatKhau.Text = "Tài khoản này chưa được đăng ký";
                }
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        
    }
}
