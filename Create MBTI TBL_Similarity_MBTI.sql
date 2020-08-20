USE [MBTI]
GO

/****** Object:  Table [MBTI].[TBL_Similarity_MBTI]    Script Date: 8/20/2020 11:20:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MBTI].[TBL_Similarity_MBTI](
	[PK_ID_Similarity_MBTI] [int] IDENTITY(1,1) NOT NULL,
	[TS_Similarity_MBTI] [datetime2](7) NULL,
	[FK_ID_Iteration] [int] NULL,
	[FK_ID_Session] [int] NULL,
	[Country] [nvarchar](1000) NULL,
	[Introversion] [int] NULL,
	[Intution] [int] NULL,
	[Thinking] [int] NULL,
	[Prospecting] [int] NULL,
	[Assertiveness] [int] NULL,
	[DeviationPoints] [float] NULL,
	[Closeness] [float] NULL,
	[FK_ID_Iteration_MBTI] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_Similarity_MBTI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


