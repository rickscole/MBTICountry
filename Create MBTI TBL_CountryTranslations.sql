USE [MBTI]
GO

/****** Object:  Table [MBTI].[TBL_CountryTranslations]    Script Date: 8/28/2020 1:00:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MBTI].[TBL_CountryTranslations](
	[PK_ID_CountryTranslation] [int] IDENTITY(1,1) NOT NULL,
	[GetCountryName] [nvarchar](100) NULL,
	[SetCountryName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_CountryTranslation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


