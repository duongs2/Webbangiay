using WindowsFormsApp1.Class;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class frmMain : System.Windows.Forms.Form
    {
        bool isThoat = true;
        //System.Timers.Timer t;
        //int h, m, s;
        public frmMain()
        {
            InitializeComponent();
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            Class.Functions.Connect(); //Mở kết nối
            //t = new System.Timers.Timer();
            //t.Interval = 1000;
            //t.Elapsed += OnTimeEvent;
            //t.Start();
        }
        private void mnuThoat_Click(object sender, EventArgs e)
        {
            Class.Functions.Disconnect(); //Đóng kết nối
            Application.Exit(); //Thoát
        }

        private void mnuDangXuat_Click(object sender, EventArgs e)
        {
            isThoat = false;
            this.Close();
            frmDangNhap formDangNhap = new frmDangNhap();
            formDangNhap.Show();
        }

        private void frmMain_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (isThoat)
            {
                Application.Exit();
            }
        }

        private void frmMain_FormCloing(object sender, FormClosingEventArgs e)
        {
            //t.Stop();
            //Application.DoEvents();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void mnuSinhVien_Click(object sender, EventArgs e)
        {
            frmSinhVien frmSV = new frmSinhVien();
            frmSV.ShowDialog();
        }

        private void mnuLopHoc_Click(object sender, EventArgs e)
        {
            frmLopHoc frmLH = new frmLopHoc();
            frmLH.ShowDialog();
        }

        private void mnuKhoa_Click(object sender, EventArgs e)
        {
            frmKhoa frmK = new frmKhoa();
            frmK.ShowDialog();
        }

        private void mnuMonHoc_Click(object sender, EventArgs e)
        {
            frmMonHoc frmMH = new frmMonHoc();
            frmMH.ShowDialog();
        }

        private void mnuChitietmonhoc_Click(object sender, EventArgs e)
        {
            frmChitietmonhoc frmCc = new frmChitietmonhoc();
            frmCc.ShowDialog();
        }

        private void mnuGiangVien_Click(object sender, EventArgs e)
        {
            frmGiangVien frmGV = new frmGiangVien();
            frmGV.ShowDialog();
        }

        //private void OnTimeEvent(object sender, ElapsedEventArgs e)
        //{
        //    Invoke(new Action(() =>
        //    {
        //        s += 1;
        //        if (s == 60)
        //        {
        //            s = 0;
        //            m += 1;
        //        }
        //        if (m == 60)
        //        {
        //            m = 0;
        //            h += 1;
        //        }
        //        txtResult.Text = string.Format("{0}:{1}:{2}", h.ToString().PadLeft(2, '0'), m.ToString().PadLeft(2, '0'), s.ToString().PadLeft(2, '0'));
        //    }));

        //}
    }
}
