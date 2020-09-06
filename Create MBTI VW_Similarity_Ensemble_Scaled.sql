USE [MBTI]
GO

/****** Object:  View [MBTI].[VW_Similarity_Stacked]    Script Date: 9/6/2020 1:18:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [MBTI].[VW_Similarity_Stacked] AS
WITH tCombinedCloseness AS
(
	SELECT
	[Country_Adjusted] AS [Country]
	, [Closeness]
	, [DeviationPoints]
	, 'MBTI' AS [Type]
	FROM  [MBTI].[MBTI].[VW_Similarity_MBTI] 

	UNION ALL

	SELECT
	[Country_Adjusted] AS [Country]
	, [Closeness]
	, [DeviationPoints]
	, 'Hoffstede' AS [Type]
	FROM  [MBTI].[MBTI].[VW_Similarity_HOFF] 

	UNION ALL

	SELECT
	[Country_Adjusted] AS [Country]
	, [Closeness]
	, [DeviationPoints]
	, 'Big Five' AS [Type]
	FROM  [MBTI].[MBTI].[VW_Similarity_BFIVE] 
)
SELECT *
FROM tCombinedCloseness
GO


