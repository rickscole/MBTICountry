USE [MBTI]
GO

/****** Object:  Table [MBTI].[TBL_Iteration]    Script Date: 8/20/2020 9:42:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MBTI].[TBL_Iteration](
	[PK_ID_Iteration] [int] IDENTITY(1,1) NOT NULL,
	[TS_Iteration] [datetime2](7) NULL,
	[FK_ID_Session] [int] NULL,
	[PersonalityInventory] [nvarchar](100) NULL,
	[IterationType] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_Iteration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


