USE [master]
GO
/****** Object:  Database [PrisonOrder]    Script Date: 2019/6/21 10:30:27 ******/
CREATE DATABASE [PrisonOrder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PrisonOrder', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PrisonOrder.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PrisonOrder_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PrisonOrder_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PrisonOrder] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PrisonOrder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PrisonOrder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PrisonOrder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PrisonOrder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PrisonOrder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PrisonOrder] SET ARITHABORT OFF 
GO
ALTER DATABASE [PrisonOrder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PrisonOrder] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PrisonOrder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PrisonOrder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PrisonOrder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PrisonOrder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PrisonOrder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PrisonOrder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PrisonOrder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PrisonOrder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PrisonOrder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PrisonOrder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PrisonOrder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PrisonOrder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PrisonOrder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PrisonOrder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PrisonOrder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PrisonOrder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PrisonOrder] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PrisonOrder] SET  MULTI_USER 
GO
ALTER DATABASE [PrisonOrder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PrisonOrder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PrisonOrder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PrisonOrder] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PrisonOrder]
GO
/****** Object:  Table [dbo].[t_area]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_area](
	[id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[remarks] [varchar](255) NULL,
	[demo] [varchar](255) NULL,
	[prison_id] [int] NOT NULL,
 CONSTRAINT [PK_t_area] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_brand]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_brand](
	[id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[remarks] [varchar](255) NULL,
	[demo] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_dept]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_dept](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[prison_id] [int] NOT NULL,
	[remarks] [varchar](255) NULL,
	[demo] [varchar](255) NULL,
 CONSTRAINT [PK_t_dept] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_function]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_function](
	[id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[parentid] [int] NOT NULL,
	[url] [varchar](255) NULL,
	[remarks] [varchar](255) NULL,
 CONSTRAINT [PK_t_function] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_goods]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_goods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[type_id] [int] NULL,
	[number] [int] NOT NULL,
	[picture] [varchar](255) NULL,
	[brand_id] [int] NULL,
	[price] [money] NOT NULL,
	[status] [int] NULL,
	[remarks] [varchar](255) NULL,
	[pictureimage] [image] NULL,
 CONSTRAINT [PK_t_goods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_goodstype]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_goodstype](
	[id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[remarks] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_log_info]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_log_info](
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[user_name] [varchar](255) NOT NULL,
	[logaction] [varchar](255) NOT NULL,
	[logtime] [varchar](255) NOT NULL,
	[remarks] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_order]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_order](
	[id] [bigint] NOT NULL,
	[prisoner_id] [int] NOT NULL,
	[prisoner_name] [varchar](255) NULL,
	[area_no] [int] NOT NULL,
	[status] [int] NULL,
	[create_time] [varchar](255) NULL,
	[update_time] [varchar](255) NULL,
	[payment_time] [varchar](255) NOT NULL,
	[end_time] [varchar](255) NULL,
	[process] [int] NOT NULL,
 CONSTRAINT [PK_t_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ordergoods]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ordergoods](
	[order_id] [bigint] NOT NULL,
	[goods_id] [int] NOT NULL,
	[goods_name] [varchar](255) NOT NULL,
	[goods_number] [int] NOT NULL,
	[totalfee] [money] NOT NULL,
	[goods_price] [money] NOT NULL,
	[remarks] [varchar](255) NULL,
	[demo] [varchar](255) NULL,
 CONSTRAINT [PK_t_ordergoods] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[goods_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_prison]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_prison](
	[id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[remarks] [varchar](255) NULL,
	[demo] [varchar](255) NULL,
 CONSTRAINT [PK_t_prison] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_prsioner]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_prsioner](
	[id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[prisoner_id] [int] NOT NULL,
	[finger] [image] NULL,
	[fingerpath] [varchar](255) NULL,
	[face] [image] NULL,
	[facepath] [varchar](255) NULL,
	[area_no] [int] NULL,
	[remarks] [varchar](255) NULL,
 CONSTRAINT [PK_t_prsioner] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_role]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_role](
	[id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[remarks] [varchar](255) NULL,
 CONSTRAINT [PK_t_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_role_function]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_role_function](
	[role_id] [int] NOT NULL,
	[function_id] [int] NOT NULL,
	[permission] [varchar](255) NOT NULL,
	[remarks] [varchar](255) NULL,
 CONSTRAINT [PK_t_role_function] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[function_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[sex] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[dep_id] [int] NOT NULL,
	[telephone] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[remarks] [varchar](255) NULL,
 CONSTRAINT [PK_t_user1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_1](
	[ttt] [varchar](50) NULL,
	[name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Table_3]    Script Date: 2019/6/21 10:30:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_3](
	[fff] [varchar](50) NOT NULL,
	[name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[t_goods] ADD  CONSTRAINT [DF_t_goods_number]  DEFAULT ((2)) FOR [number]
GO
ALTER TABLE [dbo].[t_goods] ADD  CONSTRAINT [DF_t_goods_picture]  DEFAULT ('') FOR [picture]
GO
ALTER TABLE [dbo].[t_goods] ADD  CONSTRAINT [DF_t_goods_price]  DEFAULT ((10)) FOR [price]
GO
ALTER TABLE [dbo].[t_goods] ADD  CONSTRAINT [DF_t_goods_remarks]  DEFAULT ('') FOR [remarks]
GO
ALTER TABLE [dbo].[Table_3] ADD  CONSTRAINT [DF_Table_3_fff]  DEFAULT ('') FOR [fff]
GO
ALTER TABLE [dbo].[Table_3] ADD  CONSTRAINT [DF_Table_3_name]  DEFAULT ('') FOR [name]
GO
ALTER TABLE [dbo].[t_area]  WITH CHECK ADD  CONSTRAINT [FK_t_area_t_prison] FOREIGN KEY([prison_id])
REFERENCES [dbo].[t_prison] ([id])
GO
ALTER TABLE [dbo].[t_area] CHECK CONSTRAINT [FK_t_area_t_prison]
GO
ALTER TABLE [dbo].[t_dept]  WITH CHECK ADD  CONSTRAINT [FK_t_dept_t_prison] FOREIGN KEY([prison_id])
REFERENCES [dbo].[t_prison] ([id])
GO
ALTER TABLE [dbo].[t_dept] CHECK CONSTRAINT [FK_t_dept_t_prison]
GO
ALTER TABLE [dbo].[t_order]  WITH CHECK ADD  CONSTRAINT [FK_t_order_t_area] FOREIGN KEY([area_no])
REFERENCES [dbo].[t_area] ([id])
GO
ALTER TABLE [dbo].[t_order] CHECK CONSTRAINT [FK_t_order_t_area]
GO
ALTER TABLE [dbo].[t_order]  WITH CHECK ADD  CONSTRAINT [FK_t_order_t_prsioner] FOREIGN KEY([prisoner_id])
REFERENCES [dbo].[t_prsioner] ([id])
GO
ALTER TABLE [dbo].[t_order] CHECK CONSTRAINT [FK_t_order_t_prsioner]
GO
ALTER TABLE [dbo].[t_ordergoods]  WITH CHECK ADD  CONSTRAINT [FK_t_ordergoods_t_goods] FOREIGN KEY([goods_id])
REFERENCES [dbo].[t_goods] ([id])
GO
ALTER TABLE [dbo].[t_ordergoods] CHECK CONSTRAINT [FK_t_ordergoods_t_goods]
GO
ALTER TABLE [dbo].[t_ordergoods]  WITH CHECK ADD  CONSTRAINT [FK_t_ordergoods_t_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[t_order] ([id])
GO
ALTER TABLE [dbo].[t_ordergoods] CHECK CONSTRAINT [FK_t_ordergoods_t_order]
GO
ALTER TABLE [dbo].[t_role_function]  WITH CHECK ADD  CONSTRAINT [FK_t_role_function_t_function] FOREIGN KEY([function_id])
REFERENCES [dbo].[t_function] ([id])
GO
ALTER TABLE [dbo].[t_role_function] CHECK CONSTRAINT [FK_t_role_function_t_function]
GO
ALTER TABLE [dbo].[t_role_function]  WITH CHECK ADD  CONSTRAINT [FK_t_role_function_t_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[t_role] ([id])
GO
ALTER TABLE [dbo].[t_role_function] CHECK CONSTRAINT [FK_t_role_function_t_role]
GO
ALTER TABLE [dbo].[t_user]  WITH CHECK ADD  CONSTRAINT [FK_t_user_t_dept] FOREIGN KEY([dep_id])
REFERENCES [dbo].[t_dept] ([id])
GO
ALTER TABLE [dbo].[t_user] CHECK CONSTRAINT [FK_t_user_t_dept]
GO
ALTER TABLE [dbo].[t_user]  WITH CHECK ADD  CONSTRAINT [FK_t_user_t_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[t_role] ([id])
GO
ALTER TABLE [dbo].[t_user] CHECK CONSTRAINT [FK_t_user_t_role]
GO
USE [master]
GO
ALTER DATABASE [PrisonOrder] SET  READ_WRITE 
GO
