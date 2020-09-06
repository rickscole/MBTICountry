USE [MBTI]
GO

/****** Object:  View [MBTI].[VW_Similarity_HOFF_Scaled]    Script Date: 9/6/2020 1:15:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [MBTI].[VW_Similarity_HOFF_Scaled] AS
WITH tHOFFMax AS
(
	SELECT 
	MAX([pdi]) AS [pdi_MAX]
	, MAX([idv]) AS [idv_MAX]
	, MAX([mas]) AS [mas_MAX]
	, MAX([uai]) AS [uai_MAX]
	, MAX([ivr]) AS [ivr_MAX]
	, MAX([ltowvs]) AS [ltowvs_MAX]
	FROM [MBTI].[MBTI].[TBL_CountryValues_HOFF] tHOFF
)
SELECT 
tCountry.[SetCountryName] AS [Country]
, tHOFF.[pdi] * 100 / tHOFFMax.[pdi_MAX] AS [Power Distance Scaled]
, tHOFF.[idv] * 100 / tHOFFMax.[idv_MAX] AS [Individualism Scaled]
, tHOFF.[mas] * 100 / tHOFFMax.[mas_MAX] AS [Masculinity Scaled]
, tHOFF.[uai] * 100 / tHOFFMax.[uai_MAX] AS [Uncertainty Avoidance Scaled]
, tHOFF.[ivr] * 100 / tHOFFMax.[ivr_MAX] AS [Indulgence Scaled]
, tHOFF.[ltowvs] * 100 / tHOFFMax.[ltowvs_MAX] AS [Long Term Orientation Scaled]
FROM [MBTI].[MBTI].[TBL_CountryValues_HOFF] tHOFF
CROSS JOIN tHOFFMax
INNER JOIN [MBTI].[MBTI].[TBL_CountryTranslations] tCountry
ON tHOFF.[Country] = tCountry.[GetCountryName]
GO


