USE [MBTI]
GO

/****** Object:  View [MBTI].[VW_Similarity_Ensemble]    Script Date: 9/6/2020 1:03:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [MBTI].[VW_Similarity_Ensemble] AS
WITH tCombinedCloseness AS
(
	SELECT
	COALESCE(tMBTI.[Country_Adjusted], tHOFF.[Country_Adjusted], tBFIVE.[Country_Adjusted]) AS [CountryName]
	, (ISNULL(tMBTI.[Closeness],0) + ISNULL(tHOFF.[Closeness],0) + ISNULL(tBFIVE.[Closeness],0)) / 
	(CASE WHEN tMBTI.[Closeness] IS NULL THEN 0 ELSE 1 END + CASE WHEN tHOFF.[Closeness] IS NULL THEN 0 ELSE 1 END + CASE WHEN tBFIVE.[Closeness] IS NULL THEN 0 ELSE 1 END)
	AS [Closeness]
	, tMBTI.[Closeness] AS [MBTI]
	, tHOFF.[Closeness] AS [Hoffstede]
	, tBFIVE.[Closeness] AS [Big Five]
	FROM  [MBTI].[MBTI].[VW_Similarity_MBTI] tMBTI
	FULL OUTER JOIN [MBTI].[MBTI].[VW_Similarity_HOFF] tHOFF 
	ON tMBTI.[Country_Adjusted] = tHOFF.[Country_Adjusted]
	FULL OUTER JOIN [MBTI].[MBTI].[VW_Similarity_BFIVE] tBFIVE 
	ON tMBTI.[Country_Adjusted] = tBFIVE.[Country_Adjusted]
	OR tHOFF.[Country_Adjusted] = tBFIVE.[Country_Adjusted]
)
SELECT *
FROM tCombinedCloseness
GO


