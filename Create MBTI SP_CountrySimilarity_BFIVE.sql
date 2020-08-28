USE [MBTI]
GO

/****** Object:  View [MBTI].[VW_Similarity_BFIVE]    Script Date: 8/28/2020 12:54:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







/****** Object:  View [MBTI].[VW_Similarity_MBTI]    Script Date: 8/21/2020 1:39:49 PM ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO




CREATE VIEW [MBTI].[VW_Similarity_BFIVE] AS
SELECT 
tSim.*,
tCountry.[SetCountryName] AS [Country_Adjusted]
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
FROM [MBTI].[MBTI].[TBL_Similarity_BFIVE] tSim
INNER JOIN [MBTI].[MBTI].[TBL_CountryTranslations] tCountry
ON tSim.[Country] = tCountry.[GetCountryName]
--INNER JOIN  [MBTI].[MBTI].[TBL_Iteration_MBTI] tIter
--ON tSim.[FK_ID_Iteration] = tIter.[PK_ID_Iteration_CountrySimilarity_MBTI]
WHERE tSim.[FK_ID_Iteration] = (SELECT MAX([FK_ID_Iteration]) FROM [MBTI].[MBTI].[TBL_Similarity_BFIVE])

--GO


GO


