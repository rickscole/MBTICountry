USE [MBTI]
GO
/****** Object:  StoredProcedure [MBTI].[SP_CountrySimilarity_BFIVE]    Script Date: 9/25/2020 2:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		rsc
-- Create date: 2020-08-21_1327
-- Description:	get user similarity scores by country for HOFF
-- =============================================
ALTER PROCEDURE [MBTI].[SP_CountrySimilarity_BFIVE]
@ID_Session INT,
@ID_Iteration INT,
@IterationType NVARCHAR(100), 
@User_Extraversion INT,
@User_Agreeableness INT,
@User_Conscientiousness INT,
@User_Neuroticism INT,
@User_Openness INT,
@Provide_Extraversion INT,
@Provide_Agreeableness INT,
@Provide_Conscientiousness INT,
@Provide_Neuroticism INT,
@Provide_Openness INT
AS
BEGIN

INSERT INTO [MBTI].[MBTI].[TBL_Iteration_BFIVE] 
SELECT SYSDATETIME(),@ID_Iteration,@ID_Session,@User_Extraversion,@User_Agreeableness,@User_Conscientiousness,@User_Neuroticism,@User_Openness

DECLARE @ID_Iteration_BFIVE INT = (SELECT MAX([PK_ID_Iteration_BFIVE]) FROM [MBTI].[MBTI].[TBL_Iteration_BFIVE])

;WITH tCountrySimilarities AS
(
	SELECT 
	[country]
	, [extraversion]
	, [agreeableness]
	, [conscientiousness]
	, [neuroticism]
	, [openness]
	, 
	ABS(CAST(ISNULL(@User_Extraversion,50) AS FLOAT) - [extraversion]) * @Provide_Extraversion + 
	ABS(CAST(ISNULL(@User_Agreeableness,50) AS FLOAT) - [agreeableness]) * @Provide_Agreeableness +
	ABS(CAST(ISNULL(@User_Conscientiousness,50) AS FLOAT) - [conscientiousness]) * @Provide_Conscientiousness +
	ABS(CAST(ISNULL(@User_Neuroticism,50) AS FLOAT) - [neuroticism]) * @Provide_Neuroticism * @Provide_Openness +
	ABS(CAST(ISNULL(@User_Openness,50) AS FLOAT) - [openness])
	AS 'DeviationPoints'
	FROM [MBTI].[MBTI].[TBL_CountryValues_BFIVE] tBfive
),
tMaxAndMinDP AS
(
	SELECT t1.[DeviationPoints_MAX], t2.[DeviationPoints_MIN] FROM
	(SELECT MAX([DeviationPoints]) AS [DeviationPoints_MAX] FROM tCountrySimilarities) t1,
	(SELECT MIN([DeviationPoints]) AS [DeviationPoints_MIN] FROM tCountrySimilarities) t2
)
INSERT INTO [MBTI].[MBTI].[TBL_Similarity_BFIVE]
SELECT 
SYSDATETIME()
, @ID_Iteration_BFIVE
, @ID_Iteration
, @ID_Session
, tCountrySimilarities.*
, (1 - (tCountrySimilarities.[DeviationPoints] - tMaxAndMinDP.[DeviationPoints_MIN]) / (tMaxAndMinDP.[DeviationPoints_MAX] - tMaxAndMinDP.[DeviationPoints_MIN])) * 100 AS Closeness
FROM tCountrySimilarities,
tMaxAndMinDP
ORDER BY tCountrySimilarities.[DeviationPoints] ASC

END



