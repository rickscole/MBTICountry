USE [MBTI]
GO

/****** Object:  Table [MBTI].[TBL_Similarity_HOFF]    Script Date: 8/21/2020 1:23:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MBTI].[TBL_Similarity_HOFF](
	[PK_ID_Similarity_HOFF] [int] IDENTITY(1,1) NOT NULL,
	[TS_Similarity_HOFF] [datetime2](7) NULL,
	[FK_ID_Iteration_HOFF] [int] NULL,
	[FK_ID_Iteration] [int] NULL,
	[FK_ID_Session] [int] NULL,
	[Country] [nvarchar](100) NULL,
	[PowerDistance] [int] NULL,
	[Individualism] [int] NULL,
	[Masculinity] [int] NULL,
	[UncertaintyAvoidance] [int] NULL,
	[Indulgence] [int] NULL,
	[LongTermOrientation] [int] NULL,
	[DeviationPoints] [float] NULL,
	[Closeness] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_Similarity_HOFF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


