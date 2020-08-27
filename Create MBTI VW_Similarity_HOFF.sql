USE [MBTI]
GO

/****** Object:  View [MBTI].[VW_Similarity_HOFF]    Script Date: 8/26/2020 8:06:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





/****** Object:  View [MBTI].[VW_Similarity_MBTI]    Script Date: 8/21/2020 1:39:49 PM ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO




CREATE VIEW [MBTI].[VW_Similarity_HOFF] AS
SELECT 
tSim.*,
tCountry.[Country_Adjusted]
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
FROM [MBTI].[MBTI].[TBL_Similarity_HOFF] tSim
INNER JOIN
(
	SELECT 
	DISTINCT [Country]
	, CASE WHEN [Country] = 'U.S.A.' THEN 'United States' ELSE [Country] END AS [Country_Adjusted]
	FROM [MBTI].[MBTI].[TBL_Similarity_HOFF]
) 
tCountry
ON tSim.[Country] = tCountry.[Country]
--INNER JOIN  [MBTI].[MBTI].[TBL_Iteration_MBTI] tIter
--ON tSim.[FK_ID_Iteration] = tIter.[PK_ID_Iteration_CountrySimilarity_MBTI]
WHERE tSim.[FK_ID_Iteration] = (SELECT MAX([FK_ID_Iteration]) FROM [MBTI].[MBTI].[TBL_Similarity_HOFF])

--GO


GO


