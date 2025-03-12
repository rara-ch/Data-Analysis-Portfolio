USE afl_db;

-- The highest average disposals per game among players who have played at least 25 games since 2012.
SELECT	 DisplayName, 
		 ROUND(AVG(Disposals), 2) as AvgDisposals,
         COUNT(*) as GamesPlayed
FROM 	 stats
GROUP BY DisplayName
HAVING 	 COUNT(*) >= 25
ORDER BY AVG(Disposals) DESC;

-- The highest average goals per game among players who have played at least 25 games since 2012.
SELECT 	 DisplayName,
		 AVG(Goals) as AvgGoals,
         COUNT(*) as GamesPlayed
FROM 	 stats
GROUP BY DisplayName
HAVING 	 COUNT(*) >= 25
ORDER BY AVG(Goals) DESC;

-- The highest average tackles per game among players who have played at least 25 games since 2012.
SELECT 	 DisplayName,
		 ROUND(AVG(Tackles), 2) as AvgTackles,
         COUNT(*) as GamesPlayed
FROM 	 stats
GROUP BY DisplayName
HAVING 	 COUNT(*) >= 25
ORDER BY AVG(Tackles) DESC;

-- The highest average marks per game among players who have played at least 25 games since 2012.
SELECT 	 DisplayName,
		 ROUND(AVG(Marks), 2) as AvgMarks,
         COUNT(*) as GamesPlayed
FROM 	 stats
GROUP BY DisplayName
HAVING 	 COUNT(*) >= 25
ORDER BY AVG(Marks) DESC;

-- The average number of brownlow votes a player will get in a season since 2012.
WITH brownlow AS (
			SELECT   Year, DisplayName,
					 SUM(BrownlowVotes) as TotalBrownlowVotes
			FROM 	 stats
			GROUP BY Year, DisplayName
			ORDER BY SUM(BrownlowVotes) DESC)
SELECT 	 ROUND(AVG(TotalBrownlowVotes), 2) as AvgVotes
FROM	 brownlow;

