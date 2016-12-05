/*
Elias Elgarten & Kenneth Staley Jr
SQL Script for CS3200 Database Design Final Project (Player Value Tool)
*/
DROP DATABASE if exists finalProject;
CREATE DATABASE finalProject;
USE finalProject;

CREATE TABLE players
(
	playerName char(30) NOT NULL,
	playerId varchar(20) PRIMARY KEY,
	pos char(3) NOT NULL,
	sport char(3) NOT NULL,
	team char(3) NOT NULL,
	salary int(10) NOT NULL
);

CREATE TABLE footballOffensivePlayerStats
(
	playerId varchar(20) PRIMARY KEY,
	approximateValue int(2),
	passingYards int(4),
	passingTD int(2),
	yardsPerCompletion DECIMAL(3,1),
	yardsPerAttempt DECIMAL(3,1),
	completionPercentage DECIMAL(3,1),
	rushingAttempts int(3),
	rushingYards int(4),
	rushingTD int(2),
	targets int(3),
	receptions int(3),
	receivingYards int(4),
	receivingTD int(2),
	fumbles int(2),
	interceptions int(2),
	CONSTRAINT offensive_skillplayer_id
		FOREIGN KEY (playerId)
		REFERENCES players(playerId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE footballDefensivePlayerStats
(
	playerId varchar(20) PRIMARY KEY,
	approximateValue int(2),
	totalTackles int(3),
	assistedTackles int(3),
	sacks int(2),
	passesDefended int(2),
	interceptions int(2),
	forcedFumbles int(2),
	fumblesRecovered int(2),
	defensiveTD int(1),
	CONSTRAINT defensive_player_id
		FOREIGN KEY (playerId)
		REFERENCES players(playerId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE footballOffensiveLineStats
(
	playerId varchar(20) PRIMARY KEY,
	approximateValue int(2),
	sacksAllowed int(2),
	qbHits int(2),
	qbHurries int(2),
	penaltiesCommitted int(2),
	penaltiesAccepted int(2),
	CONSTRAINT offensive_lineman_id
		FOREIGN KEY (playerId)
		REFERENCES players(playerId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE basketballPlayerStats
(
	playerId varchar(20) PRIMARY KEY,
	gamesPlayed int(2),
	playerEfficiencyRating DECIMAL(3,1),
	pointsPerGame DECIMAL(3,1),
	reboundsPerGame DECIMAL(3,1),
	assistsPerGame DECIMAL(3,1),
	stealsPerGame DECIMAL(3,1),
	blocksPerGame DECIMAL(3,1),
	fieldGoalPercentage DECIMAL (4,3),
	trueShootingPercentage DECIMAL(4,3),
	usagePercentage DECIMAL(3,1),
	valueOverReplacementPlayer DECIMAL(2,1),
	CONSTRAINT basketball_player_id
		FOREIGN KEY (playerId)
		REFERENCES players(playerId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE baseballHitterStats
(
	playerId varchar(20) PRIMARY KEY,
	atBats int(3),
	runsScored int(3),
	hits int(3),
	doubles int(2),
	triples int(2),
	homeruns int(2),
	runsBattedIn int(3),
	stolenBases int(3),
	caughtStealing int(3),
	walksDrawn int(3),
	strikeouts int(3),
	battingAverage DECIMAL(4,3),
	onBasePercentage DECIMAL(4,3),
	sluggingPercentage DECIMAL(4,3),
	onBasePlusSlugging DECIMAL(4,3),
	winsAboveReplacement DECIMAL(4,2),
	CONSTRAINT hitter_id
		FOREIGN KEY (playerId)
		REFERENCES players(playerId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE baseballPitcherStats
(
	playerId varchar(20) PRIMARY KEY,
	gamesPitched int(2),
	gamesStarted int(2),
	inningsPitched DECIMAL(4,1),
	hitsAllowed int(3),
	runsGivenUp int(3),
	earnedRuns int(3),
	walksAllowed int(3),
	strikeouts int(3),
	wins int(2),
	losses int(2),
	saves int(2),
	blownSaves int(2),
	walksPlusHitsAllowedPerInningsPitched DECIMAL(3,2),
	earnedRunAverage DECIMAL(3,2),
	winsAboveReplacement DECIMAL(4,2),
	CONSTRAINT pitcher_id
		FOREIGN KEY (playerId)
		REFERENCES players(playerId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Procedures

-- Hitters
DROP PROCEDURE IF EXISTS get_baseball_hitter;
DELIMITER $$

CREATE PROCEDURE get_baseball_hitter
(
	IN pName varchar(30), sportName char(3)
)
BEGIN
	SELECT p.playerName, p.pos, bh.* -- bh = baseball hitter
	FROM players p JOIN baseballhitterstats bh ON p.playerId = bh.playerId
	WHERE pName = p.playerName AND sportName = p.sport
	ORDER BY p.playerName; 
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS add_baseball_hitter;
DELIMITER $$

CREATE PROCEDURE add_baseball_hitter
(
	IN pId varchar(20), atBats int(3), runsScored int(3), hits int(3),
	doubles int(2), triples int(2), homeruns int(2), runsBattedIn int(3),
	stolenBases int(3), caughtStealing int(3), walksDrawn int(3), strikeouts int(3),
	battingAverage DECIMAL(4,3), onBasePercentage DECIMAL(4,3), sluggingPercentage DECIMAL(4,3),
	onBasePlusSlugging DECIMAL(4,3), winsAboveReplacement DECIMAL(4,2)
)
BEGIN
DECLARE checkPlayerTable varchar(50);

	SET checkPlayerTable := IFNULL((SELECT p.playerId FROM players p WHERE pId = p.playerId),'0');
	IF checkPlayerTable <> '0' THEN INSERT INTO baseballhitterstats VALUES (pId,atBats,runsScored,hits,doubles,triples,homeruns,
		runsBattedIn, stolenBases,caughtStealing,walksDrawn,strikeouts,battingAverage,onBasePercentage,
		sluggingPercentage, onBasePlusSlugging,winsAboveReplacement);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This player does not exist in the players table.';
	END IF;
END$$
DELIMITER ;

-- Pitcher
DROP PROCEDURE IF EXISTS get_baseball_pitcher;
DELIMITER $$

CREATE PROCEDURE get_baseball_pitcher
(
	IN pName varchar(30), sportName char(3)
)
BEGIN
	SELECT p.playerName, p.pos, bp.* -- bp = baseball pitcher
	FROM players p JOIN baseballpitcherstats bp ON p.playerId = bp.playerId
	WHERE pName = p.playerName AND sportName = p.sport
	ORDER BY p.playerName; 
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS add_baseball_pitcher;
DELIMITER $$

CREATE PROCEDURE add_baseball_pitcher
(
	IN pId varchar(20), gamesPitched int(2), gamesStarted int(2), inningsPitched DECIMAL(4,1), hitsAllowed int(3),
	runsGivenUp int(3), earnedRuns int(3), walksAllowed int(3), strikeouts int(3), wins int(2), losses int(2),
	saves int(2), blownSaves int(2), walksPlusHitsAllowedPerInningsPitched DECIMAL(3,2), earnedRunAverage DECIMAL(3,2),
	winsAboveReplacement DECIMAL(4,2)
)
BEGIN
DECLARE checkPlayerTable varchar(50);

	SET checkPlayerTable := IFNULL((SELECT p.playerId FROM players p WHERE pId = p.playerId),'0');
	IF checkPlayerTable <> '0' THEN INSERT INTO baseballpitcherstats VALUES (pId,gamesPitched,gamesStarted,inningsPitched,hitsAllowed,runsGivenUp,earnedRuns,
		walksAllowed,strikeouts,wins,losses,saves,blownSaves,walksPlusHitsAllowedperInningsPitched,earnedRunAverage,winsAboveReplacement);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This player does not exist in the players table.';
	END IF;
END$$
DELIMITER ;

-- Basketball
DROP PROCEDURE IF EXISTS get_basketball_player;
DELIMITER $$

CREATE PROCEDURE get_basketball_player
(
	IN pName varchar(30), sportName char(3)
)
BEGIN
	SELECT p.playerName, p.pos, bball.* -- bball = basketball
	FROM players p JOIN basketballplayerstats bball ON p.playerId = bball.playerId
	WHERE pName = p.playerName AND sportName = p.sport
	ORDER BY p.playerName; 
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS add_basketball_player;
DELIMITER $$

CREATE PROCEDURE add_basketball_player
(
	IN  pId varchar(20), gamesPlayed int(2), playerEfficiencyRating DECIMAL(3,1), ppg DECIMAL(3,1),
	rpg DECIMAL(3,1), apg DECIMAL(3,1), spg DECIMAL(3,1), bpg DECIMAL(3,1),
	fieldGoalPercentage DECIMAL (4,3), trueShootingPercentage DECIMAL(4,3), usagePercentage DECIMAL(3,1), valueOverReplacementPlayer DECIMAL(2,1)
)
BEGIN
DECLARE checkPlayerTable varchar(50);

	SET checkPlayerTable := IFNULL((SELECT p.playerId FROM players p WHERE pId = p.playerId),'0');
	IF checkPlayerTable <> '0' THEN INSERT INTO basketballplayerstats VALUES (pId,gamesPlayed,playerEfficiencyRating,ppg,rpg,apg,spg,bpg,
		fieldGoalPercentage,trueShootingPercentage,usagePercentage,valueOverReplacementPlayer);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This player does not exist in the players table.';
	END IF;
END$$
DELIMITER ;

-- Football skill position players (offense)
DROP PROCEDURE IF EXISTS get_football_skill_position_player;
DELIMITER $$

CREATE PROCEDURE get_football_skill_position_player
(
	IN pName varchar(30), sportName char(3)
)
BEGIN
	SELECT p.playerName, p.pos, fs.* -- fs = football skill position player
	FROM players p JOIN footballoffensiveplayerstats fs ON p.playerId = fs.playerId
	WHERE pName = p.playerName AND sportName = p.sport
	ORDER BY p.playerName; 
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS add_football_skill_position_player;
DELIMITER $$

CREATE PROCEDURE add_football_skill_position_player
(
	IN pId varchar(20), approximateValue int(2), passingYards int(4), passingTD int(2), yardsPerCompletion DECIMAL(3,1), yardsPerAttempt DECIMAL(3,1),
	completionPercentage DECIMAL(3,1), rushingAttempts int(3), rushingYards int(4), rushingTD int(2), targets int(3), receptions int(3), receivingYards int(4),
	receivingTD int(2), fumbles int(2), interceptions int(2)
)
BEGIN
DECLARE checkPlayerTable varchar(50);

	SET checkPlayerTable := IFNULL((SELECT p.playerId FROM players p WHERE pId = p.playerId),'0');
	IF checkPlayerTable <> '0' THEN INSERT INTO footballoffensiveplayerstats VALUES (pId,approximateValue,passingYards,passingTD,yardsPerCompletion,yardsPerAttempt,
		completionPercentage,rushingAttempts,rushingYards,rushingTD,targets,receptions,receivingYards,receivingTD,fumbles,interceptions);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This player does not exist in the players table.';
	END IF;
END$$
DELIMITER ;

-- Football offensive lineman
DROP PROCEDURE IF EXISTS get_football_offensive_lineman;
DELIMITER $$

CREATE PROCEDURE get_football_offensive_lineman
(
	IN pName varchar(30), sportName char(3)
)
BEGIN
	SELECT p.playerName, p.pos, fol.* -- fs = football skill position player
	FROM players p JOIN footballoffensivelinestats fol ON p.playerId = fol.playerId
	WHERE pName = p.playerName AND sportName = p.sport
	ORDER BY p.playerName; 
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS add_football_offensive_lineman;
DELIMITER $$

CREATE PROCEDURE add_football_offensive_lineman
(
	IN 	pId varchar(20), approximateValue int(2), sacksAllowed int(2), qbHits int(2), qbHurries int(2),
	penaltiesCommitted int(2), penaltiesAccepted int(2)
)
BEGIN
DECLARE checkPlayerTable varchar(50);

	SET checkPlayerTable := IFNULL((SELECT p.playerId FROM players p WHERE pId = p.playerId),'0');
	IF checkPlayerTable <> '0' THEN INSERT INTO footballoffensivelinestats VALUES (pId,approximateValue,sacksAllowed,qbHits,qbHurries,
		penaltiesCommitted,penaltiesAccepted);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This player does not exist in the players table.';
	END IF;
END$$
DELIMITER ;

-- Football defensive players
DROP PROCEDURE IF EXISTS get_football_defensive_player;
DELIMITER $$

CREATE PROCEDURE get_football_defensive_player
(
	IN pName varchar(30), sportName char(3)
)
BEGIN
	SELECT p.playerName, p.pos, fd.* -- fd = football defensive player
	FROM players p JOIN footballdefensiveplayerstats fd ON p.playerId = fd.playerId
	WHERE pName = p.playerName AND sportName = p.sport
	ORDER BY p.playerName; 
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS add_football_defensive_player;
DELIMITER $$

CREATE PROCEDURE add_football_defensive_player
(
	IN 	pId varchar(20), approximateValue int(2), totalTackles int(3), assistedTackles int(3), sacks int(2),
	passesDefended int(2), interceptions int(2), forcedFumbles int(2), fumblesRecovered int(2), defensiveTD int(1)
)
BEGIN
DECLARE checkPlayerTable varchar(50);

	SET checkPlayerTable := IFNULL((SELECT p.playerId FROM players p WHERE pId = p.playerId),'0');
	IF checkPlayerTable <> '0' THEN INSERT INTO footballdefensiveplayerstats VALUES (pId,approximateValue,totalTackles,assistedTackles,sacks,
		passesDefended,interceptions,forcedFumbles,fumblesRecovered,defensiveTD);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This player does not exist in the players table.';
	END IF;
END$$
DELIMITER ;

-- Add to players table
DROP PROCEDURE IF EXISTS add_to_players_table;
DELIMITER $$

CREATE PROCEDURE add_to_players_table
(
	IN pName varchar(30), pID varchar(20), pos char(3), sportName char(3), teamName char(3), salary int(10)
)
BEGIN 
	INSERT INTO players VALUES (pName,pID,pos,sportName,teamName,salary);
END$$
DELIMITER ;

-- Delete from players table
DROP PROCEDURE IF EXISTS delete_player;
DELIMITER $$

CREATE PROCEDURE delete_player
(
	IN pId varchar(20)
)
BEGIN
	DELETE FROM players  WHERE pId = players.playerId;
END$$
DELIMITER ;

-- Update player's team
DROP PROCEDURE IF EXISTS update_players_team;
DELIMITER $$
CREATE PROCEDURE update_players_team
(
	IN pId varchar(20), newTeam char(3)
)
BEGIN
	UPDATE players SET players.team = newTeam WHERE pId = players.playerId;
END$$
DELIMITER ;

-- Update player's salary
DROP PROCEDURE IF EXISTS update_players_salary;
DELIMITER $$
CREATE PROCEDURE update_players_salary
(
	IN pId varchar(20), newSalary char(3)
)
BEGIN
	UPDATE players SET players.salary = newSalary WHERE pId = players.playerId;
END$$
DELIMITER ;

-- Get players by sport
DROP PROCEDURE IF EXISTS get_players_in_sport;
DELIMITER $$
CREATE PROCEDURE get_players_in_sport
(
	IN sport char(3)
)
BEGIN
	SELECT p.playerId FROM players p WHERE sport = p.sport;
END$$
DELIMITER ;