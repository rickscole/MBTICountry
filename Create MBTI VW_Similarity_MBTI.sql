USE [MBTI]
GO

/****** Object:  View [MBTI].[VW_Similarity_MBTI]    Script Date: 8/20/2020 11:38:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [MBTI].[VW_Similarity_MBTI] AS
SELECT 
tSim.*
, tCountry.[CountryName_Adjusted]
--, tIter.[Introversion] AS [Introversion_User]
--, tIter.[Intuition] AS [Intuition_User]
--, tIter.[Thinking] AS [Thinking_User]
--, tIter.[Prospecting] AS [Prospecting_User]
--, tIter.[Assertiveness] AS [Assertiveness_User]
--, tIter.[Introversion] AS [Introversion_Difference]
--, tIter.[Intuition] AS [Intuition_User]
--, tIter.[Thinking] AS [Thinking_User]
--, tIter.[Prospecting] AS [Prospecting_User]
--, tIter.[Assertiveness] AS [Assertiveness_User]
FROM [MBTI].[MBTI].[TBL_Similarity_MBTI] tSim
INNER JOIN
(
	SELECT 
	DISTINCT REPLACE(UPPER(LEFT([Country],1)) + LOWER(SUBSTRING([Country],2,LEN([Country]))),'-',' ') AS [CountryName_Adjusted]
	, [Country] 
	FROM [MBTI].[MBTI].[TBL_Similarity_MBTI]
) 
tCountry
ON tSim.[Country] = tCountry.[Country]
--INNER JOIN  [MBTI].[MBTI].[TBL_Iteration_MBTI] tIter
--ON tSim.[FK_ID_Iteration] = tIter.[PK_ID_Iteration_CountrySimilarity_MBTI]

GO


