USE [QUANLYGIANGDAY]
GO
/****** Object:  Table [dbo].[tblSinhVien]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSinhVien](
	[sMaSV] [varchar](50) NOT NULL,
	[sTenSV] [nvarchar](50) NOT NULL,
	[dNgaySinh] [datetime] NOT NULL,
	[sDiaChi] [nvarchar](50) NOT NULL,
	[sGioiTinh] [nvarchar](10) NOT NULL,
	[sLopHC] [varchar](50) NOT NULL,
	[sSDT] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_DSSV]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_DSSV]
as 
select sMaSV as[Mã sinh viên], sTenSV as[Họ và tên],  dNgaySinh as[ Ngày sinh], sDiaChi as[Địa chỉ], sGioiTinh as[Giới tính], sLopHC as  [Lớp HC], sSDT as[SDT] 
from tblSinhVien
GO
/****** Object:  Table [dbo].[tblKhoa]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhoa](
	[sMaKhoa] [varchar](50) NOT NULL,
	[sTenKhoa] [nvarchar](50) NULL,
	[sDiaChi] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[dsKhoa]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[dsKhoa]
as
select sMaKhoa as [Mã khoa], sTenKhoa as [Tên khoa], sDiaChi as[Địa chỉ]
from tblKhoa
GO
/****** Object:  Table [dbo].[tblGiangVien]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGiangVien](
	[sMaGV] [varchar](50) NOT NULL,
	[sTenGV] [nvarchar](50) NULL,
	[sGioiTinh] [nvarchar](10) NULL,
	[dNgaySinh] [datetime] NULL,
	[sMaKhoa] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_DSGV]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_DSGV]
as 
select sMaGV as[Mã giảng viên], sTenGV as[Họ và tên], sGioiTinh as[Giới tính], dNgaySinh as[ Ngày sinh], sMaKhoa as  [Mã Khoa]
from tblGiangVien
GO
/****** Object:  Table [dbo].[tblHoc]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoc](
	[sMaGV] [varchar](50) NOT NULL,
	[sMaMon] [varchar](50) NOT NULL,
	[sMaSV] [varchar](50) NOT NULL,
	[dNgayBatDau] [datetime] NOT NULL,
	[fDiemCC] [varchar](50) NULL,
	[fDiemGK] [varchar](50) NULL,
	[fDiemThi] [varchar](50) NULL,
	[fDiemKTHP] [varchar](50) NULL,
 CONSTRAINT [PK_GIANGVIEN_MONHOC] PRIMARY KEY CLUSTERED 
(
	[sMaGV] ASC,
	[sMaMon] ASC,
	[sMaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLogin]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLogin](
	[sTenDangNhap] [nvarchar](50) NOT NULL,
	[sMatKhau] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sTenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLopHC]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLopHC](
	[sMaLop] [varchar](50) NOT NULL,
	[sTenLop] [varchar](50) NULL,
	[sMaKhoa] [varchar](50) NULL,
	[sMaGV] [varchar](50) NULL,
	[sTenGV] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMonHoc]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMonHoc](
	[sMaMon] [varchar](50) NOT NULL,
	[sMaKhoa] [varchar](50) NOT NULL,
	[sTenMon] [nvarchar](50) NULL,
	[iSoTC] [int] NULL,
	[sYeucau] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv1', N'Trần Quốc Hưng', N'Nam', CAST(N'1974-01-01T00:00:00.000' AS DateTime), N'k3')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv10', N'Nguyễn Thu Trâm', N'Nữ', CAST(N'1987-04-10T00:00:00.000' AS DateTime), N'k3')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv11', N'Nguyễn Thị Loan', N'Nữ', CAST(N'1976-04-05T00:00:00.000' AS DateTime), N'k3')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv12', N'Võ Tú Tài', N'Nam', CAST(N'1972-04-08T00:00:00.000' AS DateTime), N'k4')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv13', N'Hà Huy Tập', N'Nam', CAST(N'1967-04-03T00:00:00.000' AS DateTime), N'k4')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv14', N'Nguyễn Thu Lan', N'Nữ', CAST(N'1957-02-09T00:00:00.000' AS DateTime), N'k4')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv15', N'Nguyễn Thị Hà Lan', N'Nữ', CAST(N'1987-04-05T00:00:00.000' AS DateTime), N'k4')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv16', N'Nguyễn Thị Bích Ngọc', N'Nữ', CAST(N'1967-04-05T00:00:00.000' AS DateTime), N'k4')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv17', N'Trần Thu Hiên', N'Nữ', CAST(N'1947-04-11T00:00:00.000' AS DateTime), N'k5')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv18', N'Trịnh Thị Hoài Thu', N'Nữ', CAST(N'2974-09-01T00:00:00.000' AS DateTime), N'k3')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv19', N'Nguyễn Vũ Duy Trường', N'Nam', CAST(N'1987-04-09T00:00:00.000' AS DateTime), N'k5')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv2', N'Trịnh Thị Xuân', N'Nữ', CAST(N'1977-04-05T00:00:00.000' AS DateTime), N'k1')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv20', N'Tạ Quang Duy', N'Nam', CAST(N'1967-04-09T00:00:00.000' AS DateTime), N'k2')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv21', N'Nguyễn Thị Bích Loan', N'Nữ', CAST(N'1987-04-05T00:00:00.000' AS DateTime), N'k3')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv22', N'Vũ Tuấn Anh', N'Nam', CAST(N'1989-04-05T00:00:00.000' AS DateTime), N'k5')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv3', N'Mai Thúy Hà', N'Nữ', CAST(N'1967-04-05T00:00:00.000' AS DateTime), N'k1')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv4', N'Nguyễn Thu Trang', N'Nữ', CAST(N'1997-04-05T00:00:00.000' AS DateTime), N'k1')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv5', N'Trần Đức Sáng', N'Nam', CAST(N'1967-04-05T00:00:00.000' AS DateTime), N'k1')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv6', N'Nguyễn Ngân Trâm', N'Nữ', CAST(N'1987-04-05T00:00:00.000' AS DateTime), N'k2')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv7', N'Hà Vũ Tuấn', N'Nam', CAST(N'1977-04-09T00:00:00.000' AS DateTime), N'k2')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv8', N'Nguyễn Phúc Đức', N'Nam', CAST(N'1974-01-09T00:00:00.000' AS DateTime), N'k2')
INSERT [dbo].[tblGiangVien] ([sMaGV], [sTenGV], [sGioiTinh], [dNgaySinh], [sMaKhoa]) VALUES (N'gv9', N'Nguyễn Hà Bảo Trang', N'Nữ', CAST(N'1976-04-09T00:00:00.000' AS DateTime), N'k2')
GO
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv1', N'm1', N'19IT03', CAST(N'2020-03-30T00:00:00.000' AS DateTime), N'10', N'8', N'8', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv1', N'm1', N'19IT04', CAST(N'2020-03-30T00:00:00.000' AS DateTime), N'7', N'9', N'8', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv1', N'm1', N'20IT04', CAST(N'2022-12-12T00:00:00.000' AS DateTime), N'9', N'7', N'7', N'7')
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv10', N'm1', N'20IT04', CAST(N'2021-03-20T00:00:00.000' AS DateTime), N'8', N'10', N'10', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv10', N'm1', N'21IT01', CAST(N'2021-11-12T00:00:00.000' AS DateTime), N'7', N'8', N'9', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv10', N'm1', N'21IT02', CAST(N'2021-11-12T00:00:00.000' AS DateTime), N'8', N'9', N'10', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv10', N'm5', N'21IT01', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'10', N'10', N'9', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv10', N'm5', N'21IT03', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'9', N'10', N'5', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv11', N'm5', N'21IT03', CAST(N'2021-03-20T00:00:00.000' AS DateTime), N'8', N'10', N'10', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv11', N'm6', N'21IT05', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'8', N'10', N'2', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv12', N'm3', N'21IT04', CAST(N'2021-03-20T00:00:00.000' AS DateTime), N'10', N'8', N'7', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv2', N'm3', N'19IT01', CAST(N'2020-03-30T00:00:00.000' AS DateTime), N'10', N'9', N'9', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv2', N'm3', N'19IT03', CAST(N'2020-03-30T00:00:00.000' AS DateTime), N'9', N'9', N'10', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv2', N'm3', N'19IT08', CAST(N'2021-07-30T00:00:00.000' AS DateTime), N'9', N'9', N'6', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv2', N'm3', N'20IT01', CAST(N'2021-07-30T00:00:00.000' AS DateTime), N'8', N'7', N'9', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv3', N'm4', N'20IT01', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'10', N'8', N'8', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv3', N'm5', N'20IT06', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'9', N'10', N'6', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv3', N'm5', N'20IT07', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'10', N'8', N'8', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv3', N'm6', N'20IT01', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'9', N'10', N'7', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv7', N'm2', N'20IT09', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'9', N'10', N'10', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv7', N'm3', N'20IT09', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'7', N'9', N'10', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv7', N'm5', N'20IT06', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'9', N'9', N'9', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv7', N'm5', N'20IT07', CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'9', N'8', N'10', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv9', N'm3', N'20IT03', CAST(N'2021-03-20T00:00:00.000' AS DateTime), N'10', N'8', N'7', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv9', N'm3', N'20IT04', CAST(N'2021-03-20T00:00:00.000' AS DateTime), N'9', N'10', N'10', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv9', N'm3', N'21IT02', CAST(N'2021-03-20T00:00:00.000' AS DateTime), N'8', N'9', N'9', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv9', N'm5', N'20IT04', CAST(N'2021-03-20T00:00:00.000' AS DateTime), N'9', N'10', N'10', NULL)
INSERT [dbo].[tblHoc] ([sMaGV], [sMaMon], [sMaSV], [dNgayBatDau], [fDiemCC], [fDiemGK], [fDiemThi], [fDiemKTHP]) VALUES (N'gv9', N'm6', N'21IT05', CAST(N'2021-10-09T00:00:00.000' AS DateTime), N'8', N'9', N'9', NULL)
GO
INSERT [dbo].[tblKhoa] ([sMaKhoa], [sTenKhoa], [sDiaChi]) VALUES (N'k1', N'CNTT', N'Hoàng Mai - Hà Nội')
INSERT [dbo].[tblKhoa] ([sMaKhoa], [sTenKhoa], [sDiaChi]) VALUES (N'K13', N'sinh', N'Láng Hạ')
INSERT [dbo].[tblKhoa] ([sMaKhoa], [sTenKhoa], [sDiaChi]) VALUES (N'k2', N'Kinh Tế', N'Thanh Xuân - Hà Nội')
INSERT [dbo].[tblKhoa] ([sMaKhoa], [sTenKhoa], [sDiaChi]) VALUES (N'k3', N'Điện tử thông tin', N'Vĩnh Hưng - Hà Nội')
INSERT [dbo].[tblKhoa] ([sMaKhoa], [sTenKhoa], [sDiaChi]) VALUES (N'k4', N'Tiếng Trung', N'Vĩnh Hưng - Hà Nội')
INSERT [dbo].[tblKhoa] ([sMaKhoa], [sTenKhoa], [sDiaChi]) VALUES (N'k5', N'Thiết Kế', N'Hoàng Mai - Hà Nội')
INSERT [dbo].[tblKhoa] ([sMaKhoa], [sTenKhoa], [sDiaChi]) VALUES (N'k6', N'Ngoại Ngữ', N'Đống Đa - Hà Nội')
INSERT [dbo].[tblKhoa] ([sMaKhoa], [sTenKhoa], [sDiaChi]) VALUES (N'k7', N'Toán', N'Vĩnh Hưng')
GO
INSERT [dbo].[tblLogin] ([sTenDangNhap], [sMatKhau]) VALUES (N'cuong', N'1234')
INSERT [dbo].[tblLogin] ([sTenDangNhap], [sMatKhau]) VALUES (N'hungngu', N'hungngo@123')
INSERT [dbo].[tblLogin] ([sTenDangNhap], [sMatKhau]) VALUES (N'moduy', N'5678')
INSERT [dbo].[tblLogin] ([sTenDangNhap], [sMatKhau]) VALUES (N'moduy1234', N'5678')
INSERT [dbo].[tblLogin] ([sTenDangNhap], [sMatKhau]) VALUES (N'quan', N'1234')
INSERT [dbo].[tblLogin] ([sTenDangNhap], [sMatKhau]) VALUES (N'quan123', N'4567')
GO
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp1', N'1910A02', N'k2', N'gv3', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp10', N'2010A05', N'k2', N'gv4', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp11', N'2110A05', N'k1', N'gv4', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp12', N'2110A01', N'k3', N'gv10', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp13', N'2110A02', N'k3', N'gv9', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp14', N'2110A03', N'k3', N'gv11', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp15', N'2110B03', N'k3', N'gv11', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp16', N'2110A04', N'k4', N'gv12', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp17', N'2110A06', N'k4', N'gv12', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp18', N'2110A07', N'k4', N'gv13', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp19', N'k15', N'k4', N'gv13', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp2', N'1910A02', N'k1', N'gv4', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp23', N'2310A03', N'k3', N'gv3', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp3', N'1910A03', N'k1', N'gv2', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp4', N'1910A04', N'k1', N'gv2', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp5', N'1910A05', N'k1', N'gv3', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp6', N'2010A01', N'k1', N'gv3', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp7', N'2010A02', N'k2', N'gv6', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp8', N'2010A03', N'k2', N'gv6', NULL)
INSERT [dbo].[tblLopHC] ([sMaLop], [sTenLop], [sMaKhoa], [sMaGV], [sTenGV]) VALUES (N'lp9', N'2010A04', N'k2', N'gv7', NULL)
GO
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm1', N'k3', N'Cơ sở dữ liệu', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm12', N'k1', N'English basic', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm14', N'k3', N'English basic', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm15', N'k4', N'English basic', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm16', N'k5', N'English basic', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm17', N'k6', N'English basic', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm18', N'k2', N'English basic 2', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm19', N'k1', N'English basic 2', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm2', N'k1', N'Cơ sở lập trình', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm20', N'k3', N'English basic 2', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm21', N'k4', N'English basic 2', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm22', N'k5', N'English basic 2', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm23', N'k6', N'English nâng cao', 4, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm3', N'k1', N'Cơ sở dữ liệu', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm34', N'k3', N'devopp', 5, N'quá khó')
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm4', N'k1', N'Lập trình hướng đối tượng', 4, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm45', N'k1', N'Thực tập tốt nghiệp', 10, N'ph?i làm báo cáo th?c t?p')
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm5', N'k1', N'HQL CSDL', 4, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm50', N'k1', N'Toán lý luận', 5, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm56', N'k1', N'khó', 5, N'khó')
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm6', N'k1', N'Xác suất thống kê', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm7', N'k2', N'Xác suất thống kê', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm8', N'k3', N'Xác suất thống kê', 3, NULL)
INSERT [dbo].[tblMonHoc] ([sMaMon], [sMaKhoa], [sTenMon], [iSoTC], [sYeucau]) VALUES (N'm9', N'k4', N'Xác suất thống kê', 3, NULL)
GO
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'19IT01', N'nguyen manh hung', CAST(N'2000-04-15T00:00:00.000' AS DateTime), N'Hà N?i', N'Nam', N'lp15', N'04567878')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'19IT02', N'nguyen thuy trang', CAST(N'2000-05-26T00:00:00.000' AS DateTime), N'B?c Ninh', N'Nữ', N'lp2', N'014252369')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'19IT03', N'pham minh chung', CAST(N'2002-08-30T00:00:00.000' AS DateTime), N'B?c Ninh', N'Nữ', N'lp1', N'0963445741')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'19IT04', N'dinh chung hoang', CAST(N'2003-08-08T00:00:00.000' AS DateTime), N'Hà N?i', N'Nam', N'lp3', N'075d4453486')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'19IT05', N'nguyen hoang long', CAST(N'1999-03-06T00:00:00.000' AS DateTime), N'Hà N?i', N'Nam', N'lp1', N'0942382442')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'19IT06', N'le phuong hoa', CAST(N'2000-12-12T00:00:00.000' AS DateTime), N'Hà N?i', N'Nữ', N'lp2', N'096424784')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'19IT07', N'vu quynh kim anh', CAST(N'2003-09-24T00:00:00.000' AS DateTime), N'Hà N?i', N'Nữ', N'lp2', N'09646787')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'19IT08', N'doan quoc huy', CAST(N'2000-08-09T00:00:00.000' AS DateTime), N'B?c Ninh', N'Nam', N'lp5', N'096244454')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'19IT09', N'dinh quang anh', CAST(N'2002-02-04T00:00:00.000' AS DateTime), N'Thanh Hóa', N'Nữ', N'lp5', N'09632242554')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'19IT10', N'dinh quang anh', CAST(N'2001-09-29T00:00:00.000' AS DateTime), N'Thanh Hóa', N'Nữ', N'lp5', N'09632242554')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'20IT01', N'le duc hoan', CAST(N'2001-05-05T00:00:00.000' AS DateTime), N'Thanh Hóa', N'Nam', N'lp10', N'0123456789')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'20IT02', N'nguyen manh truong', CAST(N'2002-05-16T00:00:00.000' AS DateTime), N'Hà N?i', N'Nam', N'lp8', N'0456789123')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'20IT03', N'nguyen thi c', CAST(N'2000-01-26T00:00:00.000' AS DateTime), N'Hà N?i', N'Nữ', N'lp6', N'0147852369')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'20IT04', N'pham thi d', CAST(N'2001-10-30T00:00:00.000' AS DateTime), N'Hà N?i', N'Nữ', N'lp9', N'0963258741')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'20IT05', N'dinh quang minh', CAST(N'2001-02-12T00:00:00.000' AS DateTime), N'Hà N?i', N'Nam', N'lp10', N'0753159486')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'20IT06', N'nguyen can d', CAST(N'2003-03-02T00:00:00.000' AS DateTime), N'Hà N?i', N'Nam', N'lp9', N'09632582442')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'20IT07', N'le phuong linh', CAST(N'2001-12-03T00:00:00.000' AS DateTime), N'Hà N?i', N'Nữ', N'lp6', N'09636784')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'20IT08', N'vu quynh huong', CAST(N'2003-03-24T00:00:00.000' AS DateTime), N'Hà N?i', N'Nữ', N'lp10', N'096325787')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'20IT09', N'doan van hau', CAST(N'2001-07-01T00:00:00.000' AS DateTime), N'B?c Giang', N'Nữ', N'lp8', N'096325454')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'20IT10', N'dinh dieu thuy', CAST(N'2001-07-29T00:00:00.000' AS DateTime), N'B?c Giang', N'Nữ', N'lp7', N'09632554')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'21IT01', N'le minh hiep', CAST(N'2002-05-10T00:00:00.000' AS DateTime), N'B?c Giang', N'Nam', N'lp15', N'01234242')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'21IT02', N'nguyen manh hai', CAST(N'2003-12-15T00:00:00.000' AS DateTime), N'B?c Giang', N'Nam', N'lp13', N'045624242')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'21IT03', N'nguyen thi ut', CAST(N'2000-11-26T00:00:00.000' AS DateTime), N'B?c Giang', N'Nữ', N'lp11', N'0147824424')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'21IT04', N'pham thi cuc', CAST(N'1999-12-30T00:00:00.000' AS DateTime), N'Hà N?i', N'Nữ', N'lp14', N'0963246542')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'21IT05', N'dinh quang minh', CAST(N'2000-08-09T00:00:00.000' AS DateTime), N'Hà N?i', N'Nam', N'lp15', N'075312424')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'21IT06', N'nguyen can gio', CAST(N'2001-08-03T00:00:00.000' AS DateTime), N'Hà N?i', N'Nam', N'lp14', N'09632242')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'21IT07', N'le phuong han', CAST(N'2000-12-01T00:00:00.000' AS DateTime), N'Hà N?i', N'Nữ', N'lp11', N'09242543878')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'21IT08', N'vu kim anh', CAST(N'2001-04-12T00:00:00.000' AS DateTime), N'Cao B?ng', N'Nữ', N'lp15', N'0963257454')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'21IT09', N'doan chung', CAST(N'2000-08-09T00:00:00.000' AS DateTime), N'Cao B?ng', N'Nữ', N'lp13', N'09633464556')
INSERT [dbo].[tblSinhVien] ([sMaSV], [sTenSV], [dNgaySinh], [sDiaChi], [sGioiTinh], [sLopHC], [sSDT]) VALUES (N'21IT10', N'dinh dieu hoang mai', CAST(N'2001-02-11T00:00:00.000' AS DateTime), N'Cao B?ng', N'Nữ', N'lp12', N'096567464')
GO
ALTER TABLE [dbo].[tblGiangVien]  WITH CHECK ADD FOREIGN KEY([sMaKhoa])
REFERENCES [dbo].[tblKhoa] ([sMaKhoa])
GO
ALTER TABLE [dbo].[tblHoc]  WITH CHECK ADD  CONSTRAINT [FK_giangvien] FOREIGN KEY([sMaGV])
REFERENCES [dbo].[tblGiangVien] ([sMaGV])
GO
ALTER TABLE [dbo].[tblHoc] CHECK CONSTRAINT [FK_giangvien]
GO
ALTER TABLE [dbo].[tblHoc]  WITH CHECK ADD  CONSTRAINT [FK_Mon] FOREIGN KEY([sMaMon])
REFERENCES [dbo].[tblMonHoc] ([sMaMon])
GO
ALTER TABLE [dbo].[tblHoc] CHECK CONSTRAINT [FK_Mon]
GO
ALTER TABLE [dbo].[tblHoc]  WITH CHECK ADD  CONSTRAINT [FK_SV] FOREIGN KEY([sMaSV])
REFERENCES [dbo].[tblSinhVien] ([sMaSV])
GO
ALTER TABLE [dbo].[tblHoc] CHECK CONSTRAINT [FK_SV]
GO
ALTER TABLE [dbo].[tblLopHC]  WITH CHECK ADD FOREIGN KEY([sMaGV])
REFERENCES [dbo].[tblGiangVien] ([sMaGV])
GO
ALTER TABLE [dbo].[tblLopHC]  WITH CHECK ADD FOREIGN KEY([sMaKhoa])
REFERENCES [dbo].[tblKhoa] ([sMaKhoa])
GO
ALTER TABLE [dbo].[tblLopHC]  WITH CHECK ADD FOREIGN KEY([sTenGV])
REFERENCES [dbo].[tblGiangVien] ([sMaGV])
GO
ALTER TABLE [dbo].[tblMonHoc]  WITH CHECK ADD FOREIGN KEY([sMaKhoa])
REFERENCES [dbo].[tblKhoa] ([sMaKhoa])
GO
ALTER TABLE [dbo].[tblSinhVien]  WITH CHECK ADD FOREIGN KEY([sLopHC])
REFERENCES [dbo].[tblLopHC] ([sMaLop])
GO
/****** Object:  StoredProcedure [dbo].[dssvtheolop]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dssvtheolop]
	@tenlop varchar(50)
as
select sMasv, sTensv, sDiachi, sLopHC, sTenLop
from tblLopHC inner join tblSinhVien on tblLopHC.sMaLop = tblSinhVien.sLopHC
where sLopHC = @tenlop
GO
/****** Object:  StoredProcedure [dbo].[insert_giangvien]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_giangvien]
@MaGV nvarchar(20),@TenGV nvarchar(30), @Gioitinh nvarchar(20), @Ngaysinh datetime, @Makhoa varchar(20)
as
insert into tblGiangVien
(sMaGV, sTenGV,sGioiTinh, dNgaySinh,sMaKhoa)
values
(@MaGV,@TenGV,@Gioitinh,@Ngaysinh,@Makhoa)
GO
/****** Object:  StoredProcedure [dbo].[insert_sinhvien]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_sinhvien]
@MaSV nvarchar(20),@TenSV nvarchar(30), @NgaySinh datetime, @Gioitinh nvarchar(20), @LopHC varchar(20), @SDT varchar(30), @Diachi nvarchar(30)
as
insert into tblSinhVien
(sMaSV, sTenSV, dNgaySinh, sDiaChi,sGioiTinh,sLopHC,sSDT)
values
(@MaSV,@TenSV,@NgaySinh,@DiaChi,@Gioitinh,@LopHC,@SDT)
GO
/****** Object:  StoredProcedure [dbo].[khoa]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[khoa]
(
	@makhoa varchar(50),
	@tenkhoa nvarchar(50),
	@diachi nvarchar(50)
)
as insert into tblKhoa(sMaKhoa,sTenKhoa,sDiaChi) values (@makhoa,@tenkhoa,@diachi)
GO
/****** Object:  StoredProcedure [dbo].[sp_DSLtheokhoa]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DSLtheokhoa]
@tenkhoa nvarchar(50)
as
select sMaLop,sTenLop,sMaGV
from tblLopHC inner join tblKhoa on tblLopHC.sMaKhoa=tblLopHC.sMaKhoa

where sTenKhoa=@tenkhoa
GO
/****** Object:  StoredProcedure [dbo].[suagv]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[suagv](@magv nvarchar(50),@tengv nvarchar(50),@Gioitinh nvarchar(20), @Ngaysinh datetime, @Makhoa varchar(20))
as
begin
	update tblGiangVien
	set sTenGV = @tengv, sGioiTinh = @Gioitinh, dNgaySinh = @Ngaysinh, sMaKhoa = @Makhoa
	where sMaGV = @magv
end
GO
/****** Object:  StoredProcedure [dbo].[suakhoa]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[suakhoa](@maKhoa nvarchar(50),@tenKhoa nvarchar(50), @diaChi nvarchar(50))
as
begin
	update tblKhoa
	set sTenKhoa = @tenKhoa, sDiaChi = @diaChi
	where sMaKhoa = @maKhoa
end
GO
/****** Object:  StoredProcedure [dbo].[tim_kiem]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tim_kiem](@masv nvarchar(20), @tensv nvarchar(20), @diachi nvarchar(50), @gioitinh nvarchar(10), @lophc nvarchar(10), @sdt varchar(20))
as
begin
select * from tblSinhVien where sMaSV=@masv or sTenSV=@tensv or @diachi= sDiaChi or sGioiTinh=@gioitinh or sLopHC=@lophc or sSDT =@sdt
end
GO
/****** Object:  StoredProcedure [dbo].[tim_kiemgv]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tim_kiemgv](@magv nvarchar(20), @tengv nvarchar(30), @gioitinh nvarchar(10), @makhoa varchar(20))
as
begin
select*from tblGiangVien where sMaGV=@magv or sTenGV=@tengv or sGioiTinh=@gioitinh or sMaKhoa=@makhoa
end
GO
/****** Object:  StoredProcedure [dbo].[timkhoa]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[timkhoa]
@ten nvarchar(50)
as
select *
from tblKhoa
where sTenKhoa like N'%'+@ten+'%'
GO
/****** Object:  StoredProcedure [dbo].[xoa_gv]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[xoa_gv](@magv nvarchar(50))          
as
begin
	delete from tblGiangVien
	where sMaGV=@magv /*and sTenGV=@TenGV  and @Gioitinh=sGioiTinh and @Ngaysinh=dNgaySinh and sMaKhoa=@MaKhoa*/
end
GO
/****** Object:  StoredProcedure [dbo].[xoakhoa]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[xoakhoa](@makhoa nvarchar(50))
as
begin
	delete from tblKhoa
	where sMaKhoa = @makhoa
end
GO
/****** Object:  StoredProcedure [dbo].[xoasv]    Script Date: 10/10/2023 2:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[xoasv](@masv nvarchar(50), @TenSV nvarchar(50), @NgaySinh datetime, @Diachi nvarchar(50),@Gioitinh nvarchar(10), @LopHC varchar(20), @SDT varchar(50))
as
begin
	delete from tblSinhVien
	where sMaSV=@masv and sTenSV=@TenSV and @Ngaysinh=dNgaySinh and @Gioitinh=sGioiTinh and sLopHC=@LopHC and sSDT=@SDT
end
GO
