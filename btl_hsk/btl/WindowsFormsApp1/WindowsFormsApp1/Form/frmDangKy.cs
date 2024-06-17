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
    public partial class frmDangKy : Form
    {
        public frmDangKy()
        {
            InitializeComponent();
        }
        Modify modify = new Modify();
        private void frmDangKy_Load(object sender, EventArgs e)
        {

        }

        private void btnDangKy_Click(object sender, EventArgs e)
        {
            //var hasNumber = new Regex(@"[0-9]+");
            //var hasUpperChar = new Regex(@"[A-Z]+");
            //var hasLowerChar = new Regex(@"[a-z]+");
            //var hasSymbols = new Regex(@"[!@#$%^&*()_+=\[{\]};]+");
            string tendk = txtDangKy.Text;
            string matkhaudk = txtMatKhau.Text;
            string xnmatkhaudk = txtXacNhanMK.Text;
            if (tendk.Trim() == "")
            {
                MessageBox.Show("Hãy nhập tên tài khoản đăng ký", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else if (matkhaudk.Trim() == "")
            {
                MessageBox.Show("Hãy nhập mật khẩu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            //else if (txtMatKhau.Text.Trim().Length < 6)
            //{
            //    MessageBox.Show("Mật khẩu phải dài tối thiểu 6 ký tự", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //}

            else if (xnmatkhaudk.Trim() == "")
            {
                MessageBox.Show("Hãy xác nhận mật khẩu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            //else if (txtXacNhanMK.Text.Trim().Length < 6)
            //{
            //    MessageBox.Show("Mật khẩu phải dài tối thiểu 6 ký tự", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //}

            //else if (matkhaudk != xnmatkhaudk)
            //{
            //    MessageBox.Show("Vui lòng nhập chính xác mật khẩu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //    return;
            //}
            //else if (!hasNumber.IsMatch(matkhaudk))
            //{
            //    MessageBox.Show("Mật khẩu phải chứa số!");
            //    return;
            //}
            //else if (!hasUpperChar.IsMatch(matkhaudk))
            //{
            //    MessageBox.Show("Mật khẩu phải chứa chữ viết hoa!");
            //    return;
            //}
            //else if (!hasLowerChar.IsMatch(matkhaudk))
            //{
            //    MessageBox.Show("Mật khẩu phải chứa chữ không viết hoa!");
            //    return;
            //}
            //else if (!hasSymbols.IsMatch(matkhaudk))
            //{
            //    MessageBox.Show("Mật khẩu phải chứa Ký tự đặc biệt!");
            //    return;
            //}
            else
            {
                try
                {
                    string query = "INSERT INTO tblLogin VALUES ('" + tendk + "','" + matkhaudk + "')";
                    modify.Command(query);
                    if (MessageBox.Show("Đăng ký thành công! Bạn có muốn đăng nhập luôn không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information) == DialogResult.Yes)
                    {
                        this.Close();
                    }

                }
                catch
                {
                    MessageBox.Show("Tên tài khoản đã tồn tại, hãy nhập tên khác!");
                }
            }
        }

        private void btnTroVe_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
