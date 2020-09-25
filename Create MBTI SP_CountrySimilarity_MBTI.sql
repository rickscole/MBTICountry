USE [MBTI]
GO

/****** Object:  StoredProcedure [MBTI].[SP_CountrySimilarity_MBTI]    Script Date: 9/25/2020 2:28:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		rsc
-- Create date: 2020-08-18_1710
-- Description:	get user similarity scores by country for MBTI
-- =============================================
CREATE PROCEDURE [MBTI].[SP_CountrySimilarity_MBTI]
@ID_Session INT,
@ID_Iteration INT,
@IterationType NVARCHAR(100), 
@User_I INT = 50,
@User_N INT = 50,
@User_T INT = 50,
@User_P INT = 50,
@User_A INT = 50,
@Provide_I INT,
@Provide_N INT,
@Provide_T INT,
@Provide_P INT,
@Provide_A INT


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
	ABS(CAST(ISNULL(@User_I,50) AS FLOAT) - [i]) * @Provide_I + 
	ABS(CAST(ISNULL(@User_N,50) AS FLOAT) - [n]) * @Provide_N +
	ABS(CAST(ISNULL(@User_T,50) AS FLOAT) - [t]) * @Provide_T +
	ABS(CAST(ISNULL(@User_P,50) AS FLOAT) - [p]) * @Provide_P +
	ABS(CAST(ISNULL(@User_A,50) AS FLOAT) - [a]) * @Provide_A
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



GO


