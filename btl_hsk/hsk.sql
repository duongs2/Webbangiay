USE [master]
GO
/****** Object:  Database [QUANLYGIANGDAY]    Script Date: 10/10/2023 2:33:34 PM ******/
CREATE DATABASE [QUANLYGIANGDAY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QUANLYGIANGDAY', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QUANLYGIANGDAY.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QUANLYGIANGDAY_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QUANLYGIANGDAY_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QUANLYGIANGDAY] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QUANLYGIANGDAY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QUANLYGIANGDAY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET ARITHABORT OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET  MULTI_USER 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QUANLYGIANGDAY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QUANLYGIANGDAY] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QUANLYGIANGDAY] SET QUERY_STORE = OFF
GO
USE [QUANLYGIANGDAY]
GO
/****** Object:  Table [dbo].[tblSinhVien]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  View [dbo].[v_DSSV]    Script Date: 10/10/2023 2:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_DSSV]
as 
select sMaSV as[Mã sinh viên], sTenSV as[Họ và tên],  dNgaySinh as[ Ngày sinh], sDiaChi as[Địa chỉ], sGioiTinh as[Giới tính], sLopHC as  [Lớp HC], sSDT as[SDT] 
from tblSinhVien
GO
/****** Object:  Table [dbo].[tblKhoa]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  View [dbo].[dsKhoa]    Script Date: 10/10/2023 2:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[dsKhoa]
as
select sMaKhoa as [Mã khoa], sTenKhoa as [Tên khoa], sDiaChi as[Địa chỉ]
from tblKhoa
GO
/****** Object:  Table [dbo].[tblGiangVien]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  View [dbo].[v_DSGV]    Script Date: 10/10/2023 2:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_DSGV]
as 
select sMaGV as[Mã giảng viên], sTenGV as[Họ và tên], sGioiTinh as[Giới tính], dNgaySinh as[ Ngày sinh], sMaKhoa as  [Mã Khoa]
from tblGiangVien
GO
/****** Object:  Table [dbo].[tblHoc]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  Table [dbo].[tblLogin]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  Table [dbo].[tblLopHC]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  Table [dbo].[tblMonHoc]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[dssvtheolop]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[insert_giangvien]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[insert_sinhvien]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[khoa]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DSLtheokhoa]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[suagv]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[suakhoa]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[tim_kiem]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[tim_kiemgv]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[timkhoa]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[xoa_gv]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[xoakhoa]    Script Date: 10/10/2023 2:33:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[xoasv]    Script Date: 10/10/2023 2:33:34 PM ******/
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
USE [master]
GO
ALTER DATABASE [QUANLYGIANGDAY] SET  READ_WRITE 
GO
