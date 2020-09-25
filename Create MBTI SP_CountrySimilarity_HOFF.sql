USE [MBTI]
GO

/****** Object:  StoredProcedure [MBTI].[SP_CountrySimilarity_HOFF]    Script Date: 9/25/2020 2:28:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		rsc
-- Create date: 2020-08-21_1327
-- Description:	get user similarity scores by country for HOFF
-- =============================================
CREATE PROCEDURE [MBTI].[SP_CountrySimilarity_HOFF]
@ID_Session INT,
@ID_Iteration INT,
@IterationType NVARCHAR(100), 
@User_pdi INT,
@User_idv INT,
@User_mas INT,
@User_uai INT,
@User_ivr INT,
@User_ltowvs INT,
@Provide_pdi INT,
@Provide_idv INT,
@Provide_mas INT,
@Provide_uai INT,
@Provide_ivr INT,
@Provide_ltowvs INT

AS
BEGIN

INSERT INTO [MBTI].[MBTI].[TBL_Iteration_HOFF] 
SELECT SYSDATETIME(),@ID_Iteration,@ID_Session,@User_pdi,@User_idv,@User_mas,@User_uai,@User_ivr,@User_ltowvs

DECLARE @ID_Iteration_HOFF INT = (SELECT MAX([PK_ID_Iteration_HOFF]) FROM [MBTI].[MBTI].[TBL_Iteration_HOFF])

;WITH tCountrySimilarities AS
(
	SELECT 
	[country]
	, [pdi]
	, [idv]
	, [mas]
	, [uai]
	, [ivr]
	, [ltowvs]
	, 
	ABS(CAST(ISNULL(@User_pdi,50) AS FLOAT) - [pdi]) * @Provide_pdi  + 
	ABS(CAST(ISNULL(@User_idv,50) AS FLOAT) - [idv]) * @Provide_idv +
	ABS(CAST(ISNULL(@User_mas,50) AS FLOAT) - [mas]) * @Provide_mas +
	ABS(CAST(ISNULL(@User_uai,50) AS FLOAT) - [uai]) * @Provide_ivr +
	ABS(CAST(ISNULL(@User_ivr,50) AS FLOAT) - [ivr]) * @Provide_ltowvs +
	ABS(CAST(ISNULL(@User_ltowvs,50) AS FLOAT) - [ltowvs])
	AS 'DeviationPoints'
	FROM [MBTI].[MBTI].[TBL_CountryValues_HOFF] tHOFF
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



GO


