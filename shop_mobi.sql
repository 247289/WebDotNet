USE [master]
GO
/****** Object:  Database [shop_mobi]    Script Date: 5/30/2019 1:19:08 AM ******/
CREATE DATABASE [shop_mobi]
GO
ALTER DATABASE [shop_mobi] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shop_mobi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shop_mobi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shop_mobi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shop_mobi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shop_mobi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shop_mobi] SET ARITHABORT OFF 
GO
ALTER DATABASE [shop_mobi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shop_mobi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shop_mobi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shop_mobi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shop_mobi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shop_mobi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shop_mobi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shop_mobi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shop_mobi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shop_mobi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shop_mobi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shop_mobi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shop_mobi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shop_mobi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shop_mobi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shop_mobi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shop_mobi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shop_mobi] SET RECOVERY FULL 
GO
ALTER DATABASE [shop_mobi] SET  MULTI_USER 
GO
ALTER DATABASE [shop_mobi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shop_mobi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shop_mobi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shop_mobi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [shop_mobi] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'shop_mobi', N'ON'
GO
USE [shop_mobi]
GO
/****** Object:  Table [dbo].[tbl_anh]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_anh](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[duongdan] [varchar](255) NULL,
	[id_sp] [int] NULL,
 CONSTRAINT [PK_tbl_anh] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_chitietdonhang]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_chitietdonhang](
	[id_don] [varchar](12) NOT NULL,
	[id_sp] [int] NOT NULL,
	[soluong] [int] NULL,
	[gia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tbl_chitietdonhang] PRIMARY KEY CLUSTERED 
(
	[id_don] ASC,
	[id_sp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_danhmuc]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_danhmuc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dondathang]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_dondathang](
	[id] [varchar](12) NOT NULL,
	[id_tk] [int] NULL,
	[ngaylap] [date] NULL,
	[tonggia] [decimal](18, 0) NULL,
	[diachi] [nvarchar](50) NULL,
 CONSTRAINT [PK__tbl_dond__3213E83F268A181D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_news]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tieude] [nvarchar](250) NULL,
	[noidung] [nvarchar](max) NULL,
	[ngaydang] [datetime] NULL,
	[id_tk] [int] NULL,
	[anh] [nchar](255) NULL,
 CONSTRAINT [PK__tbl_news__3213E83F85C8D18B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_nhasanxuat]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_nhasanxuat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_quyen]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_quyen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_sanpham]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_sanpham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_dm] [int] NULL,
	[ten] [nvarchar](150) NULL,
	[gia] [int] NULL,
	[soluong] [int] NULL,
	[trongluong] [nchar](10) NULL,
	[ROM] [nchar](10) NULL,
	[RAM] [nchar](10) NULL,
	[thenho] [nvarchar](50) NULL,
	[camera_truoc] [nchar](10) NULL,
	[camera_sau] [nchar](10) NULL,
	[pin] [int] NULL,
	[baohanh] [nchar](50) NULL,
	[bluetooth] [int] NULL,
	[id_nsx] [int] NULL,
	[CPU] [varchar](50) NULL,
	[manhinh] [nvarchar](50) NULL,
	[tinhtrang] [int] NULL,
 CONSTRAINT [PK_tbl_sanpham] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_taikhoan]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_taikhoan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_q] [int] NULL,
	[tentaikhoan] [nvarchar](50) NULL,
	[matkhau] [varchar](30) NULL,
	[id_ttcn] [int] NULL,
	[trangthai] [bit] NULL,
 CONSTRAINT [PK__tbl_nguo__3213E83FE3021EEB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_thongtincanhan]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_thongtincanhan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](100) NULL,
	[sdt] [decimal](18, 0) NULL,
	[email] [varchar](100) NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [bit] NULL,
	[anhdaidien] [varchar](255) NULL,
	[diachi] [nvarchar](100) NULL,
 CONSTRAINT [PK__tbl_nhan__3213E83F7D0D328F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_xulydon]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_xulydon](
	[id_tk] [int] NOT NULL,
	[id_don] [varchar](12) NOT NULL,
	[tinhtrang] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_xulydon] PRIMARY KEY CLUSTERED 
(
	[id_tk] ASC,
	[id_don] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[full_personal_info]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[full_personal_info] AS
SELECT
	temp.tentaikhoan, quyen,
	tbl_thongtincanhan.ten AS 'hoten', ngaysinh, gioitinh, diachi, sdt, email, anhdaidien,
	temp.trangthai,
	temp.id, temp.id_q, temp.id_ttcn
FROM
	(SELECT
		tbl_taikhoan.*, tbl_quyen.ten AS 'quyen'
	FROM
		tbl_taikhoan
		JOIN
		tbl_quyen
		ON tbl_quyen.id = tbl_taikhoan.id_q) AS temp
	JOIN
	tbl_thongtincanhan
	ON id_ttcn = tbl_thongtincanhan.id


GO
SET IDENTITY_INSERT [dbo].[tbl_anh] ON 

INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (1, N'http://vn-test-11.slatic.net/original/026689afa37fba2ba7dbb197689f2b35.jpg_720x720q80.jpg_.webp', 1)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (2, N'http://vn-test-11.slatic.net/original/3b1834eb79e643b33b9d42a9de07b69f.jpg_720x720q80.jpg_.webp', 1)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (3, N'http://vn-test-11.slatic.net/original/14a2bfc5860bf1d4fb8eb7ed724da646.jpg_720x720q80.jpg_.webp', 2)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (4, N'http://vn-test-11.slatic.net/original/a4e5fc9339be99428aede0c7cbd4c9b5.jpg_720x720q80.jpg_.webp', 2)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (5, N'http://vn-test-11.slatic.net/original/026689afa37fba2ba7dbb197689f2b35.jpg_720x720q80.jpg_.webp', 2)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (6, N'http://vn-test-11.slatic.net/original/3b1834eb79e643b33b9d42a9de07b69f.jpg_720x720q80.jpg_.webp', 2)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (7, N'http://vn-test-11.slatic.net/p/2/apple-iphone-x-256gb-space-grey-0007-52184812-fc05f7271ca859ae3faef43088d1f49f.jpg_720x720q80.jpg_.webp', 3)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (8, N'http://vn-test-11.slatic.net/p/2/apple-iphone-x-256gb-space-grey-0007-52184812-961ee0c3631db47f1ff793452890c94b.jpg_720x720q80.jpg_.webp', 3)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (9, N'http://vn-test-11.slatic.net/p/2/apple-iphone-x-256gb-space-grey-0007-52184812-39edc3c40ac6880e5ae440f89b43a0af.jpg_720x720q80.jpg_.webp', 3)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (10, N'http://vn-test-11.slatic.net/p/2/apple-iphone-x-256gb-silver-0231-33184812-3a43e9f197455deb908fc6a1cfa569d3.jpg_720x720q80.jpg_.webp', 3)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (11, N'http://vn-test-11.slatic.net/original/2f0def0efa7a5d2873ea3db5ad8bc9f5.jpg_720x720q80.jpg_.webp', 4)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (12, N'https://www.viendongmobile.com/vnt_upload/product/09_2018/uu.png', 4)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (13, N'http://iphonedanang.net/wp-content/uploads/2018/10/iphone-xr-white-pdn.vn_.jpg', 4)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (14, N'http://cdn.shopify.com/s/files/1/0808/0067/products/title_ipxr_uh_cr_04_grande.jpg?v=1541615367', 4)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (15, N'http://vn-test-11.slatic.net/original/21f92b09dc151e61bd787e3d6ff72e50.jpg_720x720q80.jpg_.webp', 5)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (16, N'https://www.duchuymobile.com/images/detailed/11/dt-galaxy-note-9_otgh-9o.jpg', 5)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (17, N'http://vn-test-11.slatic.net/original/54f93bc28e717a5898b5236fba6dfe42.jpg_720x720q80.jpg_.webp', 5)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (18, N'http://vn-test-11.slatic.net/original/1c917447763fbd7d3610b22bf3d568cf.jpg_720x720q80.jpg_.webp', 5)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (19, N'https://www.duchuymobile.com/images/detailed/11/dt-galaxy-note-9_otgh-9o.jpg', 6)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (20, N'http://vn-test-11.slatic.net/original/a386a0ad649f1189677d966f9a165dd6.jpg_720x720q80.jpg_.webp', 6)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (21, N'http://vn-test-11.slatic.net/original/7faa4ce074640db2d6dc43150acc8c0b.jpg_720x720q80.jpg_.webp', 6)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (22, N'http://vn-test-11.slatic.net/original/508aca650eb44be19c04789f8ad7ae55.jpg_720x720q80.jpg_.webp', 6)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (23, N'http://vn-test-11.slatic.net/original/29043032bbe9af442cbe652ade9cc39c.jpg_720x720q80.jpg_.webp', 7)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (24, N'http://vn-test-11.slatic.net/original/bd5469a67c25abd1ed4e8d58a7d4e742.jpg_720x720q80.jpg_.webp', 7)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (25, N'http://vn-test-11.slatic.net/original/6408feef9dc8ea5a07305eba67b05964.jpg_720x720q80.jpg_.webp', 7)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (26, N'http://vn-test-11.slatic.net/p/2/sammsung-note8-den-hang-nhap-khau-8503-31252883-870abf8bcf0c394f51fb3cc5657e5ccb-catalog.jpg_720x720q80.jpg_.webp', 7)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (27, N'http://vn-test-11.slatic.net/p/2/samsung-galaxy-s8-plus-midnight-black-128g-ram-6g-hang-nhap-khau-0858-4061995-66414b3b910cbc014c2bef10570215d5-catalog.jpg_720x720q80.jpg_.webp', 8)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (28, N'http://vn-test-11.slatic.net/p/2/samsung-galaxy-s8-plus-midnight-black-128g-ram-6g-hang-nhap-khau-0858-4061995-050a5231cfd9802ca65b334ff53e2145-catalog.jpg_720x720q80.jpg_.webp', 8)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (29, N'http://vn-test-11.slatic.net/p/2/samsung-galaxy-s8-plus-midnight-black-128g-ram-6g-hang-nhap-khau-0858-4061995-8d42dbfd15a5444ff7a19ced9c358d35-catalog.jpg_720x720q80.jpg_.webp', 8)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (30, N'http://vn-test-11.slatic.net/p/2/dien-thoai-samsung-galaxy-s8-plus-hang-hang-phan-phoi-0471-37143772-663b2fabfb819c738deacbedd71d3c20-catalog.jpg_720x720q80.jpg_.webp', 8)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (31, N'http://vn-test-11.slatic.net/original/870b3c16177c415e63a2820738cd4c97.jpg_720x720q80.jpg_.webp', 9)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (32, N'http://vn-test-11.slatic.net/original/9ef41129bcbb20a95056ffbc68fd5937.jpg_720x720q80.jpg_.webp', 9)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (33, N'http://vn-test-11.slatic.net/original/294b9aa8d384c230afce87e3069938d8.jpg_720x720q80.jpg_.webp', 9)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (34, N'http://vn-test-11.slatic.net/original/8d83204becb734928e9cf825eb8c64e0.jpg_720x720q80.jpg_.webp', 9)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (35, N'http://vn-test-11.slatic.net/p/e2da13fbd1f2261093e077ea328c2d4c.jpg_720x720q80.jpg_.webp', 10)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (36, N'http://vn-test-11.slatic.net/p/e8e9de0568001e51a0aea1bea8d0fc22.jpg_720x720q80.jpg_.webp', 10)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (37, N'http://vn-test-11.slatic.net/p/eb12a56d3d5064fc203eef29bcce21fe.jpg_720x720q80.jpg_.webp', 10)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (38, N'http://vn-test-11.slatic.net/p/5c09c943d56e7a0ffb9205bf9bf3c7da.jpg_720x720q80.jpg_.webp', 10)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (39, N'http://vn-test-11.slatic.net/p/2/oppo-f3-plus-2062-8530475-3f6f737b86285622f429c246feaaa74b-catalog.jpg_720x720q80.jpg_.webp', 11)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (40, N'http://vn-test-11.slatic.net/p/2/oppo-f3-plus-4gb-64gb-vang-hang-phan-phoi-chinh-thuc-5727-51301571-e3a888f99584900ddd208805f85a8418-catalog.jpg_720x720q80.jpg_.webp', 11)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (41, N'https://cf.shopee.vn/file/f7141c9ed94704d94ca3d34df6bcd9df', 11)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (42, N'https://cf.shopee.vn/file/6f013c6cdbb4d961361755266605b2bf', 11)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (43, N'http://vn-test-11.slatic.net/original/c731294871c1aca222a5f5047357f2f0.jpg_720x720q80.jpg_.webp', 12)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (44, N'http://vn-test-11.slatic.net/original/de61510cb830595c01681deb0d95096c.jpg_720x720q80.jpg_.webp', 12)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (45, N'http://vn-test-11.slatic.net/original/fc4aa3c1809e8d8b6d456f38e8ef4c66.jpg_720x720q80.jpg_.webp', 12)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (46, N'http://vn-test-11.slatic.net/original/3f6c539f4f2e5f82ea0524dec4487c09.jpg_720x720q80.jpg_.webp', 12)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (47, N'http://vn-test-11.slatic.net/original/c725d0e62a8254bc87a85a60577c4f5b.jpg_720x720q80.jpg_.webp', 13)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (48, N'http://vn-test-11.slatic.net/original/21ccdab3aa86cf60d30b3f14516d2d94.jpg_720x720q80.jpg_.webp', 13)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (49, N'http://vn-test-11.slatic.net/original/da36f160cad7676903117bfbc6f2687c.jpg_720x720q80.jpg_.webp', 13)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (50, N'http://vn-test-11.slatic.net/original/9f3e3a1d05eef97b4bb0a57d887e0fe5.jpg_720x720q80.jpg_.webp', 13)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (51, N'https://www.deepspecs.com/wp-content/uploads/2018/09/1-nokia-7.1-plus-nokia-x7-600x600.jpg', 14)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (52, N'https://i2.wp.com/gsmorigin.com/wp-content/uploads/2018/09/Nokia-7.1-Plus-Nokia-X7-425x425.jpg', 14)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (53, N'https://www.bhphotovideo.com/images/images1000x1000/nokia_11ctls11a03_7_1_dual_sim_64gb_smartphone_1436796.jpg', 14)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (54, N'http://www.androidupdated.com/wp-content/uploads/2018/10/nokia-x7-nokia-7.1-plus-live-shots-600x600.jpg', 14)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (55, N'http://vn-test-11.slatic.net/original/d552332e98c38b2ffcc36661b4d8f27b.jpg_720x720q80.jpg_.webp', 15)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (56, N'http://vn-test-11.slatic.net/original/9da7d0cb48573dc66b2f17260182864d.jpg_720x720q80.jpg_.webp', 15)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (57, N'http://vn-test-11.slatic.net/original/291092a15393fefc4280f0be16fd14ad.jpg_720x720q80.jpg_.webp', 15)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (58, N'http://vn-test-11.slatic.net/original/3e4f2990c16b2d9288793aec9472fc5f.jpg_720x720q80.jpg_.webp', 15)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (59, N'http://vn-test-11.slatic.net/original/c2d29f741502a4596c27a6a2260247ef.jpg_720x720q80.jpg_.webp', 16)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (60, N'http://vn-test-11.slatic.net/original/fc2bbeab60cac8d9db243c62b289214a.jpg_720x720q80.jpg_.webp', 16)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (61, N'http://vn-test-11.slatic.net/original/e4fe919e4be1f1079caece10364acf78.jpg_720x720q80.jpg_.webp', 16)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (62, N'http://vn-test-11.slatic.net/original/9ade110e39ee5d50ad8f0b4a75ac4a44.jpg_720x720q80.jpg_.webp', 16)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (63, N'https://salt.tikicdn.com/cache/w1200/ts/product/32/55/c0/d6cff9b722e9a5b6941d03b616e4edc5.jpg', 17)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (64, N'http://vn-test-11.slatic.net/original/b5a27636af87982802a3157719ccce83.jpg_720x720q80.jpg_.webp', 17)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (65, N'https://salt.tikicdn.com/cache/w1200/ts/product/a5/4b/a4/bab13016b33745422e02c546a8b5a6a0.jpg', 17)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (66, N'https://cdn.fptshop.com.vn/Uploads/Originals/2018/5/14/636618937779295197_3.jpg', 17)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (67, N'http://vn-test-11.slatic.net/original/4f2fef214dd0e1a216f2c89e9f5144ef.jpg_720x720q80.jpg_.webp', 18)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (68, N'http://vn-test-11.slatic.net/original/748790faed0101fa1f3f88f2aca5ebd2.jpg_720x720q80.jpg_.webp', 18)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (69, N'http://vn-test-11.slatic.net/original/61e7f8716685b8b1d99295fcf557e0c1.jpg_720x720q80.jpg_.webp', 18)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (70, N'http://vn-test-11.slatic.net/original/9c939b95b2ed8ed08f471c621e3cbddc.jpg_720x720q80.jpg_.webp', 18)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (71, N'http://vn-test-11.slatic.net/p/2/dien-thoai-asus-zenfone-max-plus-m1-zb570tl-black-tang-op-lung-hang-phan-phoi-chinh-thuc-0706-52906643-6a67577cdcdea5a63ee43c33428b17e6-catalog.jpg_720x720q80.jpg_.webp', 19)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (72, N'https://cdn.fptshop.com.vn/Uploads/Originals/2018/9/19/636729634825832448_asus-zenfone-max-plus-m1-silver-3.jpg', 19)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (73, N'https://cdn.fptshop.com.vn/Uploads/Originals/2018/9/19/636729634825802448_asus-zenfone-max-plus-m1-silver-1.jpg', 19)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (74, N'https://cdn.fptshop.com.vn/Uploads/Originals/2018/9/19/636729634825552448_asus-zenfone-max-plus-m1-silver-2.jpg', 19)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (75, N'http://vn-test-11.slatic.net/p/2/asus-zenfone-3-max-55-den-hang-phan-phoi-chinh-thuc-0469-0538575-68f58a6fc9f537a899b1ba67af650248-catalog.jpg_720x720q80.jpg_.webp', 20)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (76, N'http://vn-test-11.slatic.net/p/2/asus-zenfone-3-max-5-5-vang-hang-phan-phoi-chinh-thuc-8622-3206255-baa9dc11a12b25aa01e5b5108371d9e4-catalog.jpg_720x720q80.jpg_.webp', 20)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (77, N'https://cdn.tgdd.vn/Products/Images/42/89790/asus-zenfone-3-max-zc553kl-400-460-400x460.png', 20)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (78, N'http://media3.scdn.vn/img2/2017/3_9/9LbUCK_simg_de2fe0_500x500_maxb.png', 20)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (79, N'http://vn-test-11.slatic.net/original/6df5987fdeec061e04723871b7299edd.jpg_720x720q80.jpg_.webp', 21)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (80, N'http://vn-test-11.slatic.net/original/ed2d9d66415bd9e3d6941f2a9ad35b50.jpg_720x720q80.jpg_.webp', 21)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (81, N'http://vn-test-11.slatic.net/original/e86b0e9ac9b52ec8219b8df7faf786e1.jpg_720x720q80.jpg_.webp', 21)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (82, N'http://vn-test-11.slatic.net/original/ceced576a9c73c76a2ed7a22dc76e6f8.jpg_720x720q80.jpg_.webp', 21)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (83, N'http://vn-test-11.slatic.net/original/5bcbdc52f45ec639a88175ee4a322de1.jpg_720x720q80.jpg_.webp', 22)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (84, N'http://vn-test-11.slatic.net/original/4f1ad130bc648c08e851fb16af22de30.jpg_720x720q80.jpg_.webp', 22)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (85, N'http://vn-test-11.slatic.net/original/48182baa3d24e0abae6715d7248effc4.jpg_720x720q80.jpg_.webp', 22)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (86, N'http://vn-test-11.slatic.net/original/e7edc6b70982802bdf087387539b76a1.jpg_720x720q80.jpg_.webp', 22)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (87, N'http://vn-test-11.slatic.net/original/e76ef86d1f4a6bc04c0feac8b3992604.jpg_720x720q80.jpg_.webp', 23)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (88, N'http://vn-test-11.slatic.net/original/c7fd672c24db8bdba390d8c8178f4c45.jpg_720x720q80.jpg_.webp', 23)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (89, N'http://vn-test-11.slatic.net/original/ffe8661fa237221abab9d82b01a74737.jpg_720x720q80.jpg_.webp', 23)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (90, N'http://vn-test-11.slatic.net/original/c61c07103cb24f819f1b1d2c161b0a3f.jpg_720x720q80.jpg_.webp', 23)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (91, N'http://vn-test-11.slatic.net/original/7dcdaeb5a0f8039702f0958c7ae52f24.jpg_720x720q80.jpg_.webp', 24)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (92, N'http://vn-test-11.slatic.net/original/92ec2abd8e7f77b384d1aefc028aea5d.jpg_720x720q80.jpg_.webp', 24)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (93, N'http://vn-test-11.slatic.net/original/1ea28e2fba7a54b93f84becabaa073f5.jpg_720x720q80.jpg_.webp', 24)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (94, N'http://vn-test-11.slatic.net/original/73918aed006eb7c7ff4e9d5d237a2912.jpg_720x720q80.jpg_.webp', 24)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (95, N'http://vn-test-11.slatic.net/p/2/apple-ipad-105-inch-wi-fi-64gb-gold-1923-02331753-5bd4a91d0feff00624d394d79ba1c352-catalog.jpg_720x720q80.jpg_.webp', 25)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (96, N'http://vn-test-11.slatic.net/p/2/apple-ipad-105-inch-wi-fi-64gb-gold-1930-02331753-e256e058efd9599feeb8e149c01716f7-catalog.jpg_720x720q80.jpg_.webp', 25)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (97, N'https://cdn.tgdd.vn/Products/Images/522/106036/ipad-pro-105-inch-wifi-64gb-2017-400-400x460.png', 25)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (98, N'https://cdn.tgdd.vn/Products/Images/522/106036/ipad-pro-105-inch-wifi-64gb-2017-xam-2-org.jpg', 25)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (99, N'http://vn-test-11.slatic.net/original/854434013535c26d344ff1a6d2b89887.jpg_720x720q80.jpg_.webp', 26)
GO
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (100, N'http://vn-test-11.slatic.net/original/036b82962428764a97f37a522d64202b.jpg_720x720q80.jpg_.webp', 26)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (101, N'http://vn-test-11.slatic.net/original/73b00f738cfb6ba73a215650c3e6335e.jpg_720x720q80.jpg_.webp', 26)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (102, N'http://vn-test-11.slatic.net/original/6099d3ca657c9b7817288c447634f480.jpg_720x720q80.jpg_.webp', 26)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (103, N'http://media3.scdn.vn/img2/2018/4_6/Y0y3pd_simg_de2fe0_500x500_maxb.jpg', 27)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (104, N'http://media3.scdn.vn/img2/2018/4_6/ylWVB9_simg_de2fe0_500x500_maxb.jpg', 27)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (105, N'http://media3.scdn.vn/img2/2018/4_6/0lWFxp_simg_de2fe0_500x500_maxb.jpg', 27)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (106, N'http://media3.scdn.vn/img2/2018/4_6/I3PdDi_simg_de2fe0_500x500_maxb.jpg', 27)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (107, N'https://shopdunk.com/wp-content/uploads/2016/11/ipad-air-2-den-4g-1.png', 28)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (108, N'https://shopdunk.com/wp-content/uploads/2016/11/ipad-air-2-den-4g-2.png', 28)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (109, N'https://shopdunk.com/wp-content/uploads/2016/11/ipad-air-2-den-4g-3.png', 28)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (110, N'https://shopdunk.com/wp-content/uploads/2016/11/ipad-air-2-den-4g-4.png', 28)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (111, N'http://vn-test-11.slatic.net/original/cf696561bfc2297c8cc8afd15378d1a4.jpg_720x720q80.jpg_.webp', 29)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (112, N'http://vn-test-11.slatic.net/p/may-tinh-bang-samsung-galaxy-tab-a6-p585-16gb-trang-hang-phan-phoi-chinh-thuc-4844-5752092-312d4c7dcd5da24beae6c552506b2227-catalog.jpg_720x720q80.jpg_.webp', 29)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (113, N'http://vn-test-11.slatic.net/p/may-tinh-bang-samsung-galaxy-tab-a6-p585-16gb-trang-hang-phan-phoi-chinh-thuc-4844-5752092-3a54126ce7179fbe5a3809ecf2a598eb-catalog.jpg_720x720q80.jpg_.webp', 29)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (114, N'http://vn-test-11.slatic.net/p/may-tinh-bang-samsung-galaxy-tab-a6-p585-16gb-trang-hang-phan-phoi-chinh-thuc-4844-5752092-4e9600338a1e5b7ce3326d36a7d77df4-catalog.jpg_720x720q80.jpg_.webp', 29)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (115, N'https://technave.com/data/files/mall/article/201504260203548475.jpg', 30)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (116, N'https://dienmaycholon.vn/public/picture/product//product7325/product_7325_8.png', 30)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (117, N'http://vn-test-11.slatic.net/original/f98ff2682bd203d0c305b81295912da2.jpg_720x720q80.jpg_.webp', 30)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (118, N'http://vn-test-11.slatic.net/original/d413206f536e2e2f5348b70ffb4b8f33.jpg_720x720q80.jpg_.webp', 30)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (119, N'https://s.sdgcdn.com/7/2018/08/254e798f8237d88d9e2280ffe753e3ecaa906c7c_ae_galaxy_tabs4_t830_sm_t830nzaaxsg_frontgray_110880786-600x600.jpg', 31)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (120, N'http://cdn.shopify.com/s/files/1/1374/6193/products/001025-samsung-galaxy-tab-s4-grey-2_fc03f606-0110-4884-a1d1-829d560b8962_grande.jpg?v=1536438651', 31)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (121, N'http://khuongvietmobile.com/wp-content/uploads/2018/09/tabs4.jpg', 31)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (122, N'https://www.maxmovil.com/media/catalog/product/cache/1/thumbnail/600x/17f82f742ffe127f42dca9de82fb58b1/S/M/SMT230B.jpg', 31)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (123, N'https://img.us.news.samsung.com/us/wp-content/uploads/2015/08/19142900/8_INCH_WHITE-TAB-S2.jpg', 32)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (124, N'https://chinthanagsm.lk/wp-content/uploads/2017/07/Galaxy-Tab-e.png', 32)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (125, N'https://cdn.tgdd.vn/Products/Images/522/184380/samsung-galaxy-tab-a-105-inch-ava-600x600.jpg', 32)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (126, N'https://i.pinimg.com/originals/9e/b0/82/9eb082f9535a282e4270a1856fcbb531.jpg', 32)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (127, N'http://images.mobilecity.vn/media/images/2016/12/Nokia-N1-silver-white.jpg', 33)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (128, N'https://nhattao.cdnforo.com/attachment-files/2018/03/10202462_dan-man-hinh-cuong-luc-nokia-n1-1_bengovn.jpg', 33)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (129, N'http://www.evybuy.com/images//Tablet/Tablet/sku58828.jpg', 33)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (130, N'https://img.staticbg.com/thumb/water/2014/bobby/08/SKU232396/1.jpg', 33)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (131, N'http://images.mobilecity.vn/media/images/2016/12/Nokia-N1-silver-white.jpg', 34)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (132, N'https://nhattao.cdnforo.com/attachment-files/2018/03/10202462_dan-man-hinh-cuong-luc-nokia-n1-1_bengovn.jpg', 34)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (133, N'http://media3.scdn.vn/img2/2018/5_7/yJOdKY_simg_d0daf0_800x1200_max.jpg', 34)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (134, N'http://media3.scdn.vn/img2/2018/5_7/7aVvFq_simg_d0daf0_800x1200_max.jpg', 34)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (135, N'http://media3.scdn.vn/img2/2018/7_20/Em5AwQ_simg_d0daf0_800x1200_max.jpg', 35)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (136, N'http://media3.scdn.vn/img2/2018/7_20/lpdGaw_simg_d0daf0_800x1200_max.jpg', 35)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (137, N'http://media3.scdn.vn/img2/2018/7_20/h6qdMM_simg_d0daf0_800x1200_max.jpg', 35)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (138, N'http://media3.scdn.vn/img2/2018/7_20/uRm4bZ_simg_d0daf0_800x1200_max.jpg', 35)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (139, N'http://image2.geekbuying.com/ggo_pic/2018-06-25/2018062501210281nyziuej.jpg', 36)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (140, N'http://image2.geekbuying.com/ggo_pic/2018-06-25/2018062501210451a9iw5zr.jpg', 36)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (141, N'http://image2.geekbuying.com/ggo_pic/2018-06-25/2018062501210561bl2g4qt.jpg', 36)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (142, N'http://image2.geekbuying.com/ggo_pic/2018-06-25/2018062501211161bzdwu3k.jpg', 36)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (143, N'https://images.mobilecity.vn/media/images/2018/11/medium-xiaomi-mipad-3-3.jpg', 37)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (144, N'https://images.mobilecity.vn/media/images/2018/11/medium-xiaomi-mipad-3-2.jpg', 37)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (145, N'https://images.mobilecity.vn/media/images/2018/11/medium-xiaomi-mipad-3-1.jpg', 37)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (146, N'https://images.mobilecity.vn/media/images/2016/12/Danh-gia-man-hinh-Xiaomi-Mipad-3-xach-tay-001.jpg', 37)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (147, N'http://vn-test-11.slatic.net/original/026689afa37fba2ba7dbb197689f2b35.jpg_720x720q80.jpg_.webp', 1)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (148, N'http://vn-test-11.slatic.net/original/026689afa37fba2ba7dbb197689f2b35.jpg_720x720q80.jpg_.webp', 1)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (151, N'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/5543/5543300ld.jpg;maxHeight=640;maxWidth=550', 40)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (152, N'https://images-na.ssl-images-amazon.com/images/I/712ITJsF8NL._SL1500_.jpg', 41)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (153, N'https://images-na.ssl-images-amazon.com/images/I/712ITJsF8NL._SL1500_.jpg', 41)
SET IDENTITY_INSERT [dbo].[tbl_anh] OFF
SET IDENTITY_INSERT [dbo].[tbl_danhmuc] ON 

INSERT [dbo].[tbl_danhmuc] ([id], [ten]) VALUES (1, N'Điện Thoại')
INSERT [dbo].[tbl_danhmuc] ([id], [ten]) VALUES (2, N'Tablet    ')
INSERT [dbo].[tbl_danhmuc] ([id], [ten]) VALUES (3, N'Phụ Kiện  ')
INSERT [dbo].[tbl_danhmuc] ([id], [ten]) VALUES (5, N'Khuyến Mại')
SET IDENTITY_INSERT [dbo].[tbl_danhmuc] OFF
SET IDENTITY_INSERT [dbo].[tbl_news] ON 

INSERT [dbo].[tbl_news] ([id], [tieude], [noidung], [ngaydang], [id_tk], [anh]) VALUES (1, N'Asus Zenfone Max Pro M1 đã lên kệ', N'Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệAsus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ', CAST(N'2010-12-12 00:00:00.000' AS DateTime), 2, N'https://static.digit.in/product/04ea8fcf049e4cf545ba96d0dac190bd94e56a18.jpeg                                                                                                                                                                                  ')
INSERT [dbo].[tbl_news] ([id], [tieude], [noidung], [ngaydang], [id_tk], [anh]) VALUES (2, N'ASUS ZenFone Max Pro M2 3GB RAM Chính hãng', N'
1
2
Sau >
Trang 1 / 2	

        Mình cũng đã trải nghiệm Galaxy S10+ được một thời gian dài và có rất nhiều cảm xúc với chiếc máy này so với bất kỳ chiếc Samsung nào trước đây. Trong bài viết này, mình sẽ chia sẻ với anh em 5 điểm mà mình yêu thích nhất trên chiếc máy này, cũng là 5 điểm đáng giá cho ai lựa chọn Galaxy S10+. Tất nhiên, một chiếc máy không thể hoàn hảo. Ở bài viết tiếp theo, mình sẽ chia sẻ những điểm chưa hài lòng với anh em sau. Ngay từ thông số, chiếc màn hình này đã ấn tượng với kích thước 6.4" QHD+, hỗ trợ HDR10+. Trải nghiệm thực tế, chiếc màn hình này trong, độ sáng cao, góc nhìn tốt, sắc nét với chi tiết cao và tái tạo màu sắc chính xác. Tổng thể thì đây là một trong những chiếc màn hình smartphone đẹp nhất.

Kết hợp với thiết kế cong nhẹ và nốt ruồi Infinity-O để mang đến một chiếc màn hình với 4 viền mỏng thì trải nghiệm màn hình trên S10+ thật sự là 1 điểm cộng đáng giá. Mình hoàn toàn không thấy ảnh hưởng hay khó chịu gì nhiều bởi nốt ruồi (dù nốt ruồi của S10+ có phần to hơn tẹo so với S10) bởi vị trí đó thường không phải là vị trí tập trung mắt và nó cũng không làm ảnh hưởng gì nhiều đến nội dung đang xem cả. Hơn nữa, anh em còn có thể làm nhiều trò vui vẻ với nốt ruồi này như hiển thị phần trăm pin, cài hình nền độc đáo thú vị.

Ngoài ra, S10+ là điện thoại đầu tiên hỗ trợ HDR10+. Khi xem nội dung có hỗ trợ HDR10+, độ sáng tối sẽ còn thay đổi theo nội dung đang hiển thị (sáng có nhiều sắc độ, không phải đều thành sáng trắng hết hay đen cũng nhiều sắc độ chứ không phải đều tối đen hết).
 Camera selfie của S10+ có đến 2 cái với nốt ruồi bự hơn bao gồm 1 camera chính 10MP và 1 camera phụ đo chiều sâu 8MP. Chính điều này, cho phép chúng ta chụp ảnh selfie xóa phông trực tiếp - tức là chụp Live Focus với camera trước, có thể điều chỉnh mức độ xóa phông trong khi chụp.

Ngoài ra, camera selfie cũng chia thành góc thường và góc rộng. Dù góc rộng không thuộc dạng siêu rộng, rộng thêm được bao nhiêu nhưng ít ra cho chúng ta 2 lựa chọn. Có lúc bạn muốn lấy thêm khung cảnh xung quanh, có lúc bạn muốn crop lại và không muốn dính ai đó vào khung hình.

Cùng với cải tiến về làm đẹp, xử lý da người trắng, làm đẹp tự nhiên và những hiệu ứng xóa phông y như camera sau, quay video 4K thì camera selfie của S10+ cũng trở thành 1 điểm cộng của chiếc máy này. Xóa đi khái niệm điện thoại Samsung không có thế mạnh về selfie.', CAST(N'2019-04-17 15:28:00.000' AS DateTime), 3, N'https://photo2.tinhte.vn/data/attachment-files/2019/04/4623140_cover-top5s10_2.jpg                                                                                                                                                                             ')
INSERT [dbo].[tbl_news] ([id], [tieude], [noidung], [ngaydang], [id_tk], [anh]) VALUES (3, N'Điện Thoại Samsung Galaxy Note 9 (128GB/6GB) chỉ còn  17.242.500đ', N'Samsung Galaxy Note 9 sở hữu thiết kế hợp kim nguyên khối sang trọng kết hợp khung viền kim loại sắc sảo và chắc chắn với phong cách thiết kế đa diện. Camera sau ẩn vào lưng máy cho trải nghiệm hoàn toàn mượt mà và vô cùng quyến rũ. Trang bị màn hình Super AMOLED 6.4inch mang đến trải nghiệm thị giác không giới hạn kết hợp độ phân giải Quad HD+ (2K+) tạo nên sự đột phá so các dòng điện thoại

Chi tiết chương trình

    Bắt đầu từ ngày 31/10/2018 - Đến khi hết sản phẩm khuyến mãi
    Tiết kiệm chi phí lên đến 25%
    Cam kết hàng chính hãng
    Bảo hành 12 tháng
    Miễn phí vận chuyển

Sơ lược sản phẩm

    Thiết kế: Nguyên khối, Màn hình vô cực không viền
    Màn hình: 6.4 inch 2960 x 1440 pixels
    Camera Trước: 8MP
    Camera Sau: 12 MP Dual-camera
    CPU: Exynos 9810 8 nhân 64 bit
    Bộ Nhớ: 128GB
    RAM: 6GB
    SIM tương thích: 2 Nano SIM
    Tính năng: Mở khóa bằng vân tay, nhận dạng khuôn mặt
', CAST(N'2018-10-31 00:00:00.000' AS DateTime), 2, N'https://photo2.tinhte.vn/data/attachment-files/2018/10/4468249_ast.jpg                                                                                                                                                                                         ')
INSERT [dbo].[tbl_news] ([id], [tieude], [noidung], [ngaydang], [id_tk], [anh]) VALUES (4, N'Đồng hồ Samsung Gear Sport chỉ còn 5.790.000đ', N'

        Samsung Gear Sport đặt các mục tiêu về sức khoẻ, ăn kiêng trên điện thoại của bạn và bắt đầu theo dõi sự tiến triển ngay trên cổ tay: Gear Sport giúp bạn giữ cân bằng và theo dõi lượng calo. Nó cũng cung cấp những lời khuyên và cái nhìn sâu sắc mà bạn có thể sử dụng để hoạch định kế hoạch cho mình.

        Chi tiết chương trình
            Bắt đầu từ ngày 31/08/2018 - Đến khi hết sản phẩm khuyến mãi
            Tiết kiệm chi phí lên đến 11%
            Cam kết hàng chính hãng
            Bảo hành 12 tháng
            Miễn phí vận chuyển
        Sơ lược sản phẩm
            Là dòng sản phẩm mới của Samsung với chuẩn chống nước lên tới 50m.
            Thu thập các chỉ số vận động của bạn cả ngày và dễ dàng tính toán ra mức tiêu hao năng lượng cũng như hướng dẫn tập luyện.
            Tương thích với chuẩn thanh toán Samsung Pay, bạn sẽ dễ dàng thanh toán chỉ với một vài thao tác trên chiếc đồng hồ.
            Kiểm tra và cập nhật các thông tin thông báo, dễ dàng trả lời lại cuộc gọi cũng như tin nhắn chỉ bằng cách xoay vòng benzel.
', CAST(N'2018-10-31 00:00:00.000' AS DateTime), 2, N'https://photo2.tinhte.vn/data/attachment-files/2018/08/4413655_ss.jpg                                                                                                                                                                                          ')
INSERT [dbo].[tbl_news] ([id], [tieude], [noidung], [ngaydang], [id_tk], [anh]) VALUES (5, N'iPad Pro 11 inch (2018) 64GB Wifi chỉ còn 19.490.000đ', N'iPad Pro 11 inch (2018) 64GB Wifi được trang bị phần viền mỏng đều ở cả bốn cạnh, loại bỏ phím home vật lý truyền thống và tích hợp thêm công nghệ nhận diện khuôn mặt Face ID. Cấu hình trên iPad Pro được nâng cấp để khiến nó mạnh hơn cả về xử lý ứng dụng lẫn xử lý đồ họa. iPad Pro được trang bị chip A12X Bionic trên công nghệ 7nm, chip này có tổng cộng 10 tỉ bóng bán dẫn với 8 nhân (4 nhân ở hiệu năng cao và 4 nhân bình thường).

Chi tiết chương trình

    Bắt đầu từ ngày 18/04/2019 - Đến khi hết sản phẩm khuyến mãi
    Tiết kiệm chi phí lên đến 15%
    Cam kết hàng chính hãng
    Bảo hành 12 tháng
    Miễn phí vận chuyển

Sơ lược sản phẩm

    Thiết kế: Siêu mỏng, loại bỏ nút home
    Màn hình: 11 inch (2388 x1668), 264 ppi
    Camera Trước/Sau: 7MP Portrait Mode/Lighting - 12MP , f/1.8 Zoom quang 5x, Smart HDR
    CPU: A12X Bionic 64bit, Neural Engine, M12, 7 nhân GPU
    Bộ Nhớ: 64GB
    RAM: 4GB
    Pin: 29.37Wh
', CAST(N'2019-04-18 17:27:00.000' AS DateTime), 3, N'https://photo2.tinhte.vn/data/attachment-files/2019/04/4622230_ast.jpg                                                                                                                                                                                         ')
SET IDENTITY_INSERT [dbo].[tbl_news] OFF
SET IDENTITY_INSERT [dbo].[tbl_nhasanxuat] ON 

INSERT [dbo].[tbl_nhasanxuat] ([id], [ten]) VALUES (1, N'Apple')
INSERT [dbo].[tbl_nhasanxuat] ([id], [ten]) VALUES (2, N'Samsung')
INSERT [dbo].[tbl_nhasanxuat] ([id], [ten]) VALUES (3, N'Oppo')
INSERT [dbo].[tbl_nhasanxuat] ([id], [ten]) VALUES (4, N'Nokia')
INSERT [dbo].[tbl_nhasanxuat] ([id], [ten]) VALUES (5, N'Asus')
INSERT [dbo].[tbl_nhasanxuat] ([id], [ten]) VALUES (6, N'Xiaomi')
SET IDENTITY_INSERT [dbo].[tbl_nhasanxuat] OFF
SET IDENTITY_INSERT [dbo].[tbl_quyen] ON 

INSERT [dbo].[tbl_quyen] ([id], [ten]) VALUES (1, N'admin')
INSERT [dbo].[tbl_quyen] ([id], [ten]) VALUES (2, N'nhanvien')
INSERT [dbo].[tbl_quyen] ([id], [ten]) VALUES (3, N'khachhang')
SET IDENTITY_INSERT [dbo].[tbl_quyen] OFF
SET IDENTITY_INSERT [dbo].[tbl_sanpham] ON 

INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (1, 1, N'Iphone Xs', 35000001, 13, N'101       ', N'1GB       ', N'4GB       ', N'null', N'8         ', N'13        ', 3000, N'10                                                ', 6, 1, N'Apple A13', N'5.9', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (2, 1, N'Iphone Xs Max', 40000000, 9, N'100       ', N'512       ', N'4         ', N'null', N'7         ', N'12        ', 3174, N'12                                                ', 5, 1, N'Apple A12', N'6.5', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (3, 1, N'Iphone X', 25000000, 10, N'100       ', N'256       ', N'3         ', N'0', N'7         ', N'12        ', 2716, N'12                                                ', 5, 1, N'Apple A11', N'5.8', 0)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (4, 1, N'Iphone Xr', 30000000, 10, N'100       ', N'256       ', N'3         ', N'0', N'7         ', N'12        ', 2942, N'12                                                ', 5, 1, N'Apple A12', N'6.1', 0)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (5, 1, N'Samsung Galaxy Note 9', 30000000, 10, N'100       ', N'512       ', N'8         ', N'1', N'8         ', N'12        ', 4000, N'12                                                ', 5, 2, N'Exynos 9810', N'6.4', 0)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (6, 1, N'Samsung Galaxy S9+', 25000000, 10, N'100       ', N'128       ', N'6         ', N'1', N'8         ', N'12        ', 3500, N'12                                                ', 5, 2, N'Exynos 9810', N'6.2', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (7, 1, N'Samsung Galaxy Note 8', 20000000, 10, N'100       ', N'64        ', N'6         ', N'1', N'8         ', N'12        ', 3300, N'12                                                ', 5, 2, N'Exynos 8895', N'6.3', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (8, 1, N'Samsung Galaxy S8+', 18000000, 10, N'100       ', N'64        ', N'4         ', N'1', N'8         ', N'12        ', 3500, N'12                                                ', 5, 2, N'Exynos 8895', N'6.2', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (9, 1, N'Oppo Find X', 20000000, 10, N'100       ', N'256       ', N'8         ', N'1', N'25        ', N'20        ', 3730, N'12                                                ', 5, 3, N'Snapdragon 845', N'6.42', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (10, 1, N'Oppo R17 Pro', 17000000, 10, N'100       ', N'128       ', N'8         ', N'1', N'25        ', N'20        ', 3700, N'12                                                ', 5, 3, N'Snapdragon 710', N'6.4', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (11, 1, N'Oppo F3+', 10000000, 10, N'100       ', N'64        ', N'6         ', N'1', N'25        ', N'16        ', 3500, N'12                                                ', 4, 3, N'Media Tek P60', N'6.3', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (12, 1, N'Oppo F7', 7000000, 10, N'100       ', N'64        ', N'6         ', N'1', N'25        ', N'16        ', 3400, N'12                                                ', 4, 3, N'MediaTek P60', N'6.23', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (13, 1, N'Nokia 7+', 8000000, 10, N'100       ', N'64        ', N'4         ', N'1', N'12        ', N'16        ', 3800, N'12                                                ', 5, 4, N'Snapdragon 660', N'6', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (14, 1, N'Nokia X7', 6000000, 10, N'100       ', N'64        ', N'4         ', N'1', N'12        ', N'20        ', 3500, N'12                                                ', 4, 4, N'Snapdragon 710', N'6.18', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (15, 1, N'Nokia X6', 5000000, 10, N'100       ', N'64        ', N'6         ', N'1', N'16        ', N'16        ', 3060, N'12                                                ', 4, 4, N'Snapdragon 636', N'5.8', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (16, 1, N'Nokia 6.1+', 7000000, 10, N'100       ', N'64        ', N'4         ', N'1', N'16        ', N'16        ', 3060, N'12                                                ', 5, 4, N'Snapdragon 636', N'5.8', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (17, 1, N'Asus 5z', 11000000, 10, N'100       ', N'128       ', N'6         ', N'1', N'8         ', N'12        ', 3300, N'12                                                ', 5, 5, N'Snapdragon 845', N'6.2', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (18, 1, N'Asus Max Pro M1', 5000000, 10, N'100       ', N'64        ', N'4         ', N'1', N'5         ', N'16        ', 5000, N'12                                                ', 4, 5, N'Snapdragon 636', N'6', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (19, 1, N'Asus Max Plus M1', 3000000, 10, N'100       ', N'32        ', N'3         ', N'1', N'8         ', N'16        ', 4130, N'12                                                ', 4, 5, N'MTK', N'5.7', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (20, 1, N'Asus 3 Max', 4000000, 10, N'100       ', N'32        ', N'3         ', N'1', N'8         ', N'16        ', 4100, N'12                                                ', 4, 5, N'Snapdragon 430', N'5.5', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (21, 1, N'Xiaomi Mi Mix 2S', 14000000, 10, N'100       ', N'128       ', N'8         ', N'1', N'12        ', N'16        ', 3400, N'12                                                ', 5, 6, N'Snapdragon 845', N'6', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (22, 1, N'Xiaomi Mi 8 Pro', 15000000, 10, N'100       ', N'128       ', N'8         ', N'1', N'12        ', N'20        ', 3000, N'12                                                ', 5, 6, N'Snapdragon 845', N'6.21', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (23, 1, N'Xiaomi Mi 8', 12000000, 10, N'100       ', N'64        ', N'6         ', N'1', N'12        ', N'20        ', 3400, N'12                                                ', 5, 6, N'Snapdragon 845', N'6.21', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (24, 1, N'Xiaomi Note 6 Pro', 6000000, 10, N'100       ', N'64        ', N'4         ', N'1', N'12        ', N'20        ', 4000, N'12                                                ', 4, 6, N'Snapdragon 636', N'6.26', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (25, 2, N'Ipad Pro 10.5', 20000000, 10, N'200       ', N'512       ', N'4         ', N'0', N'7         ', N'12        ', 30400, N'12                                                ', 5, 1, N'Apple A10X', N'10.5', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (26, 2, N'Ipad 2018', 15000000, 10, N'200       ', N'128       ', N'2         ', N'0', N'2         ', N'8         ', 32400, N'12                                                ', 5, 1, N'Apple A10', N'9.7', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (27, 2, N'Ipad 4', 5000000, 10, N'200       ', N'64        ', N'1         ', N'0', N'2         ', N'5         ', 11500, N'12                                                ', 4, 1, N'Apple A6X', N'9.7', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (28, 2, N'Ipad Air 2', 7000000, 10, N'200       ', N'32        ', N'2         ', N'0', N'2         ', N'8         ', 7340, N'12                                                ', 4, 1, N'Apple A8X', N'9.7', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (29, 2, N'Samsung Galaxy Tab A6', 8000000, 10, N'200       ', N'16        ', N'3         ', N'1', N'2         ', N'8         ', 7300, N'12                                                ', 4, 2, N'Exynos 7870', N'10.1', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (30, 2, N'Samsung Galaxy Tab A8', 6000000, 10, N'200       ', N'16        ', N'2         ', N'1', N'5         ', N'8         ', 5000, N'12                                                ', 4, 2, N'MSM 8917', N'8', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (31, 2, N'Samsung Galaxy Tab S4', 18000000, 10, N'200       ', N'64        ', N'4         ', N'1', N'8         ', N'13        ', 7300, N'12                                                ', 5, 2, N'MSM 8998', N'10.5', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (32, 2, N'Samsung Galaxy TabS', 10000000, 10, N'200       ', N'16        ', N'3         ', N'1', N'2         ', N'8         ', 7900, N'12                                                ', 4, 2, N'Intel Core', N'10.5', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (33, 2, N'Nokia N1', 4000000, 10, N'200       ', N'32        ', N'2         ', N'1', N'5         ', N'8         ', 5300, N'12                                                ', 4, 4, N'Intel Atom Z3580', N'7.9', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (34, 2, N'Asus Zenpad Z8', 3000000, 10, N'200       ', N'16        ', N'2         ', N'1', N'2         ', N'8         ', 4600, N'12                                                ', 4, 5, N'Snapdragon 650', N'8', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (35, 2, N'Asus Zenpad Z10', 6000000, 10, N'200       ', N'32        ', N'3         ', N'1', N'5         ', N'8         ', 7800, N'12                                                ', 4, 5, N'Snapdragon 650', N'9.7', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (36, 2, N'Xiaomi Mipad 3', 5000000, 10, N'200       ', N'64        ', N'4         ', N'1', N'5         ', N'13        ', 6600, N'12                                                ', 4, 6, N'MediaTek MT8176', N'7.9', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (37, 2, N'Xiaomi Mipad 4', 6000000, 10, N'200       ', N'64        ', N'4         ', N'1', N'5         ', N'13        ', 6000, N'12                                                ', 4, 6, N'Snapdragon 660', N'8', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (40, 3, N'apple watch', 105222, 3, N'100       ', N'256       ', N'4         ', N'null', N'          ', N'          ', 1000, N'12                                                ', 1, 1, N'512', N'5', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (41, 3, N'oppo watch', 11111, 3, N'100       ', N'512       ', N'4         ', N'null', N'          ', N'          ', 1500, N'12                                                ', 1, 3, N'12', N'5', 1)
SET IDENTITY_INSERT [dbo].[tbl_sanpham] OFF
SET IDENTITY_INSERT [dbo].[tbl_taikhoan] ON 

INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (1, 1, N'admin', N'admin', 1, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (2, 2, N'tranvana', N'ta123', 2, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (3, 2, N'tranvanb', N'tb123', 3, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (4, 2, N'tranvanc', N'tc123', 4, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (5, 3, N'levana', N'la123', 5, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (6, 3, N'levanb', N'lb123', 6, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (7, 3, N'levanc', N'lc123', 7, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (8, 3, N'giaplinux', N'giaplinux', 10, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (9, 3, N'test', N'aaa', 11, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (11, 3, N'user1', N'12345678', 13, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (12, 3, N'user2', N'87654321', 14, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (13, 3, N'quan', N'111', 15, 1)
SET IDENTITY_INSERT [dbo].[tbl_taikhoan] OFF
SET IDENTITY_INSERT [dbo].[tbl_thongtincanhan] ON 

INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (1, N'Nguyễn Văn Lộc', CAST(353237025 AS Decimal(18, 0)), N'mr.jerry0997@gmail.com', CAST(N'1997-02-01' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (2, N'Trần Văn B', CAST(476964655 AS Decimal(18, 0)), N'tranvanb@gmail.com', CAST(N'1997-02-02' AS Date), 0, N'https://img.icons8.com/bubbles/2x/user.png', N'Bắc giang')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (3, N'Trần Văn C', CAST(31514656 AS Decimal(18, 0)), N'tranvanc@gmail.com', CAST(N'1997-02-03' AS Date), 0, N'https://img.icons8.com/bubbles/2x/user.png', N'Bắc Ninh')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (4, N'Đoàn Văn Hậu', CAST(865768755 AS Decimal(18, 0)), N'hau@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Nghệ an')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (5, N'Bùi Tiến Dũng', CAST(243543236 AS Decimal(18, 0)), N'dung@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'đà lạy')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (6, N'Quang Hải', CAST(352342354 AS Decimal(18, 0)), N'lam@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Lạng Sơn')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (7, N'Văn Lâm', CAST(5648651 AS Decimal(18, 0)), N'lam@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà Giang')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (8, N'Anh Đức', CAST(284683223 AS Decimal(18, 0)), N'duc@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'THanh Hóa')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (10, N'aaa', CAST(1 AS Decimal(18, 0)), N'a@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (11, N'test', CAST(1 AS Decimal(18, 0)), N'a@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (12, N'test', CAST(11 AS Decimal(18, 0)), N'a@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (13, N'user1', CAST(1 AS Decimal(18, 0)), N'user1@local', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (14, N'user2', CAST(1 AS Decimal(18, 0)), N'user2@local', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (15, N'quan', CAST(1 AS Decimal(18, 0)), N'korangar910@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
SET IDENTITY_INSERT [dbo].[tbl_thongtincanhan] OFF
ALTER TABLE [dbo].[tbl_anh]  WITH CHECK ADD  CONSTRAINT [FK_tbl_anh_tbl_sanpham] FOREIGN KEY([id_sp])
REFERENCES [dbo].[tbl_sanpham] ([id])
GO
ALTER TABLE [dbo].[tbl_anh] CHECK CONSTRAINT [FK_tbl_anh_tbl_sanpham]
GO
ALTER TABLE [dbo].[tbl_chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chitietdonhang_tbl_dondathang] FOREIGN KEY([id_don])
REFERENCES [dbo].[tbl_dondathang] ([id])
GO
ALTER TABLE [dbo].[tbl_chitietdonhang] CHECK CONSTRAINT [FK_tbl_chitietdonhang_tbl_dondathang]
GO
ALTER TABLE [dbo].[tbl_chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chitietdonhang_tbl_sanpham] FOREIGN KEY([id_sp])
REFERENCES [dbo].[tbl_sanpham] ([id])
GO
ALTER TABLE [dbo].[tbl_chitietdonhang] CHECK CONSTRAINT [FK_tbl_chitietdonhang_tbl_sanpham]
GO
ALTER TABLE [dbo].[tbl_dondathang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_dondathang_tbl_taikhoan] FOREIGN KEY([id_tk])
REFERENCES [dbo].[tbl_taikhoan] ([id])
GO
ALTER TABLE [dbo].[tbl_dondathang] CHECK CONSTRAINT [FK_tbl_dondathang_tbl_taikhoan]
GO
ALTER TABLE [dbo].[tbl_news]  WITH CHECK ADD  CONSTRAINT [FK_tbl_news_tbl_taikhoan] FOREIGN KEY([id_tk])
REFERENCES [dbo].[tbl_taikhoan] ([id])
GO
ALTER TABLE [dbo].[tbl_news] CHECK CONSTRAINT [FK_tbl_news_tbl_taikhoan]
GO
ALTER TABLE [dbo].[tbl_sanpham]  WITH CHECK ADD  CONSTRAINT [FK_tbl_sanpham_tbl_danhmuc] FOREIGN KEY([id_dm])
REFERENCES [dbo].[tbl_danhmuc] ([id])
GO
ALTER TABLE [dbo].[tbl_sanpham] CHECK CONSTRAINT [FK_tbl_sanpham_tbl_danhmuc]
GO
ALTER TABLE [dbo].[tbl_sanpham]  WITH CHECK ADD  CONSTRAINT [FK_tbl_sanpham_tbl_nhasanxuat] FOREIGN KEY([id_nsx])
REFERENCES [dbo].[tbl_nhasanxuat] ([id])
GO
ALTER TABLE [dbo].[tbl_sanpham] CHECK CONSTRAINT [FK_tbl_sanpham_tbl_nhasanxuat]
GO
ALTER TABLE [dbo].[tbl_taikhoan]  WITH CHECK ADD  CONSTRAINT [FK_tbl_taikhoan_tbl_nhanvien] FOREIGN KEY([id_ttcn])
REFERENCES [dbo].[tbl_thongtincanhan] ([id])
GO
ALTER TABLE [dbo].[tbl_taikhoan] CHECK CONSTRAINT [FK_tbl_taikhoan_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_taikhoan]  WITH CHECK ADD  CONSTRAINT [FK_tbl_taikhoan_tbl_quyen] FOREIGN KEY([id_q])
REFERENCES [dbo].[tbl_quyen] ([id])
GO
ALTER TABLE [dbo].[tbl_taikhoan] CHECK CONSTRAINT [FK_tbl_taikhoan_tbl_quyen]
GO
ALTER TABLE [dbo].[tbl_xulydon]  WITH CHECK ADD  CONSTRAINT [FK_tbl_xulydon_tbl_dondathang] FOREIGN KEY([id_don])
REFERENCES [dbo].[tbl_dondathang] ([id])
GO
ALTER TABLE [dbo].[tbl_xulydon] CHECK CONSTRAINT [FK_tbl_xulydon_tbl_dondathang]
GO
ALTER TABLE [dbo].[tbl_xulydon]  WITH CHECK ADD  CONSTRAINT [FK_tbl_xulydon_tbl_taikhoan] FOREIGN KEY([id_tk])
REFERENCES [dbo].[tbl_taikhoan] ([id])
GO
ALTER TABLE [dbo].[tbl_xulydon] CHECK CONSTRAINT [FK_tbl_xulydon_tbl_taikhoan]
GO
/****** Object:  StoredProcedure [dbo].[add_employee]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[add_employee]
	@acc nvarchar(50),
	@pass varchar(30) as
begin
	insert into tbl_thongtincanhan(ten) values (NULL)
	declare @id_ttcn int
	select @id_ttcn = max(id) from tbl_thongtincanhan
	insert
		into tbl_taikhoan(tentaikhoan, matkhau, id_ttcn, id_q, trangthai)
		values (@acc, @pass, @id_ttcn, 2, 1)
end

GO
/****** Object:  StoredProcedure [dbo].[DangNhap]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DangNhap](@tentaikhoan NVARCHAR(50), @matkhau VARCHAR(50)) AS
BEGIN
	DECLARE @check_q INT
	DECLARE @result INT

	SET @check_q = (SELECT id_q -- 1: admin ; 2: nhanvien ; 3:khachhang
					FROM dbo.tbl_taikhoan 
					WHERE tentaikhoan = @tentaikhoan AND matkhau = @matkhau)
	IF @check_q = 1
		BEGIN
			SET @result = 1
        END
     ELSE IF @check_q=2
			BEGIN
				SET @result = 2
            END
        ELSE IF @check_q=3
			BEGIN
				SET @result = 3
            END
			ELSE
				BEGIN
					SET @result = 0
				END
				  
	SELECT @result  
END
GO
/****** Object:  StoredProcedure [dbo].[edit_account_status]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[edit_account_status]
	@id int,
	@permission int,
	@pass varchar(30),
	@status bit as
begin
	update tbl_taikhoan
	set
		id_q = isnull(@permission, id_q),
		matkhau = isnull(@pass, matkhau),
		trangthai = isnull(@status, trangthai)
	where id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[edit_personal_info]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[edit_personal_info]
	@id int,
	@name nvarchar(100),
	@birth date,
	@gender bit,
	@place nvarchar(100),
	@phone decimal(18),
	@mail varchar(100),
	@image varchar(255) as
begin
	update tbl_thongtincanhan
	set
		ten = isnull(@name, ten),
		ngaysinh = isnull(@birth, ngaysinh),
		gioitinh = isnull(@gender, gioitinh),
		diachi = isnull(@place, diachi),
		sdt = isnull(@phone, sdt),
		email = isnull(@mail, email),
		anhdaidien = isnull(@image, anhdaidien)
	where id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[get_all_customer]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_all_customer] as
begin
	select
		*
	from
		full_personal_info
	where id_q = 3
end

GO
/****** Object:  StoredProcedure [dbo].[get_all_employee]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_all_employee] as
begin
	select
		*
	from
		full_personal_info
	where id_q = 1 or id_q = 2
end

GO
/****** Object:  StoredProcedure [dbo].[get_customer_by_account]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_customer_by_account]
	@acc varchar(100) as
begin
	select
		*
	from
		full_personal_info
	where
		id_q = 3 and tentaikhoan like '%'+@acc+'%' 
end

GO
/****** Object:  StoredProcedure [dbo].[get_customer_by_name]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_customer_by_name]
	@name nvarchar(100) as
begin
	select
		*
	from
		full_personal_info
	where
		id_q = 3 and hoten like N'% '+@name+N'%' 
end

GO
/****** Object:  StoredProcedure [dbo].[get_employee_by_account]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_employee_by_account]
	@acc varchar(100) as
begin
	select
		*
	from
		full_personal_info
	where
		(id_q = 1 or id_q = 2) and tentaikhoan like '%'+@acc+'%' 
end

GO
/****** Object:  StoredProcedure [dbo].[get_employee_by_name]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_employee_by_name]
	@name nvarchar(100) as
begin
	select
		*
	from
		full_personal_info
	where
		(id_q = 1 or id_q = 2) and hoten like N'% '+@name+N'%' 
end

GO
/****** Object:  StoredProcedure [dbo].[LayAnh]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayAnh]
	@id_sp int
AS
begin
	select duongdan from tbl_anh where id_sp = @id_sp
end
GO
/****** Object:  StoredProcedure [dbo].[LaySanPham]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LaySanPham] AS
BEGIN

	SELECT sp.id, dm.ten as 'tendm', sp.ten, sp.gia, sp.soluong, sp.trongluong, sp.ROM, 
			sp.RAM, sp.thenho, sp.camera_sau, sp.camera_truoc, sp.pin, 
			sp.baohanh, sp.bluetooth, nsx.ten as 'tennsx', sp.CPU, sp.manhinh
	 FROM dbo.tbl_sanpham  as sp, tbl_nhasanxuat as nsx,
			tbl_danhmuc as dm
		WHERE sp.tinhtrang = 1 and sp.id_dm = dm.id and sp.id_nsx = nsx.id 
END
GO
/****** Object:  StoredProcedure [dbo].[LaySanPham_Dm]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LaySanPham_Dm](@id_dm int) AS
BEGIN

	SELECT * FROM dbo.tbl_sanpham
		WHERE tinhtrang = 1 AND id_dm = @id_dm

END


GO
/****** Object:  StoredProcedure [dbo].[LaySanPham_Id]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LaySanPham_Id](@id int) AS
BEGIN

	SELECT * FROM dbo.tbl_sanpham
		WHERE tinhtrang = 1 AND id = @id--liệu có thể trả về đối tượng theo cách khác k???

END


GO
/****** Object:  StoredProcedure [dbo].[LaySanPham_Nsx]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LaySanPham_Nsx](@id_nsx int, @count int) AS
BEGIN

	SELECT top (@count) * FROM dbo.tbl_sanpham
		WHERE tinhtrang = 1 AND id_nsx = @id_nsx

END
GO
/****** Object:  StoredProcedure [dbo].[LayTinTuc]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LayTinTuc] AS
BEGIN

	SELECT n.id, n.tieude, n.noidung, n.ngaydang, tk.tentaikhoan 
	FROM dbo.tbl_news AS n, dbo.tbl_taikhoan AS tk
    WHERE n.id_tk = tk.id

END


GO
/****** Object:  StoredProcedure [dbo].[Register]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Register]
	@user varchar(50),
	@email varchar(50),
	@pass varchar(50)
AS
	begin
		declare @id int
		select @id = id from tbl_taikhoan where tentaikhoan = @user
		if (@id is null)
			begin
				insert into tbl_thongtincanhan (ten, email) values (@user, @email)
				select @id = max(id) from tbl_thongtincanhan
				insert
					into tbl_taikhoan (tentaikhoan, matkhau, id_ttcn, id_q, trangthai)
					values (@user, @pass, @id, 3, 1)
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[SoSp_Nsx]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SoSp_Nsx](@id_nsx int)
as 
	begin
		select id_nsx
		from tbl_sanpham 
		where id_nsx = @id_nsx
	end


GO
/****** Object:  StoredProcedure [dbo].[suasanpham]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------Sửa sản Phẩm-----------------------------------------------------------
CREATE PROC [dbo].[suasanpham]
	@id int,
    @id_dm int,
	@ten nvarchar (150),
	@gia decimal (12,0),
	@soluong int,
	@trongluong nchar(10),
	@ROM nchar(10),
	@RAM nchar(10),
	@thenho nvarchar(50),
	@camera_truoc nchar(10),
	@camera_sau nchar(10),
	@pin int,
	@baohanh nchar(50),
	@bluetooth int,
	@id_nsx int,
	@CPU varchar(50),
	@manhinh nvarchar(50),
	@tinhtrang int
as 
begin
update tbl_sanpham
set id_dm= @id_dm ,ten = @ten, gia = @gia ,soluong = @soluong, trongluong= @trongluong,ROM = @ROM, RAM = @RAM, thenho = @thenho, camera_truoc = @camera_truoc, camera_sau = @camera_sau, pin = @pin , baohanh = @baohanh, bluetooth = @bluetooth, id_nsx = @id_nsx, CPU = @CPU, manhinh = @manhinh, tinhtrang = @tinhtrang
where id = @id;
END

GO
/****** Object:  StoredProcedure [dbo].[themsanpham]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------Thêm Sản Phẩm--------------------------
Create Proc [dbo].[themsanpham]
	@id_dm int,
	@ten nvarchar (150),
	@gia decimal (12,0),
	@soluong int,
	@trongluong nchar(10),
	@ROM nchar(10),
	@RAM nchar(10),
	@thenho nvarchar(50),
	@camera_truoc nchar(10),
	@camera_sau nchar(10),
	@pin int,
	@baohanh nchar(50),
	@bluetooth int,
	@id_nsx int,
	@CPU varchar(50),
	@manhinh nvarchar(50),
	@tinhtrang int
as
begin
insert into tbl_sanpham (id_dm,ten,gia,soluong,trongluong,ROM,RAM,thenho,camera_truoc,camera_sau,pin,baohanh,bluetooth,id_nsx,CPU,manhinh,tinhtrang)
 Values (@id_dm,@ten,@gia,@soluong,@trongluong,@ROM,@RAM,@thenho,@camera_truoc,@camera_sau,@pin,@baohanh,@bluetooth,@id_nsx,@CPU,@manhinh,@tinhtrang)
END

GO
/****** Object:  StoredProcedure [dbo].[TimKiemSanPham]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TimKiemSanPham](@name NVARCHAR(250)) AS
BEGIN

	SELECT * FROM dbo.tbl_sanpham AS sp
	WHERE sp.ten LIKE '%'+@name+'%'

END


GO
/****** Object:  StoredProcedure [dbo].[xoasanpham]    Script Date: 5/30/2019 1:19:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------
CREATE Proc [dbo].[xoasanpham](@id_sp int)
as
begin
--xoa anh san pham trong bang tbl_anh
DELETE FROM dbo.tbl_anh WHERE id_sp = @id_sp
-- xóa sản phẩm trong bảng
Delete from tbl_sanpham where id = @id_sp;
end;
EXEC dbo.xoasanpham @id_sp = 1 -- int

select * from tbl_sanpham where ten = 'test'
GO
USE [master]
GO
ALTER DATABASE [shop_mobi] SET  READ_WRITE 
GO
