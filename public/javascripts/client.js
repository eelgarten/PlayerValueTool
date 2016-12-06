/**
 * Created by Elias Elgarten on 12/3/2016.
 */

var players = [];
var currentAction = "";

/* --- Functions to get and submit data to API */

/* Gets the players for a given sport, to be used in dropdown display */
var getSportPlayers = function (sport) {
    $.getJSON('/getSportPlayers/' + sport).done(function (data) {
        players = [];
        data[0].forEach(function (item) {
            players.push(item);
        });

        var element = currentAction === "get" ? 'getPlayer' : 'deletePlayer';
        showDropdown(players, element);
    });
};

/*var getPlayer = function (playerId) {

};

var deletePlayer = function (playerId) {

};*/

/* --- Control page elements ---*/

var resetPlayers = function () {
    players = [];
}

var showGetPlayer = function() {
    currentAction = "get";
    resetPlayers();
    toggleShowPlayerList();
    $('#getPlayerMenu').show();
    $('#addPlayerMenu').hide();
    $('#updatePlayerMenu').hide();
    $('#deletePlayerMenu').hide();
};

var showAddPlayer = function() {
    currentAction = "add";
    resetPlayers();
    $('#getPlayerMenu').hide();
    $('#addPlayerMenu').show();
    $('#updatePlayerMenu').hide();
    $('#deletePlayerMenu').hide();
};

var showUpdatePlayer = function () {
    currentAction = "update";
    resetPlayers();
    $('#getPlayerMenu').hide();
    $('#addPlayerMenu').hide();
    $('#updatePlayerMenu').show();
    $('#deletePlayerMenu').hide();
};

var showDeletePlayer = function () {
    currentAction = "delete";
    resetPlayers();
    toggleShowPlayerList();
    $('#getPlayerMenu').hide();
    $('#addPlayerMenu').hide();
    $('#updatePlayerMenu').hide();
    $('#deletePlayerMenu').show();
};

// Gets the selected item from a dropdown list
var getActiveDropdownElement = function (elementName) {
    var result = $("select[name=" + elementName +"]").val();
    return result;
}

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

var showDropdown = function (list, elementId) {
    clearDropdown(elementId);
    populateDropdown(list, elementId);
}

var activeSport = 'none';

var toggleShowPlayerList = function () {
    var action = currentAction;
    var element = action + 'PlayerSelectSport';
    activeSport = getActiveDropdownElement(element);
    if (activeSport !== 'none') {
        $('#' + action + 'PlayerList').show();
        $('#' + action + 'PlayerButton').show();
    }
    else {
        $('#' + action + 'PlayerList').hide();
        $('#' + action + 'PlayerButton').hide();
    }
}

$(document).ready(function () {

    // Call getSportPlayers when the sport is changed in the dropdown menu
    $('.sport').change(function () {
        toggleShowPlayerList();

        if (activeSport !== 'none') {
            // also check if we're in add or delete
            getSportPlayers(activeSport);
        }
    });
});

console.log(players);