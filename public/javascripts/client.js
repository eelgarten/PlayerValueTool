/**
 * Created by Elias Elgarten on 12/3/2016.
 */
var sportPositionTypes = {

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

var playerTableFields = {
    "generalPlayer": [
        {"fieldName": "playerName", "displayName": "Player name"},
        {"fieldName": "playerPosition", "displayName": "Position"},
        {"fieldName": "playerSport", "displayName": "Sport"},
        {"fieldName": "playerTeam", "displayName": "Team"},
        {"fieldName": "playerSalary", "displayName": "Salary"}
    ]
};

var baseballHitterTableFields = {
    "baseballHitter": [
        {"fieldName": "atBats",  "displayName": "AB"},
        {"fieldName": "runsScored",  "displayName": "R"},
        {"fieldName": "hits",  "displayName": "H"},
        {"fieldName": "doubles",  "displayName": "2B"},
        {"fieldName": "triples",  "displayName": "3B"},
        {"fieldName": "homeruns",  "displayName": "HR"},
        {"fieldName": "runsBattedIn",  "displayName": "RBI"},
        {"fieldName": "stolenBases",  "displayName": "SB"},
        {"fieldName": "caughtStealing",  "displayName": "CS"},
        {"fieldName": "walksDrawn",  "displayName": "BB"},
        {"fieldName": "strikeouts",  "displayName": "SO"},
        {"fieldName": "battingAverage",  "displayName": "AVG"},
        {"fieldName": "onBasePercentage",  "displayName": "OBP"},
        {"fieldName": "sluggingPercentage",  "displayName": "SLG"},
        {"fieldName": "onBasePlusSlugging",  "displayName": "OPS"},
        {"fieldName": "winsAboveReplacement",  "displayName": "WAR"}
    ]
};

var baseballPitcherTableFields = {
    "baseballPitcher": [
        {"fieldName": "gamesPitched",  "displayName": "GP"},
        {"fieldName": "gamesStarted",  "displayName": "GS"},
        {"fieldName": "inningsPitched",  "displayName": "IP"},
        {"fieldName": "hitsAllowed",  "displayName": "H"},
        {"fieldName": "runsGivenUp",  "displayName": "R"},
        {"fieldName": "earnedRuns",  "displayName": "ER"},
        {"fieldName": "walksAllowed",  "displayName": "BB"},
        {"fieldName": "strikeouts",  "displayName": "SO"},
        {"fieldName": "wins",  "displayName": "W"},
        {"fieldName": "losses",  "displayName": "L"},
        {"fieldName": "saves",  "displayName": "SV"},
        {"fieldName": "blownSaves",  "displayName": "BS"},
        {"fieldName": "walksPlusHitsAllowedPerInningsPitched",  "displayName": "WHIP"},
        {"fieldName": "earnedRunAverage",  "displayName": "ERA"},
        {"fieldName": "winsAboveReplacement",  "displayName": "WAR"}
    ]
};

var basketballPlayerTableFields = {
    "basketballPlayer": [
        {"fieldName": "gamesPlayed",  "displayName": "G"},
        {"fieldName": "playerEfficiencyRating",  "displayName": "PER"},
        {"fieldName": "pointsPerGame",  "displayName": "PPG"},
        {"fieldName": "reboundsPerGame",  "displayName": "RPG"},
        {"fieldName": "assistsPerGame",  "displayName": "APG"},
        {"fieldName": "stealsPerGame",  "displayName": "SPG"},
        {"fieldName": "blocksPerGame",  "displayName": "BPG"},
        {"fieldName": "fieldGoalPercentage",  "displayName": "FG%"},
        {"fieldName": "trueShootingPercentage",  "displayName": "TS%"},
        {"fieldName": "usagePercentage",  "displayName": "USG%"},
        {"fieldName": "valueOverReplacementPlayer",  "displayName": "VORP"}
    ]
};

var footballSkillPositionPlayerFields = {
    "skillPositionPlayer": [
        {"fieldName": "approximateValue",  "displayName": "Approximate Value"},
        {"fieldName": "passingYards",  "displayName": "Passing Yards"},
        {"fieldName": "passingTD",  "displayName": "Passing TDs"},
        {"fieldName": "yardsPerCompletion",  "displayName": "Yards Per Completion"},
        {"fieldName": "yardsPerAttempt",  "displayName": "Yards Per Attempt"},
        {"fieldName": "completionPercentage",  "displayName": "Completion Percentage"},
        {"fieldName": "rushingAttempts",  "displayName": "Rushing Attempts"},
        {"fieldName": "rushingYards",  "displayName": "Rushing Yards"},
        {"fieldName": "rushingTD",  "displayName": "Rushing TDs"},
        {"fieldName": "targets",  "displayName": "Targets"},
        {"fieldName": "receptions",  "displayName": "Receptions"},
        {"fieldName": "receivingYards",  "displayName": "Receiving Yards"},
        {"fieldName": "receivingTD",  "displayName": "Receiving TDs"},
        {"fieldName": "fumbles",  "displayName": "Fumbles"},
        {"fieldName": "interceptions",  "displayName": "Interceptions Thrown"}
    ]
};

var footballOffensiveLinemanPlayerFields = {
    "offensiveLineman": [
        {"fieldName": "approximateValue",  "displayName": "Approximate Value"},
        {"fieldName": "sacksAllowed",  "displayName": "Sacks Allowed"},
        {"fieldName": "qbHits",  "displayName": "QB Hits Allowed"},
        {"fieldName": "qbHurries",  "displayName": "QB Hurries Allowed"},
        {"fieldName": "penaltiesCommitted",  "displayName": "Penalties Committed"},
        {"fieldName": "penaltiesAccepted",  "displayName": "Penalties Accepted"}
    ]
};

var footballDefensivePlayerFields = {
    "defensivePlayer": [
        {"fieldName": "approximateValue",  "displayName": "Approximate Value"},
        {"fieldName": "totalTackles",  "displayName": "Total Tackles"},
        {"fieldName": "assistedTackles",  "displayName": "Assisted Tackles"},
        {"fieldName": "sacks",  "displayName": "Sacks"},
        {"fieldName": "passesDefended",  "displayName": "Passes Defended"},
        {"fieldName": "interceptions",  "displayName": "Interceptions"},
        {"fieldName": "forcedFumbles",  "displayName": "Forced Fumbles"},
        {"fieldName": "fumblesRecovered",  "displayName": "Fumbles Recovered"},
    ]
};

var nbaPositionOptions = ["PG","SG","SF","PF","C"]
var mlbHitterPositionOptions = ["DH","C","1B","2B","3B","SS","OF"];
var mlbPitcherPositionOptions = ["SP","RP"];
var nflSkillPostionOptions = ["QB","RB","WR","TE"];
var nflOffensiveLineOptions = ["C","G","T"];
var nflDefensivePlayerOptions = ["DE","DT","DB","MLB","OLB","S"];

var currentAction = "";

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

/*
var deletePlayer = function (playerId) {

};*/

/* --- Control page elements ---*/


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
}

var activeSport = 'none';

var showResults = function () {
    $('#queryResultsDisplay').show();
}

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

var createGetPlayerResults = function (args) {
    var tableHead = "<tr>";
    for (var key in args) {
        if (args.hasOwnProperty(key)) {
            tableHead += "<th>" + key + "</th>";
        }
    }
    tableHead += "</tr>";

    var tableBody = "<tr>";
    for (var key in args) {
        if (args.hasOwnProperty(key)) {
            tableBody += "<td>" + args[key] + "</td>";
        }
    }
    tableBody += "</tr>";

    var resultTable = tableHead + tableBody;

    $('#displayResultsTable').html(resultTable);
};

var submitGetPlayer = function (playerDropdownElement) {
    var playerId = getActiveDropdownElement(playerDropdownElement);
    console.log(playerId);

    var getPlayerByIdCall = getPlayerById(playerId);
    $.when(getPlayerByIdCall).done(function (player) {
        console.log('in here');
        showResults();
        console.log(player[0][0]);
        createGetPlayerResults(player[0][0]);
    });
};

$(document).ready(function () {

    // Call getSportPlayers when the sport is changed in the dropdown menu
    $('.sport').change(function () {
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

});