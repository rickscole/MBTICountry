USE [MBTI]
GO

/****** Object:  Table [MBTI].[TBL_CountryValues_BFIVE]    Script Date: 8/23/2020 11:50:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MBTI].[TBL_CountryValues_BFIVE](
	[PK_ID_CountryValues_BFIVE] [int] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](100) NULL,
	[extraversion] [real] NULL,
	[agreeableness] [real] NULL,
	[conscientiousness] [real] NULL,
	[neuroticism] [real] NULL,
	[openness] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_CountryValues_BFIVE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


