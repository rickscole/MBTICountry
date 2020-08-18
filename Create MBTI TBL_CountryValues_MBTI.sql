USE [MBTI]
GO

/****** Object:  Table [MBTI].[TBL_CountryValues_MBTI]    Script Date: 8/18/2020 3:18:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MBTI].[TBL_CountryValues_MBTI](
	[PK_ID_CountryValue] [int] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](100) NULL,
	[i] [real] NULL,
	[n] [real] NULL,
	[t] [real] NULL,
	[p] [real] NULL,
	[a] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_CountryValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


