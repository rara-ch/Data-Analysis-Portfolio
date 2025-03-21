# AFL Data Analysis Project

## Aim

The aim of this project is to utise SQL, specifically MySQL and MySQL Workbench, to find interesting facts and insights about the Australian Football League (AFL) from the 2012 season to the 2024 season.

## Data
The data was sourced from Kaggle and can be found [here](https://www.kaggle.com/datasets/stoney71/aflstats). Please note that, using Excel, I altered the formatting of some columns to be more MySQL friendly. <br> 
<br>

The database contains three CSV files:
- **games** (Primary Key: **GameID**) --> every game from the beginning of the 2012 season to the end of the 2024 season.
- **players** (Primary Key: **PlayerID**) --> every player who played in the AFL between the 2012 and 2024 seasons.
- **stats** (Foreign Keys: **GameID** and **PlayerID**)  --> all stats from each player from each game. <br>

## Analysis
### Team Analysis
1. **How has each team performed from the 2012 to 2024 seasons?** <br>
[team_perfomance.sql](https://github.com/rara-ch/Data-Analysis-Portfolio/blob/main/Projects/AFL-Data-Analysis/SQL-files/team_performance.sql) <br>
The best season seen in the AFL since 2012 were Hawthorn in 2013, winning 86.4% of their games. They were followed by 2020 Brisbane and 2020 Port Adelaide who both won 82.6% of their games that season. Greater Western Sydney (GWS) in 2013 had the worst season, losing 95.5% of thier games. A noticable team that has performed well since 2012 are Sydney, who have won over 60% of their games every year, excluding 2019 (36.4%), 2020 (29.4%), and 2023 (52.2%).

2. **What is the average attendance for each team and venue?** <br>
[avg_attendance.sql](https://github.com/rara-ch/Data-Analysis-Portfolio/blob/main/Projects/AFL-Data-Analysis/SQL-files/avg_attendance.sql) <br>
The average attendance of all games since 2012 is 32,034. Collingwood averaged the most people at their games during this period with an average of 48,505 while Gold Coast had the least with an average of 16,942. Out of all the venues that held 15 or more games, the venue with the highest average attendance was the M.C.G with 51,934.

3. **How do different variables, such as wet versus dry and home versus away, affect the performance of each team?** <br>
*Home/Away* <br>
[home_versus_away.sql](https://github.com/rara-ch/Data-Analysis-Portfolio/blob/main/Projects/AFL-Data-Analysis/SQL-files/home_versus_away.sql) <br>
On average, a team wins 13% more of their games at home than away. Geelong has the biggest difference, winning 26.4% more of their games at home than away. Interestingly, Collingwood win 1% more games when they're away than at home while Melbourne win the exact same amount. <br>
*Wet/Dry* <br>
[wet_versus_dry.sql](https://github.com/rara-ch/Data-Analysis-Portfolio/blob/main/Projects/AFL-Data-Analysis/SQL-files/wet_versus_dry.sql) <br>
Brisbane have the biggest difference in win percentage in wet versus dry conditions winning 10.3% more of their games when it's dry compared to when it is wet. St. Kilda (10.1%) and Gold Coast (9.1%) follow them. On the other hand, Richmond win 8.2% more of their games in wet conditions compared to dry conditions, which is the biggest difference in teams who win more in the wet.

4. **For the 2024 season, what team averaged the most and least amount of tackles?** <br>
[avg_team_tackles_2024.sql](https://github.com/rara-ch/Data-Analysis-Portfolio/blob/main/Projects/AFL-Data-Analysis/SQL-files/avg_team_tackles_2024.sql) <br>
Port Adelaide averaged the most amount of tackles in 2024 with 66 per game. Richmond averaged the least amount of tackles with 51 per game. 

### Player Analysis
5. **Which players have the highest average perfomance in major statistics, such as disposals, goals, tackles, and marks?** <br>
[player_analysis.sql](https://github.com/rara-ch/Data-Analysis-Portfolio/blob/main/Projects/AFL-Data-Analysis/SQL-files/player_analysis.sql) <br>
These stats are only considering the players who have played at least 25 games since 2012. Dane Swan averaged the most amount of disposals per game since 2012 with 29.82 per game. The least was Jade Gresham with 17.68 per game. Lance Franklin averaged the highest amount of goals per game since 2012 with 2.9 per game. The least was Leigh Adams with 0.65 per game. Matt Rowell averaged the most amount of tackles per game since 2012 with 7.14 per game. The least was David Cuningham and Tim English with 3.17 each per game. Nick Riewoldt averaged the most marks per game since 2012 with 8.8 per game. Four players tied last with 4.47 marks per game each. <br>

6. **What is the average number of brownlow votes for a player in a season?** <br>
[player_analysis.sql](https://github.com/rara-ch/Data-Analysis-Portfolio/blob/main/Projects/AFL-Data-Analysis/SQL-files/player_analysis.sql) <br>
The average amount of votes for a player in a single season since 2012 is 1.78.

### General Analysis
7. **For every score, what percentage of scores are goals versus behinds?** <br>
[compared_goals_behinds.sql](https://github.com/rara-ch/Data-Analysis-Portfolio/blob/main/Projects/AFL-Data-Analysis/SQL-files/compared_goals_behinds.sql) <br>
For each score, 54.24% are goals while 45.76% are behinds. <br>

8. **Has the average combined scores for games changed over the seasons?** <br>
[avg_combined_scores.sql](https://github.com/rara-ch/Data-Analysis-Portfolio/blob/main/Projects/AFL-Data-Analysis/SQL-files/avg_combined_scores.sql) <br>
The average combined scores for games has generally decreased since 2012. In 2012 to 2013, the average combined scores were in the 180s, from 2014 to 2017, they were in the 170s, and frim 2018 onwards, the combined scores have been in the 160s (exculding 2020 when the average combined scores were 121).
