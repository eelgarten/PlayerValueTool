var express = require('express');
var router = express.Router();
var connection = require('../connection');

/* GET home page. */
router.get('/', function(req, res) {
    res.render('index', { title: 'Player Value Tool' });
});

/*router.post('/', function(req, res) {
    res.render('index', { title: 'Player Value Tool'});
});*/

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


router.get('/deletePlayer/:playerId', function(req, res, next) {
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



module.exports = router;
