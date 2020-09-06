USE [MBTI]
GO

/****** Object:  View [MBTI].[VW_Similarity_BFIVE_Scaled]    Script Date: 9/6/2020 1:07:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [MBTI].[VW_Similarity_BFIVE_Scaled] AS
WITH tBFIVEMax AS
(
	SELECT 
	MAX([Extraversion]) AS [Extraversion_MAX]
	, MAX([Agreeableness]) AS [Agreeableness_MAX]
	, MAX([Conscientiousness]) AS [Conscientiousness_MAX]
	, MAX([Neuroticism]) AS [Neuroticism_MAX]
	, MAX([Openness]) AS [Openness_MAX]
	FROM [MBTI].[MBTI].[TBL_CountryValues_BFIVE] tBFIVE
)
SELECT 
tCountry.[SetCountryName] AS [Country]
, tBFIVE.[Extraversion] * 100 / tBFIVEMax.[Extraversion_MAX] AS [Extraversion Scaled]
, tBFIVE.[Agreeableness] * 100 / tBFIVEMax.[Agreeableness_MAX] AS [Agreeableness Scaled]
, tBFIVE.[Conscientiousness] * 100 / tBFIVEMax.[Conscientiousness_MAX] AS [Conscientiousness Scaled]
, tBFIVE.[Neuroticism] * 100 / tBFIVEMax.[Neuroticism_MAX] AS [Neuroticism Scaled]
, tBFIVE.[Openness] * 100 / tBFIVEMax.[Openness_MAX] AS [Openness Scaled]
FROM [MBTI].[MBTI].[TBL_CountryValues_BFIVE] tBFIVE
CROSS JOIN tBFIVEMax
INNER JOIN [MBTI].[MBTI].[TBL_CountryTranslations] tCountry
ON tBFIVE.[Country] = tCountry.[GetCountryName]
GO


