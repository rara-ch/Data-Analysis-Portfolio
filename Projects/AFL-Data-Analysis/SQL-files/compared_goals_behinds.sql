USE afl_db;

WITH  scores AS (
		SELECT 	 GameID,
			 CAST(SUBSTRING_INDEX(HomeTeamScoreFT, '.', 1) AS UNSIGNED) as HomeGoals,
			 CAST(SUBSTRING_INDEX(HomeTeamScoreFT, '.', -1) AS UNSIGNED) as HomeBehinds,
			 CAST(SUBSTRING_INDEX(AwayTeamScoreFT, '.', 1) AS UNSIGNED) as AwayGoals,
			 CAST(SUBSTRING_INDEX(HomeTeamScoreFT, '.', -1) AS UNSIGNED) as AwayBehinds
		FROM 	 games
),
total_scores AS (
		SELECT 	 GameID,
			 HomeGoals + AwayGoals as Goals,
			 AwayBehinds + AwayBehinds as Behinds,
			 HomeGoals + AwayGoals + AwayBehinds + AwayBehinds as TotalScores
		FROM 	 scores
)
SELECT 	 ROUND((SUM(Goals)/SUM(TotalScores)) * 100 , 2) as PercentageGoals,
		 ROUND((SUM(Behinds)/SUM(TotalScores)) * 100 , 2) as PercentageBehinds
FROM 	 total_scores;
