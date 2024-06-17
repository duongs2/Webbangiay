using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsApp1.Class;

namespace WindowsFormsApp1
{
    public partial class frmDangNhap : Form
    {
        public frmDangNhap()
        {
            InitializeComponent();
        }
        public bool checkAccount(string ac)//Check mật khẩu và tên tài khoản
        {
            return Regex.IsMatch(ac, "^([a-zA-Z0-9])$");
        }
        private void frmDangNhap_Load(object sender, EventArgs e)
        {

        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            string tentk = txtTenDangNhap.Text;
            string matkhau = txtMatKhau.Text;
            if (tentk.Trim() == "")
            {
                MessageBox.Show("Hãy nhập tên đăng nhập!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else if (matkhau.Trim() == "")
            {
                MessageBox.Show("Hãy nhập mật khẩu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            //else if (txtMatKhau.Text.Trim().Length < 6)
            //{

            //    MessageBox.Show("Mật khẩu phải dài tối thiểu 6 ký tự");
            //    return;
            //}

            //else if (!checkAccount(matkhau))
            //{
            //    MessageBox.Show("Mật khẩu phải viết hoa");
            //}
            else
            {
                string query = "Select * from tblLogin where sTenDangNhap= '" + tentk + "' and sMatKhau= '" + matkhau + "'";
                if (modify.TaiKhoans(query).Count != 0)
                {
                    MessageBox.Show("Đăng nhập thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    frmMain FormMain = new frmMain();
                    FormMain.Show();
                    this.Hide();
                }
                else
                {

                    MessageBox.Show("Sai tên tài khoản hoặc mật khẩu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    attempts++;
                }
                if (attempts == 4)
                {
                    MessageBox.Show("Đăng nhập sai 4 lần, chương trình sẽ tắt", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    Application.Exit();
                }
            }
        }

        private void btnDangKy_Click(object sender, EventArgs e)
        {
            frmDangKy dangky = new frmDangKy();
            dangky.ShowDialog();
        }
        Modify modify = new Modify();
        int attempts = 1;
        private void btnThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void frmDangNhap_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }


    }
}
