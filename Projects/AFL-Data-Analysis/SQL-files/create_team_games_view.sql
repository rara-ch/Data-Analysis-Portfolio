USE afl_db;

/*
Create a view that splits each game of the games table into two individual observations of that game for each team. Include
whether the game was won, lost, or drawn and whether the game was played home or away.
*/

CREATE VIEW team_games AS
WITH foundation_of_view AS ( 								-- Create everything but the result column.
					SELECT 	 GameID, year, Round, Date,
							 hometeam as Team,
							 'H' as HomeAway,
							 hometeamscore as TeamScore, 
							 awayteamscore as OpponentScore,
							 MaxTemp, MinTemp, Rainfall, Venue, StartTime, Attendance
					FROM 	 games
					UNION ALL
					SELECT 	 GameID, year, Round, Date,
							 awayteam as Team,
							 'A' as HomeAway,
							 awayteamscore as TeamScore,
							 hometeamscore as OpponentScore ,
							 MaxTemp, MinTemp, Rainfall, Venue, StartTime, Attendance
					FROM 	 games
)															-- Add the result column.
SELECT 	 GameID, Year, Round, Date, Team, HomeAway, TeamScore, OpponentScore,
		 CASE
			WHEN teamscore > opponentscore THEN 'W'
			WHEN teamscore < opponentscore THEN 'L'
			WHEN teamscore = opponentscore THEN 'D'
		 END as Result,
         MaxTemp, MinTemp, Rainfall, Venue, StartTime, Attendance
FROM 	 foundation_of_view;