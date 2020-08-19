USE [MBTI]
GO

/****** Object:  Table [MBTI].[TBL_Session]    Script Date: 8/19/2020 9:16:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MBTI].[TBL_Session](
	[PK_ID_Session] [int] IDENTITY(1,1) NOT NULL,
	[TS_Session] [datetime2](7) NULL,
	[FK_ID_User] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_Session] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


