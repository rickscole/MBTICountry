USE [MBTI]
GO

/****** Object:  Table [MBTI].[TBL_Iteration_MBTI]    Script Date: 8/20/2020 10:04:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MBTI].[TBL_Iteration_MBTI](
	[PK_ID_Iteration_MBTI] [int] IDENTITY(1,1) NOT NULL,
	[TS_Iteration_MBTI] [datetime2](7) NULL,
	[FK_ID_Iteration] [int] NULL,
	[FK_ID_Session] [int] NULL,
	[Introversion] [int] NULL,
	[Intution] [int] NULL,
	[Thinking] [int] NULL,
	[Prospecting] [int] NULL,
	[Assertiveness] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_Iteration_MBTI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


