var express = require('express');
var router = express.Router();
var connection = require('../connection');

/* GET home page. */
router.get('/', function(req, res) {
    res.render('index', { title: 'Player Value Tool' });
});

/* GET /getSportPlayers/:sport */
// Gets all the players that play the given sport
router.get('/getSportPlayers/:sport', function(req, res) {
    var sport = req.params.sport;

    // calls the "get_players_in_sport()" db procedure
    var queryString = 'CALL get_players_in_sport(?)';
    connection.query(queryString, [sport], function (err, results, fields) {
        if (err) {
            return res.send('An error occurred:' + err);
        } else {
            return res.json(results);
        }
    });
});

/* GET /getPlayer/:playerId */
router.get('/getPlayer/:playerId', function(req, res) {
    var playerId = req.params.playerId;

    // calls the "get_player" db procedure
    var queryString = "CALL get_player (?)";
    connection.query(queryString, [playerId], function(err, results, fields) {
        if (err) {
            return res.send('An error occurred:' + err);
        } else {
            return res.json(results);
        }
    });
});

/* GET /deletePlayer/:playerId */
router.get('/deletePlayer/:playerId', function(req, res) {
    var playerId = req.params.playerId;

    var queryString = "CALL delete_player (?)";
    connection.query(queryString, [playerId], function(err, results, fields) {
        if (err) {
            res.sendStatus(404);
        } else {
            res.status(200).send({message: "success"});
        }
    });
});

/* POST /updatePlayer */
router.post('/updatePlayer', function(req, res) {
    console.log(req.body);
    var playerId = req.body.playerId;
    var team = req.body.team;

    var queryString = "CALL update_players_team (?, ?)";
    connection.query(queryString, [playerId, team], function (err, results, fields) {
        if (err) {
            res.sendStatus(404);
        } else {
            res.status(200).send({message: "player updated"});
        }
    });
});

/* POST /addPlayer */
router.post('/addPlayer', function(req, res) {
    console.log(req.body);
    var playerName = req.body.playerName;
    var newId = req.body.playerId;

    var nameArray = playerName.split(' ');
    if (nameArray.length > 1) {
        newId = nameArray[0].substring(0, 1) + nameArray[1].substring(0, 4) + '00';
    } else {
        newId = nameArray[0].substring(0, 5) + '00';
    }

    var playerId = newId;
    var position = req.body.position;
    var sport = req.body.sport;
    var teamName = req.body.teamName;
    var salary = req.body.salary;
    console.log(playerName);
    console.log(playerId);
    
    var queryString = "CALL add_to_players_table (?, ?, ?, ?, ?, ?)";
    connection.query(queryString, [playerName, playerId, position, sport, teamName, salary], function (err, results, fields){
        if (err) {
            console.log('sql error');
            console.log(err);
            res.sendStatus(404);
        } else {
            res.render('index', { title: 'Player Value Tool', message: "Player add"});
        }
    });
});

/* GET /getMostValuablePlayers/:sport */
router.get('/getMostValuablePlayers/:sport', function (req, res) {
    var sport = req.params.sport;

    var queryString = "CALL get_top_five_players (?)";
    connection.query(queryString, [sport], function (err, results, fields) {
        if (err) {
            return res.send('An error occurred:' + err);
        } else {
            return res.json(results);
        }
    })
});

module.exports = router;
