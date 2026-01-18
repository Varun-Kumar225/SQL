-- 1.Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid,player FROM goal WHERE teamid= 'GER';

-- 2.Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2FROM game where id=1012;

-- 3.Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player,teamid,stadium,mdate FROM game JOIN goal ON (id=matchid) where teamid='GER';

-- 4.Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
select team1,team2,player from game g join goal go on g.id=go.matchid where player like'Mario%'; 

-- 5.Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
  FROM goal g join eteam e on g.teamid=e.id 
 WHERE gtime<=10;

-- 6.List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
select mdate, teamname from game g join eteam e on g.team1=e.id where coach='Fernando Santos';

-- 7.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
select player from goal g join game ga on g.matchid=ga.id where stadium='National Stadium, Warsaw';

-- 8.Instead show the name of all players who scored a goal against Germany.
