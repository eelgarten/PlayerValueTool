/*
Elias Elgarten & Kenneth Staley Jr
SQL Script for CS3200 Database Design Final Project (Player Value Tool)
*/
DROP DATABASE if exists playerValueTool;
CREATE DATABASE playerValueTool;
USE playerValueTool;

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
    DECLARE insertBool bool;
    DECLARE idDigit varchar(2);
    DECLARE CONTINUE HANDLER FOR 1062
    SELECT CONCAT('Duplicate value ',@playerId,' found.') as msg;

    SET @idDigit = 00;
    SET @playerId := CONCAT(pId,00);
    SET @insertBool = FALSE;

    WHILE @insertBool = FALSE DO

        INSERT INTO players VALUES (pName,@playerId,pos,sportName,teamName,salary);
        IF
            (SELECT ROW_COUNT() = 1) THEN SET @insertBool = TRUE;
        ELSE
            SET @playerId := CONCAT(pId,@idDigit := @idDigit + 1);
        END IF;
     END WHILE;
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
	IN pId varchar(20), newSalary int(10)
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
	SELECT * FROM players p WHERE sport = p.sport ORDER BY p.playerName ASC;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS get_player;
DELIMITER $$

CREATE PROCEDURE get_player
(
	IN pId varchar(30)
)
BEGIN
	DECLARE sportName char(3);
    DECLARE playerPosition char(3);
    DECLARE tableName varchar(40);
    
    SET @sportName = (SELECT p.sport FROM players p WHERE pId = p.playerId ORDER BY p.playerName);
    SET @playerPosition = (SELECT p.pos FROM players p WHERE pId = p.playerId ORDER BY p.playerName);
    
    IF @sportName = 'NBA' THEN SET @tableName = 'basketballplayerstats';
    ELSEIF @sportName = 'MLB' AND (@playerPosition = 'SP' OR @playerPosition = 'RP') THEN SET @tableName = 'baseballpitcherstats';
    ELSEIF @sportName = 'MLB' THEN SET @tableName = 'baseballhitterstats';
    ELSEIF @sportName = 'NFL' AND (@playerPosition = 'QB' OR @playerPosition = 'RB' OR @playerPosition = 'WR' OR @playerPosition = 'TE') THEN SET @tableName = 'footballoffensiveplayerstats';
    ELSEIF @sportName = 'NFL' AND (@playerPosition = 'G' OR @playerPosition = 'T' OR @playerPosition = 'C') THEN SET @tableName = 'footballoffensivelinestats';
    ELSEIF @sportName = 'NFL' THEN SET @tableName = 'footballdefensiveplayerstats';
    ELSE SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This sport or player does not exist.';
    END IF;
    
    SET @t1 := CONCAT("SELECT * FROM  players p JOIN ",@tableName," ON p.playerId = ",@tableName,".playerId ","WHERE ","'",pId,"'"," = ",@tableName,".playerId");
    PREPARE stmt FROM @t1;
    EXECUTE stmt;
	DEALLOCATE PREPARE stmt; 

END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS get_top_five_players;
DELIMITER $$

CREATE PROCEDURE get_top_five_players
(
    IN sport char(3)
)
BEGIN
    IF sport = 'NBA' THEN
        SELECT * FROM players p JOIN basketballplayerstats bp ON p.playerId = bp.playerId ORDER BY bp.valueOverReplacementPlayer DESC LIMIT 5;
    ELSEIF sport = 'MLB' THEN
        SELECT * FROM players p JOIN baseballpitcherstats pitch ON p.playerId = pitch.playerId ORDER BY pitch.winsAboveReplacement DESC LIMIT 5;
        SELECT * FROM players p JOIN baseballhitterstats hit ON p.playerId = hit.playerId ORDER BY hit.winsAboveReplacement DESC LIMIT 5;
	ELSEIF sport = 'NFL' THEN
        SELECT * FROM players p JOIN footballoffensiveplayerstats off ON p.playerId = off.playerId ORDER BY off.approximateValue DESC LIMIT 5;
        SELECT * FROM players p JOIN footballoffensivelinestats ol ON p.playerId = ol.playerId ORDER BY ol.approximateValue DESC LIMIT 5;
        SELECT * FROM players p JOIN footballdefensiveplayerstats def ON p.playerId = def.playerId ORDER BY def.approximateValue DESC LIMIT 5;
    END IF;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS get_top_twenty_players;
DELIMITER $$

CREATE PROCEDURE get_top_twenty_players
(
    IN sport char(3)
)
BEGIN
    IF sport = 'NBA' THEN
        SELECT p.playerId, p.playerName, p.pos, bp.valueOverReplacementPlayer FROM players p JOIN basketballplayerstats bp ON p.playerId = bp.playerId ORDER BY bp.valueOverReplacementPlayer DESC LIMIT 20;
    ELSEIF sport = 'MLB' THEN
        SELECT p.playerId, p.playerName, p.pos, coalesce(pitch.winsAboveReplacement, hit.winsAboveReplacement) as war
			FROM players p
			LEFT JOIN baseballpitcherstats pitch ON p.playerId = pitch.playerId
			LEFT JOIN baseballhitterstats hit ON p.playerId = hit.playerId
		WHERE p.sport = 'MLB'
		ORDER BY war DESC LIMIT 20;
	ELSEIF sport = 'NFL' THEN
        SELECT p.playerId, p.playerName, p.pos, coalesce(skill.approximateValue, def.approximateValue, line.approximateValue) as approxVal
			FROM players p 
			LEFT JOIN footballoffensiveplayerstats skill ON skill.playerId = p.playerId
			LEFT JOIN footballdefensiveplayerstats def on def.playerId = p.playerId
			LEFT JOIN footballoffensivelinestats line on line.playerId = p.playerId
		WHERE p.sport = 'NFL'
		ORDER BY approxVal DESC LIMIT 20;
    END IF;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS compare_players;
DELIMITER $$

CREATE PROCEDURE compare_players
(
	IN pID1 varchar(30), pID2 varchar(30)
)
BEGIN
    CALL get_player(pID1);
    CALL get_player(pID2);
END$$
DELIMITER ;