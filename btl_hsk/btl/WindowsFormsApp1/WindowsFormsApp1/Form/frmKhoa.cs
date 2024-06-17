using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient; //Sử dụng thư viện để làm việc SQL server
using WindowsFormsApp1.Class; //Sử dụng class Functions.cs

namespace WindowsFormsApp1
{
    public partial class frmKhoa : Form
    {
        private DataTable tblK;
        public frmKhoa()
        {
            InitializeComponent();
        }

        private void frmKhoa_Load(object sender, EventArgs e)
        {

            txtMaKhoa.Enabled = false;
            btnLuu.Enabled = false;
            btnBoqua.Enabled = false;
            LoadDataGridView(); //Hiển thị bảng 
        }
        private void LoadDataGridView()
        {
            string sql;
            sql = "SELECT [sMaKhoa],[sTenKhoa],[sDiaChi] FROM [tblKhoa]";
            tblK = Functions.GetDataToTable(sql); //Đọc dữ liệu từ bảng
            dgvKhoa.DataSource = tblK; //Nguồn dữ liệu            
            dgvKhoa.Columns[0].HeaderText = "Mã Khoa";
            dgvKhoa.Columns[1].HeaderText = "Tên Khoa";
            dgvKhoa.Columns[2].HeaderText = "Địa Chỉ";
            dgvKhoa.Columns[0].Width = 100;
            dgvKhoa.Columns[1].Width = 200;
            dgvKhoa.Columns[2].Width = 200;
            dgvKhoa.AllowUserToAddRows = false; //Không cho người dùng thêm dữ liệu trực tiếp
            dgvKhoa.EditMode = DataGridViewEditMode.EditProgrammatically; //Không cho sửa dữ liệu trực tiếp
        }
        private void dgvKhoa_Click(object sender, EventArgs e)
        {
            if (btnThem.Enabled == false)
            {
                MessageBox.Show("Đang ở chế độ thêm mới!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMaKhoa.Focus();
                return;
            }
            if (tblK.Rows.Count == 0) //Nếu không có dữ liệu
            {
                MessageBox.Show("Không có dữ liệu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            txtMaKhoa.Text = dgvKhoa.CurrentRow.Cells["sMaKhoa"].Value.ToString();
            txtTenKhoa.Text = dgvKhoa.CurrentRow.Cells["sTenKhoa"].Value.ToString();
            txtDiaChi.Text = dgvKhoa.CurrentRow.Cells["sDiaChi"].Value.ToString();
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            btnBoqua.Enabled = true;

        }

    private void btnThem_Click(object sender, EventArgs e)
        {
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnBoqua.Enabled = true;
            btnLuu.Enabled = true;
            btnThem.Enabled = false;
            ResetValue(); //Xoá trắng các textbox
            txtMaKhoa.Enabled = true; //cho phép nhập mới
            txtMaKhoa.Focus();
        }

        private void ResetValue()
        {
            txtMaKhoa.Text = "";
            txtTenKhoa.Text = "";
            txtDiaChi.Text = "";
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            string sql; //Lưu câu lệnh sql
            if (tblK.Rows.Count == 0)
            {
                MessageBox.Show("Không còn dữ liệu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (txtMaKhoa.Text == "") //nếu chưa chọn bản ghi nào
            {
                MessageBox.Show("Bạn chưa chọn bản ghi nào", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (txtTenKhoa.Text.Trim().Length == 0) //nếu chưa nhập tên khoa
            {
                MessageBox.Show("Bạn chưa nhập tên khoa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (txtDiaChi.Text.Trim().Length == 0) //nếu chưa nhập địa chỉ
            {
                MessageBox.Show("Bạn chưa nhập địa chỉ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            sql = "UPDATE tblKhoa SET sTenKhoa=N'" + txtTenKhoa.Text.ToString() + "' AND sDiaChi=N'" + txtDiaChi.Text.ToString() + "' WHERE sMaKhoa=N'" + txtMaKhoa.Text + "'";
            Class.Functions.RunSQL(sql);
            LoadDataGridView();
            ResetValue();

            btnBoqua.Enabled = false;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            string sql;
            if (tblK.Rows.Count == 0)
            {
                MessageBox.Show("Không còn dữ liệu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (txtMaKhoa.Text == "") //nếu chưa chọn bản ghi nào
            {
                MessageBox.Show("Bạn chưa chọn bản ghi nào", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (MessageBox.Show("Bạn có muốn xoá không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                sql = "DELETE tblKhoa WHERE sMaKhoa=N'" + txtMaKhoa.Text + "'";
                Class.Functions.RunSqlDel(sql);
                LoadDataGridView();
                ResetValue();
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string sql; //Lưu lệnh sql
            if (txtMaKhoa.Text.Trim().Length == 0) //Nếu chưa nhập mã khoa
            {
                MessageBox.Show("Bạn phải nhập mã khoa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMaKhoa.Focus();
                return;
            }
            if (txtTenKhoa.Text.Trim().Length == 0) //Nếu chưa nhập tên khoa
            {
                MessageBox.Show("Bạn phải nhập tên khoa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtTenKhoa.Focus();
                return;
            }
            if (txtDiaChi.Text.Trim().Length == 0) //Nếu chưa nhập địa chỉ
            {
                MessageBox.Show("Bạn phải nhập địa chỉ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtDiaChi.Focus();
                return;
            }
            sql = "Select sMaKhoa From tblKhoa where sMaKhoa=N'" + txtMaKhoa.Text.Trim() + "'";
            if (Class.Functions.CheckKey(sql))
            {
                MessageBox.Show("Mã khoa này đã có, bạn phải nhập mã khác", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtMaKhoa.Focus();
                return;
            }

            sql = "INSERT INTO tblKhoa VALUES(N'" +
                txtMaKhoa.Text + "',N'" + txtTenKhoa.Text + "',N'" + txtDiaChi.Text + "')";
            Class.Functions.RunSQL(sql); //Thực hiện câu lệnh sql
            LoadDataGridView(); //Nạp lại DataGridView
            ResetValue();
            btnXoa.Enabled = true;
            btnThem.Enabled = true;
            btnSua.Enabled = true;
            btnBoqua.Enabled = false;
            btnLuu.Enabled = false;
            txtMaKhoa.Enabled = false;
        }

        private void btnBoqua_Click(object sender, EventArgs e)
        {
            ResetValue();
            btnBoqua.Enabled = false;
            btnThem.Enabled = true;
            btnXoa.Enabled = true;
            btnSua.Enabled = true;
            btnLuu.Enabled = false;
            txtMaKhoa.Enabled = false;
        }

        private void btnDong_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dgvKhoa_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
