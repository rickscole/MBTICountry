USE [MBTI]
GO

/****** Object:  Table [MBTI].[TBL_Similarity_BFIVE]    Script Date: 8/26/2020 7:13:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MBTI].[TBL_Similarity_BFIVE](
	[PK_ID_Similarity_BFIVE] [int] IDENTITY(1,1) NOT NULL,
	[TS_Similarity_BFIVE] [datetime2](7) NULL,
	[FK_ID_Iteration_BFIVE] [int] NULL,
	[FK_ID_Iteration] [int] NULL,
	[FK_ID_Session] [int] NULL,
	[Country] [nvarchar](100) NULL,
	[Extraversion] [int] NULL,
	[Agreeableness] [int] NULL,
	[Conscientiousness] [int] NULL,
	[Neuroticism] [int] NULL,
	[Openness] [int] NULL,
	[DeviationPoints] [float] NULL,
	[Closeness] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_Similarity_BFIVE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


