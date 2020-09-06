USE [MBTI]
GO

/****** Object:  View [MBTI].[VW_Attributes_Stacked]    Script Date: 9/6/2020 1:20:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [MBTI].[VW_Attributes_Stacked] AS
SELECT [Country_Adjusted] AS [Country]
, [Introversion] AS [Country Value]
, 'Introversion' AS [Attribute]
, 'MBTI' AS [Type]
FROM [MBTI].[VW_Similarity_MBTI]
UNION ALL
SELECT [Country_Adjusted]
, [Intution]
, 'Intuition'
, 'MBTI'
FROM [MBTI].[VW_Similarity_MBTI] 
UNION ALL
SELECT [Country_Adjusted]
, [Thinking]
, 'Thinking'
, 'MBTI'
FROM [MBTI].[VW_Similarity_MBTI]
UNION ALL
SELECT [Country_Adjusted]
, [Prospecting]
, 'Prospecting'
, 'MBTI'
FROM [MBTI].[VW_Similarity_MBTI]
UNION ALL
SELECT [Country_Adjusted]
, [Assertiveness]
, 'Assertiveness'
, 'MBTI'
FROM [MBTI].[VW_Similarity_MBTI]  

UNION ALL

SELECT [Country_Adjusted]
, [PowerDistance]
, 'Power Distance'
, 'Hoffstede'
FROM [MBTI].[VW_Similarity_HOFF]
UNION ALL
SELECT [Country_Adjusted]
, [Individualism]
, 'Individualism'
, 'Hoffstede'
FROM [MBTI].[VW_Similarity_HOFF]
UNION ALL
SELECT [Country_Adjusted]
, [Masculinity]
, 'Masculinity'
, 'Hoffstede'
FROM [MBTI].[VW_Similarity_HOFF]
UNION ALL
SELECT [Country_Adjusted]
, [UncertaintyAvoidance]
, 'Uncertainty Avoidance'
, 'Hoffstede'
FROM [MBTI].[VW_Similarity_HOFF]
UNION ALL
SELECT [Country_Adjusted]
, [Indulgence]
, 'Indulgence'
, 'Hoffstede'
FROM [MBTI].[VW_Similarity_HOFF]
UNION ALL
SELECT [Country_Adjusted]
, [LongTermOrientation]
, 'Long Term Orientation'
, 'Hoffstede'
FROM [MBTI].[VW_Similarity_HOFF]

UNION ALL

SELECT [Country_Adjusted]
, [Extraversion]
, 'Extraversion'
, 'Big Five'
FROM [MBTI].[VW_Similarity_BFIVE] 
UNION ALL
SELECT [Country_Adjusted]
, [Agreeableness]
, 'Agreeableness'
, 'Big Five'
FROM [MBTI].[VW_Similarity_BFIVE]
UNION ALL
SELECT [Country_Adjusted]
, [Conscientiousness]
, 'Conscientiousness'
, 'Big Five'
FROM [MBTI].[VW_Similarity_BFIVE]
UNION ALL
SELECT [Country_Adjusted]
, [Neuroticism]
, 'Neuroticism'
, 'Big Five'
FROM [MBTI].[VW_Similarity_BFIVE]
UNION ALL
SELECT [Country_Adjusted]
, [Openness]
, 'Openness'
, 'Big Five'
FROM [MBTI].[VW_Similarity_BFIVE]


GO


