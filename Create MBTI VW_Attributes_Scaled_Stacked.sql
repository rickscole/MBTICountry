USE [MBTI]
GO

/****** Object:  View [MBTI].[VW_Attributes_Scaled_Stacked]    Script Date: 9/6/2020 1:23:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [MBTI].[VW_Attributes_Scaled_Stacked] AS
SELECT [Country] AS [Country]
, [Introversion Scaled] AS [Country Value]
, 'Introversion' AS [Attribute]
, 'MBTI' AS [Type]
FROM [MBTI].[VW_Similarity_MBTI_Scaled]
UNION ALL
SELECT [Country]
, [Intuition Scaled]
, 'Intuition'
, 'MBTI'
FROM [MBTI].[VW_Similarity_MBTI_Scaled] 
UNION ALL
SELECT [Country]
, [Thinking Scaled]
, 'Thinking'
, 'MBTI'
FROM [MBTI].[VW_Similarity_MBTI_Scaled]
UNION ALL
SELECT [Country]
, [Prospecting Scaled]
, 'Prospecting'
, 'MBTI'
FROM [MBTI].[VW_Similarity_MBTI_Scaled]
UNION ALL
SELECT [Country]
, [Assertiveness Scaled]
, 'Assertiveness'
, 'MBTI'
FROM [MBTI].[VW_Similarity_MBTI_Scaled]  

UNION ALL

SELECT [Country]
, [Power Distance Scaled]
, 'Power Distance'
, 'Hoffstede'
FROM [MBTI].[VW_Similarity_HOFF_Scaled]
UNION ALL
SELECT [Country]
, [Individualism Scaled]
, 'Individualism'
, 'Hoffstede'
FROM [MBTI].[VW_Similarity_HOFF_Scaled]
UNION ALL
SELECT [Country]
, [Masculinity Scaled]
, 'Masculinity'
, 'Hoffstede'
FROM [MBTI].[VW_Similarity_HOFF_Scaled]
UNION ALL
SELECT [Country]
, [Uncertainty Avoidance Scaled]
, 'Uncertainty Avoidance'
, 'Hoffstede'
FROM [MBTI].[VW_Similarity_HOFF_Scaled]
UNION ALL
SELECT [Country]
, [Indulgence Scaled]
, 'Indulgence'
, 'Hoffstede'
FROM [MBTI].[VW_Similarity_HOFF_Scaled]
UNION ALL
SELECT [Country]
, [Long Term Orientation Scaled]
, 'Long Term Orientation'
, 'Hoffstede'
FROM [MBTI].[VW_Similarity_HOFF_Scaled]

UNION ALL

SELECT [Country]
, [Extraversion Scaled]
, 'Extraversion'
, 'Big Five'
FROM [MBTI].[VW_Similarity_BFIVE_Scaled] 
UNION ALL
SELECT [Country]
, [Agreeableness Scaled]
, 'Agreeableness'
, 'Big Five'
FROM [MBTI].[VW_Similarity_BFIVE_Scaled]
UNION ALL
SELECT [Country]
, [Conscientiousness Scaled]
, 'Conscientiousness'
, 'Big Five'
FROM [MBTI].[VW_Similarity_BFIVE_Scaled]
UNION ALL
SELECT [Country]
, [Neuroticism Scaled]
, 'Neuroticism'
, 'Big Five'
FROM [MBTI].[VW_Similarity_BFIVE_Scaled]
UNION ALL
SELECT [Country]
, [Openness Scaled]
, 'Openness'
, 'Big Five'
FROM [MBTI].[VW_Similarity_BFIVE_Scaled]
GO


