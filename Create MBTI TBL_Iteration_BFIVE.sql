USE [MBTI]
GO

/****** Object:  Table [MBTI].[TBL_Iteration_BFIVE]    Script Date: 8/24/2020 10:37:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MBTI].[TBL_Iteration_BFIVE](
	[PK_ID_Iteration_BFIVE] [int] IDENTITY(1,1) NOT NULL,
	[TS_Iteration_HOFF] [datetime2](7) NULL,
	[FK_ID_Iteration] [real] NULL,
	[FK_ID_Session] [real] NULL,
	[Extraversion] [real] NULL,
	[Agreeableness] [real] NULL,
	[Conscientiousness] [real] NULL,
	[Neuroticism] [real] NULL,
	[Openness] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_Iteration_BFIVE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


