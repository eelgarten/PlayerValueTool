/**
 * Created by Elias Elgarten on 12/3/2016.
 */

var players = [];

var showGetPlayer = function() {
    $('#getPlayer').show();
    $('#addPlayer').hide();
    $('#updatePlayer').hide();
    $('#deletePlayer').hide();
};

var showAddPlayer = function() {
    $('#getPlayer').hide();
    $('#addPlayer').show();
    $('#updatePlayer').hide();
    $('#deletePlayer').hide();
};

var showUpdatePlayer = function () {
    $('#getPlayer').hide();
    $('#addPlayer').hide();
    $('#updatePlayer').show();
    $('#deletePlayer').hide();
};

var showDeletePlayer = function () {
    $('#getPlayer').hide();
    $('#addPlayer').hide();
    $('#updatePlayer').hide();
    $('#deletePlayer').show();
};

var getPlayers = function() {
    $.getJSON('/getplayers').done(function (data) {
        console.log('called');
        data.forEach(function (item) {
            players.push(item);
        });
        populateDropdown(players, 'player');
    });
};

var populateDropdown = function (list, elementId) {
    for (var i = 0; i < list.length; i++) {
        var select = document.getElementById(elementId),
            opt = document.createElement("option");
        opt.value = players[i].playerId;
        opt.textContent = players[i].playerName + ', ' + players[i].pos;
        select.appendChild(opt);
    }
};

$(document).ready(function () {
    var activeSport = 'none';

    $('#sport').change(function () {
        console.log('sport change');
        activeSport = $('select[name=selectSport]').val();
        if (activeSport !== 'none') {
            $('#playerList').show();
            $('#getPlayerButton').show();
        }
        else {
            $('#playerList').hide();
            $('#getPlayerButton').hide();
        }
        getPlayers();
    });
});

console.log(players);


