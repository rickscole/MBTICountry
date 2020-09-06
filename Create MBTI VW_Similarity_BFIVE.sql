USE [MBTI]
GO

/****** Object:  View [MBTI].[VW_Similarity_BFIVE]    Script Date: 9/6/2020 12:47:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [MBTI].[VW_Similarity_BFIVE] AS
SELECT 
tSim.*
, tCountry.[SetCountryName] AS [Country_Adjusted]
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
FROM [MBTI].[MBTI].[TBL_Similarity_BFIVE] AS tSim
INNER JOIN [MBTI].[MBTI].[TBL_CountryTranslations] tCountry
ON tSim.[Country] = tCountry.[GetCountryName]
--INNER JOIN  [MBTI].[MBTI].[TBL_Iteration_BFIVE] tIter
--ON tSim.[FK_ID_Iteration] = tIter.[PK_ID_Iteration_CountrySimilarity_BFIVE]
WHERE tSim.[FK_ID_Iteration] = (SELECT MAX([FK_ID_Iteration]) FROM [MBTI].[MBTI].[TBL_Similarity_BFIVE])


GO


