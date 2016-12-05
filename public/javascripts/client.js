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

var getPlayers = function(sport) {
    console.log('getPlayers');
    console.log(sport);
    $.getJSON('/getSportPlayers/' + sport).done(function (data) {
        players = [];
        data[0].forEach(function (item) {
            players.push(item);
        });
        clearDropdown('player');
        populateDropdown(players, 'player');
    });
};

var clearDropdown = function(elementId) {
    var dropdown = document.getElementById(elementId);
    while (dropdown.firstChild) {
        dropdown.removeChild(dropdown.firstChild);
    }
};

var populateDropdown = function (list, elementId) {
    for (var i = 0; i < list.length; i++) {
        var select = document.getElementById(elementId),
            opt = document.createElement("option");
        opt.value = players[i].playerId;
        opt.textContent = players[i].playerName + ', ' + players[i].pos;
        select.append(opt);
    }
};

$(document).ready(function () {
    var activeSport = 'none';

    var getActiveSport = function () {
        return $('select[name=selectSport]').val();
    }

    $('#sport').change(function () {
        activeSport = getActiveSport();
        if (activeSport !== 'none') {
            $('#playerList').show();
            $('#getPlayerButton').show();
        }
        else {
            $('#playerList').hide();
            $('#getPlayerButton').hide();
        }

        if (activeSport !== 'none') {
            getPlayers(activeSport);
        }
    });
});

console.log(players);


