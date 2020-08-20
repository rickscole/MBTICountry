USE [MBTI]
GO
/****** Object:  StoredProcedure [MBTI].[SP_CountrySimilarity_MBTI]    Script Date: 8/20/2020 10:53:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		rsc
-- Create date: 2020-08-18_1710
-- Description:	get user similarity scores by country for MBTI
-- =============================================
ALTER PROCEDURE [MBTI].[SP_CountrySimilarity_MBTI]
@ID_Session INT,
@ID_Iteration INT,
@IterationType NVARCHAR(100), 
@User_I INT,
@User_N INT,
@User_T INT,
@User_P INT,
@User_A INT
AS
BEGIN


INSERT INTO [MBTI].[MBTI].[TBL_Iteration_MBTI] 
SELECT SYSDATETIME(),@ID_Iteration,@ID_Session,@User_I,@User_N,@User_T,@User_P,@User_A

DECLARE @ID_Iteration_MBTI INT = (SELECT MAX([PK_ID_Iteration_MBTI]) FROM [MBTI].[MBTI].[TBL_Iteration_MBTI])

;WITH tCountrySimilarities AS
(
	SELECT [country],
	[i],
	[n],
	[t],
	[p],
	[a],
	ABS(CAST(@User_I AS FLOAT) - [i]) + 
	ABS(CAST(@User_N AS FLOAT) - [n]) +
	ABS(CAST(@User_T AS FLOAT) - [t]) +
	ABS(CAST(@User_P AS FLOAT) - [p]) +
	ABS(CAST(@User_A AS FLOAT) - [a])
	AS 'DeviationPoints'
	FROM [MBTI].[TBL_CountryValues_MBTI]
),
tMaxAndMinDP AS
(
	SELECT t1.[DeviationPoints_MAX], t2.[DeviationPoints_MIN] FROM
	(SELECT MAX([DeviationPoints]) AS [DeviationPoints_MAX] FROM tCountrySimilarities) t1,
	(SELECT MIN([DeviationPoints]) AS [DeviationPoints_MIN] FROM tCountrySimilarities) t2
)
INSERT INTO [MBTI].[MBTI].[TBL_Similarity_MBTI]
SELECT 
SYSDATETIME()
, @ID_Iteration
, @ID_Session
, tCountrySimilarities.*
, (1 - (tCountrySimilarities.[DeviationPoints] - tMaxAndMinDP.[DeviationPoints_MIN]) / (tMaxAndMinDP.[DeviationPoints_MAX] - tMaxAndMinDP.[DeviationPoints_MIN])) * 100 AS Closeness
, @ID_Iteration_MBTI
FROM tCountrySimilarities,
tMaxAndMinDP
ORDER BY tCountrySimilarities.[DeviationPoints] ASC

END



