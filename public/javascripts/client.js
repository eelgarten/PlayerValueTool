/**
 * Created by Elias Elgarten on 12/3/2016.
 */

/* --- Config vars --- */

const sportPositionTypes = {

    "NBA": [],
    "MLB": [
        {"positionType": "hitter","displayName": "Hitter"},
        {"positionType": "pitcher","displayName": "Pitcher"}
    ],
    "NFL": [
        {"positionType": "skill position player","displayName": "Skill Position Player"},
        {"positionType": "defensive player","displayName": "Defensive Player"},
        {"positionType": "offensiveLineman","displayName": "Offensive Lineman"}
    ]
};

const playerTableFields = {
    "generalPlayer": {
        "playerName": "Player Name",
        "pos": "Position",
        "sport": "Sport",
        "team": "Team",
        "salary": "Salary"
    },
    "mlbHitterPlayer": {
        "atBats": "AB",
        "runsScored": "R",
        "hits": "H",
        "doubles": "2B",
        "triples": "3B",
        "homeruns": "HR",
        "runsBattedIn": "RBI",
        "stolenBases": "SB",
        "caughtStealing": "CS",
        "walksDrawn": "BB",
        "strikeouts": "SO",
        "battingAverage": "AVG",
        "onBasePercentage": "OBP",
        "sluggingPercentage": "SLG",
        "onBasePlusSlugging": "OPS",
        "winsAboveReplacement": "WAR"
    },
    "mlbPitcherPlayer": {
        "gamesPitched": "GP",
        "gamesStarted": "GS",
        "inningsPitched": "IP",
        "hitsAllowed": "H",
        "runsGivenUp": "R",
        "earnedRuns": "ER",
        "walksAllowed": "BB",
        "strikeouts": "SO",
        "wins": "W",
        "losses": "L",
        "saves": "SV",
        "blownSaves": "BS",
        "walksPlusHitsAllowedPerInningsPitched": "WHIP",
        "earnedRunAverage": "ERA",
        "winsAboveReplacement": "WAR"
    },
    "nbaPlayer": {
        "gamesPlayed": "G",
        "playerEfficiencyRating": "PER",
        "pointsPerGame": "PPG",
        "reboundsPerGame": "RPG",
        "assistsPerGame": "APG",
        "stealsPerGame": "SPG",
        "blocksPerGame": "BPG",
        "fieldGoalPercentage": "FG%",
        "trueShootingPercentage": "TS%",
        "usagePercentage": "USG%",
        "valueOverReplacementPlayer": "VORP"
    },
    "nflSkillPositionPlayer": {
        "approximateValue": "Approximate Value",
        "passingYards": "Passing Yards",
        "passingTD": "Passing TDs",
        "yardsPerCompletion": "Yards Per Completion",
        "yardsPerAttempt": "Yards Per Attempt",
        "completionPercentage": "Completion Percentage",
        "rushingAttempts": "Rushing Attempts",
        "rushingYards": "Rushing Yards",
        "rushingTD": "Rushing TDs",
        "targets": "Targets",
        "receptions": "Receptions",
        "receivingYards": "Receiving Yards",
        "receivingTD": "Receiving TDs",
        "fumbles": "Fumbles",
        "interceptions": "Interceptions Thrown"
    },
    "nflOffensiveLinePlayer": {
        "approximateValue": "Approximate Value",
        "sacksAllowed": "Sacks Allowed",
        "qbHits": "QB Hits Allowed",
        "qbHurries": "QB Hurries Allowed",
        "penaltiesCommitted": "Penalties Committed",
        "penaltiesAccepted": "Penalties Accepted"
    },
    "nflDefensivePlayer": {
        "approximateValue": "Approximate Value",
        "totalTackles": "Total Tackles",
        "assistedTackles": "Assisted Tackles",
        "sacks": "Sacks",
        "fieldName": "passesDefended",  "passesDefended": "Passes Defended",
        "interceptions": "Interceptions",
        "forcedFumbles": "Forced Fumbles",
        "fumblesRecovered": "Fumbles Recovered",
    }
};

const nbaPositionOptions = ["PG","SG","SF","PF","C"];
const mlbHitterPositionOptions = ["DH","C","1B","2B","3B","SS","OF"];
const mlbPitcherPositionOptions = ["SP","RP"];
const nflSkillPlayerPostionOptions = ["QB","RB","WR","TE"];
const nflOffensiveLinePlayerPositionOptions = ["C","G","T"];
const nflDefensivePlayerPositionOptions = ["DE","DT","DB","MLB","OLB","S"];

/* --- Control page elements ---*/

var currentAction = "";

var showGetPlayer = function() {
    currentAction = "get";
    toggleShowPlayerList();
    $('#queryResultsDisplay').hide();
    $('#getPlayerMenu').show();
    $('#addPlayerMenu').hide();
    $('#updatePlayerMenu').hide();
    $('#deletePlayerMenu').hide();
};

var showAddPlayer = function() {
    currentAction = "add";
    $('#queryResultsDisplay').hide();
    $('#getPlayerMenu').hide();
    $('#addPlayerMenu').show();
    $('#updatePlayerMenu').hide();
    $('#deletePlayerMenu').hide();
};

