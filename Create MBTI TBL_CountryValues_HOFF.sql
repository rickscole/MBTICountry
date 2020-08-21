USE [MBTI]
GO

/****** Object:  Table [MBTI].[TBL_CountryValues_HOFF]    Script Date: 8/20/2020 10:51:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MBTI].[TBL_CountryValues_HOFF](
	[PK_ID_CountryValues_HOFF] [int] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](100) NULL,
	[pdi] [int] NULL,
	[idv] [int] NULL,
	[mas] [int] NULL,
	[uai] [int] NULL,
	[ivr] [int] NULL,
	[ltowvs] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_CountryValues_HOFF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


