USE [MBTI]
GO

/****** Object:  Table [MBTI].[TBL_User]    Script Date: 8/18/2020 11:30:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [MBTI].[TBL_User](
	[PK_ID_User] [int] IDENTITY(1,1) NOT NULL,
	[TS_User] [datetime2](7) NULL,
	[Username] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ID_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO


