var express = require('express');
var router = express.Router();
var connection = require('../connection');

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index', { title: 'Player Value Tool' });
});

/* GET index/getPlayers */
router.get('/getPlayers', function(req, res, next) {
    connection.query('SELECT * FROM players LIMIT 20', function (err, results, fields) {
        if (err) {
            return res.send('An error occurred:' + err);
            next();
        } else {
            return res.json(results);
        }
    });
});
module.exports = router;
