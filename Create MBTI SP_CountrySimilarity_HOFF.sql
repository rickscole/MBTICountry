USE [MBTI]
GO
/****** Object:  StoredProcedure [MBTI].[SP_CountrySimilarity_MBTI]    Script Date: 8/21/2020 11:19:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		rsc
-- Create date: 2020-08-21_1327
-- Description:	get user similarity scores by country for HOFF
-- =============================================
ALTER PROCEDURE [MBTI].[SP_CountrySimilarity_HOFF]
@ID_Session INT,
@ID_Iteration INT,
@IterationType NVARCHAR(100), 
@User_pdi INT,
@User_idv INT,
@User_mas INT,
@User_uai INT,
@User_ivr INT,
@User_ltowvs INT
AS
BEGIN

INSERT INTO [MBTI].[MBTI].[TBL_Iteration_HOFF] 
SELECT SYSDATETIME(),@ID_Iteration,@ID_Session,@User_pdi,@User_idv,@User_mas,@User_uai,@User_ivr,@User_ltowvs

DECLARE @ID_Iteration_HOFF INT = (SELECT MAX([PK_ID_Iteration_HOFF]) FROM [MBTI].[MBTI].[TBL_Iteration_HOFF])

;WITH tHoffMax AS
(
	SELECT 
	MAX([pdi]) AS [pdi_MAX]
	, MAX([idv]) AS [idv_MAX]
	, MAX([mas]) AS [mas_MAX]
	, MAX([uai]) AS [uai_MAX]
	, MAX([ivr]) AS [ivr_MAX]
	, MAX([ltowvs]) AS [ltowvs_MAX]
	FROM [MBTI].[MBTI].[TBL_CountryValues_HOFF] tHoff
),
tHoffAdjusted AS
(
	SELECT 
	tHoff.[PK_ID_CountryValues_HOFF]
	, tHoff.[country]
	, tHoff.[pdi] * 100 / tHoffMax.[pdi_MAX] AS [pdi]
	, tHoff.[idv] * 100 / tHoffMax.[idv_MAX] AS [idv]
	, tHoff.[mas] * 100 / tHoffMax.[mas_MAX] AS [mas]
	, tHoff.[uai] * 100 / tHoffMax.[uai_MAX] AS [uai]
	, tHoff.[ivr] * 100 / tHoffMax.[ivr_MAX] AS [ivr]
	, tHoff.[ltowvs] * 100 / tHoffMax.[ltowvs_MAX] AS [ltowvs]
	FROM [MBTI].[MBTI].[TBL_CountryValues_HOFF] tHoff,
	tHoffMax
), 
tCountrySimilarities AS
(
	SELECT 
	[country]
	, [pdi]
	, [idv]
	, [mas]
	, [uai]
	, [ivr]
	, [ltowvs]
	, ABS(CAST(@User_pdi AS FLOAT) - [pdi]) + 
	ABS(CAST(@User_idv AS FLOAT) - [idv]) +
	ABS(CAST(@User_mas AS FLOAT) - [mas]) +
	ABS(CAST(@User_uai AS FLOAT) - [uai]) +
	ABS(CAST(@User_ivr AS FLOAT) - [ivr]) + 
	ABS(CAST(@User_ltowvs AS FLOAT) - [ltowvs])
	AS 'DeviationPoints'
	FROM tHoffAdjusted
),
tMaxAndMinDP AS
(
	SELECT t1.[DeviationPoints_MAX], t2.[DeviationPoints_MIN] FROM
	(SELECT MAX([DeviationPoints]) AS [DeviationPoints_MAX] FROM tCountrySimilarities) t1,
	(SELECT MIN([DeviationPoints]) AS [DeviationPoints_MIN] FROM tCountrySimilarities) t2
)
INSERT INTO [MBTI].[MBTI].[TBL_Similarity_HOFF]
SELECT 
SYSDATETIME()
, @ID_Iteration_HOFF
, @ID_Iteration
, @ID_Session
, tCountrySimilarities.*
, (1 - (tCountrySimilarities.[DeviationPoints] - tMaxAndMinDP.[DeviationPoints_MIN]) / (tMaxAndMinDP.[DeviationPoints_MAX] - tMaxAndMinDP.[DeviationPoints_MIN])) * 100 AS Closeness
FROM tCountrySimilarities,
tMaxAndMinDP
ORDER BY tCountrySimilarities.[DeviationPoints] ASC

END



