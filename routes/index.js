var express = require('express');
var router = express.Router();
var connection = require('../connection');

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index', { title: 'Player Value Tool' });
});

/* GET index/getPlayers */
router.get('/getSportPlayers/:sport', function(req, res, next) {
    var sport = req.params.sport;
    var queryString = "CALL get_players_in_sport('" + sport + "')";
    connection.query(queryString, function (err, results, fields) {
        if (err) {
            return res.send('An error occurred:' + err);
        } else {
            return res.json(results);
        }
    });
});
module.exports = router;