var showUpdatePlayer = function () {
    currentAction = "update";
    $('#queryResultsDisplay').hide();
    $('#getPlayerMenu').hide();
    $('#addPlayerMenu').hide();
    $('#updatePlayerMenu').show();
    $('#deletePlayerMenu').hide();
};

var showDeletePlayer = function () {
    currentAction = "delete";
    toggleShowPlayerList();
    $('#queryResultsDisplay').hide();
    $('#getPlayerMenu').hide();
    $('#addPlayerMenu').hide();
    $('#updatePlayerMenu').hide();
    $('#deletePlayerMenu').show();
};

var activeSport = 'none';

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

var populatePlayerDropdown = function (list, elementId) {
    for (var i = 0; i < list.length; i++) {
        var select = document.getElementById(elementId),
            opt = document.createElement("option");
        opt.value = list[i].playerId;
        opt.textContent = list[i].playerName + ', ' + list[i].pos;
        select.append(opt);
    }
};

var showDropdown = function (list, elementId) {
    clearDropdown(elementId);
    populatePlayerDropdown(list, elementId);
};

var showResults = function () {
    $('#queryResultsDisplay').show();
};

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
};

var determinePlayerAttribute = function (player) {
    var sport = player.sport;
    var position = player.pos;
    var attribute = "";
    switch (sport) {
        case "NBA" :
            attribute = 'nba';
            break;
        case "MLB" :
            if (mlbHitterPositionOptions.includes(position)) {
                attribute = 'mlbHitter';
                break;
            } else if (mlbPitcherPositionOptions.includes(position)) {
                attribute = 'mlbPitcher';
                break;
            } else {
                console.log('error in mlb hitter');
                break;
            }
        case "NFL" :
            if (nflSkillPlayerPostionOptions.includes(position)) {
                attribute = 'nflSkill';
                break;
            } else if (nflDefensivePlayerPositionOptions.includes(position)) {
                attribute = 'nflDefensive';
                break;
            } else if (nflOffensiveLinePlayerPositionOptions.includes(position)) {
                attribute = 'nflOffensiveLine';
                break;
            }
    }
    console.log(attribute);
    return attribute;
}

var createGetPlayerResults = function (player) {
    var attribute = determinePlayerAttribute(player) + 'Player';
    var tableFields = $.extend(playerTableFields['generalPlayer'] ,playerTableFields[attribute]);

    var tableHead = "<tr>";
    for (var key in player) {
        if (player.hasOwnProperty(key) && key !== 'playerId') {
            tableHead += "<th>" + tableFields[key] + "</th>";
        }
    }
    tableHead += "</tr>";

    var tableBody = "<tr>";
    for (var key in player) {
        if (player.hasOwnProperty(key) && key !== 'playerId') {
            tableBody += "<td>" + player[key] + "</td>";
        }
    }
    tableBody += "</tr>";

    var resultTable = tableHead + tableBody;

    $('#displayResultsTable').html(resultTable);
};

var submitGetPlayer = function (playerDropdownElement) {
    var playerId = getActiveDropdownElement(playerDropdownElement);

    // make an asynchronous call and wait for it to finish before continuing
    var getPlayerByIdCall = getPlayerById(playerId);
    $.when(getPlayerByIdCall).done(function (player) {
        showResults();
        createGetPlayerResults(player[0][0]);
    });
};

var submitDeletePlayer = function (playerDropdownElement) {
    var playerId = getActiveDropdownElement(playerDropdownElement);

    var deletePlayerByIdCall = deletePlayerById(playerId);
    $.when(deletePlayerByIdCall).done(function () {
        showResults();
        $('#nonTableResults').html("Player deleted successfully");
        $('#nonTableResults').show();
    });
}

/* --- Functions to get and submit data to API */

/* Gets the players for a given sport, to be used in dropdown display */
var getSportPlayers = function (sport) {

    var response = $.getJSON('/getSportPlayers/' + sport).done(function (data) {
        var returnedPlayers = [];
        data[0].forEach(function (item) {
            returnedPlayers.push(item);
        });
        return returnedPlayers;
    });
    return response;
};

var getPlayerById = function (playerId) {

    var response = $.getJSON('/getPlayer/' + playerId).done(function (data) {
        var player = data[0];
        console.log(player);
        return player;
    });
    return response;
};

var deletePlayerById = function (playerId) {

    var result = $.getJSON('/deletePlayer/' + playerId).done(function (response) {
        console.log(response);
    });

    return result;

}


$(document).ready(function () {

    // Call getSportPlayers when the sport is changed in the dropdown menu
    $('.sport').change(function () {
        $('#nonTableResults').hide();
        toggleShowPlayerList();

        if (activeSport !== 'none') {
            // also check if we're in add or delete
            var playerCall = getSportPlayers(activeSport);
            $.when(playerCall).done(function (players) {
                var element = currentAction + 'Player';
                showDropdown(players[0], element);
            });

        }
    });

    // add a function to hide the "Deleted player" success message

});