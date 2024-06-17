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
using System.Data.SqlClient;
namespace WindowsFormsApp1
{
    public partial class frmMonHoc : Form
    {
        private DataTable tblMH; //Bảng môn học
        public frmMonHoc()
        {
            InitializeComponent();
        }

        private void dgvMonHoc_Click(object sender, EventArgs e)
        {
            if (btnThem.Enabled == false)
            {
                MessageBox.Show("Đang ở chế độ thêm mới!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMaMon.Focus();
                return;
            }
            if (tblMH.Rows.Count == 0)
            {
                MessageBox.Show("Không có dữ liệu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            txtMaMon.Text = dgvMonHoc.CurrentRow.Cells["sMaMon"].Value.ToString();
            txtMaKhoa.Text = dgvMonHoc.CurrentRow.Cells["sMaKhoa"].Value.ToString();
            txtTenMon.Text = dgvMonHoc.CurrentRow.Cells["sTenMon"].Value.ToString();
            txtSotinchi.Text = dgvMonHoc.CurrentRow.Cells["iSoTC"].Value.ToString();
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            btnBoqua.Enabled = true;
        }
        private void LoadDataGridView()
        {
            string sql;
            sql = "SELECT * from tblMonHoc";
            tblMH = Functions.GetDataToTable(sql); //Lấy dữ liệu từ bảng
            dgvMonHoc.DataSource = tblMH; //Hiển thị vào dataGridView
            dgvMonHoc.Columns[0].HeaderText = "Mã môn";
            dgvMonHoc.Columns[1].HeaderText = "Mã khoa";
            dgvMonHoc.Columns[2].HeaderText = "Tên môn";
            dgvMonHoc.Columns[3].HeaderText = "Số tín chỉ";
            dgvMonHoc.Columns[0].Width = 50;
            dgvMonHoc.Columns[1].Width = 100;
            dgvMonHoc.Columns[2].Width = 100;
            dgvMonHoc.Columns[3].Width = 100;
            dgvMonHoc.AllowUserToAddRows = false;
            dgvMonHoc.EditMode = DataGridViewEditMode.EditProgrammatically;
        }
        private void frmMonHoc_Load(object sender, EventArgs e)
        {
            txtMaMon.Enabled = false;
            btnLuu.Enabled = false;
            btnBoqua.Enabled = false;
            LoadDataGridView();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnBoqua.Enabled = true;
            btnLuu.Enabled = true;
            btnThem.Enabled = false;
            ResetValues();
            txtMaMon.Enabled = true;
            txtMaMon.Focus();
        }
        private void ResetValues()
        {
            txtMaMon.Text = "";
            txtMaKhoa.Text = "";
            txtTenMon.Text = "";
            txtSotinchi.Text = "";
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            string sql;
            if (tblMH.Rows.Count == 0)
            {
                MessageBox.Show("Không còn dữ liệu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (txtMaMon.Text.Trim() == "")
            {
                MessageBox.Show("Bạn chưa chọn bản ghi nào", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (MessageBox.Show("Bạn có muốn xoá bản ghi này không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                sql = "DELETE tblMonHoc WHERE sMaMon=N'" + txtMaMon.Text + "'";
                Functions.RunSqlDel(sql);
                LoadDataGridView();
                ResetValues();
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            string sql;
            if (tblMH.Rows.Count == 0)
            {
                MessageBox.Show("Không còn dữ liệu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (txtMaMon.Text == "")
            {
                MessageBox.Show("Bạn phải chọn bản ghi cần sửa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (txtMaKhoa.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập mã khoa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMaKhoa.Focus();
                return;
            }
            if (txtTenMon.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập tên môn", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtTenMon.Focus();
                return;
            }
            if (txtSotinchi.Text == "(  )    -")
            {
                MessageBox.Show("Bạn phải nhập số tín chỉ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtSotinchi.Focus();
                return;
            }
            sql = "UPDATE tblMonHoc SET sMaKhoa=N'" + txtMaKhoa.Text.Trim().ToString() + "',sTenMon=N'" +
                txtTenMon.Text.Trim().ToString() + "',iSoTC='" + txtSotinchi.Text.ToString() +
                "' WHERE sMaMon=N'" + txtMaMon.Text + "'";
            Functions.RunSQL(sql);
            LoadDataGridView();
            ResetValues();
            btnBoqua.Enabled = false;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string sql;
            if (txtMaMon.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập mã môn", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMaMon.Focus();
                return;
            }
            if (txtMaKhoa.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập mã khoa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMaKhoa.Focus();
                return;
            }
            if (txtTenMon.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn phải nhập tên môn", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtTenMon.Focus();
                return;
            }
            if (txtSotinchi.Text == "(  )    -")
            {
                MessageBox.Show("Bạn phải nhập số tín chỉ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtSotinchi.Focus();
                return;
            }
            //Kiểm tra đã tồn tại mã khách chưa
            sql = "SELECT sMaMon FROM tblMonHoc WHERE sMaMon=N'" + txtMaMon.Text.Trim() + "'";
            if (Functions.CheckKey(sql))
            {
                MessageBox.Show("Mã môn này đã tồn tại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMaMon.Focus();
                return;
            }
            //Chèn thêm
            sql = "INSERT INTO tblMonHoc VALUES (N'" + txtMaMon.Text.Trim() +
                "',N'" + txtMaKhoa.Text.Trim() + "',N'" + txtTenMon.Text.Trim() + "','" + txtSotinchi.Text + "')";
            Functions.RunSQL(sql);
            LoadDataGridView();
            ResetValues();

            btnXoa.Enabled = true;
            btnThem.Enabled = true;
            btnSua.Enabled = true;
            btnBoqua.Enabled = false;
            btnLuu.Enabled = false;
            txtMaMon.Enabled = false;
        }

        private void btnBoqua_Click(object sender, EventArgs e)
        {
            ResetValues();
            btnBoqua.Enabled = false;
            btnThem.Enabled = true;
            btnXoa.Enabled = true;
            btnSua.Enabled = true;
            btnLuu.Enabled = false;
            txtMaMon.Enabled = false;
        }

        private void btnDong_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
