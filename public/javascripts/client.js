/**
 * Created by Elias Elgarten on 12/3/2016.
 */

/* --- Config vars --- */

Chart.defaults.global.maintainAspectRatio = false;
Chart.defaults.global.responsive = false;

const sportPositionTypes = {

    "NBA": [],
    "MLB": {
        "hitter": "Hitter",
        "pitcher": "Pitcher"
    },
    "NFL": {
        "skillPositionPlayer": "Skill Position Player",
        "defensivePlayer": "Defensive Player",
        "offensiveLineman": "Offensive Lineman"
    }
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
        "defensiveTD": "Defensive TDs"
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
    $('#comparePlayersQueryResults').hide();
    $('#comparePlayersMenu').hide();
    $('#addPlayerResult').hide();
    $('#updatePlayerFields').hide();
    $('#updatePlayerResult').hide();
    $('#getPlayerMenu').show();
    $('#addPlayerMenu').hide();
    $('#updatePlayerMenu').hide();
    $('#deletePlayerMenu').hide();
    $('#getMostValuablePlayersMenu').hide();
    $('#getMostValuablePlayersChartsMenu').hide();
};

var showComparePlayers = function() {
    currentAction = "compare";
    $('#queryResultsDisplay').hide();
    $('#comparePlayersMenu').show();
    $('#addPlayerResult').hide();
    $('#updatePlayerFields').hide();
    $('#updatePlayerResult').hide();
    $('#getPlayerMenu').hide();
    $('#addPlayerMenu').hide();
    $('#updatePlayerMenu').hide();
    $('#deletePlayerMenu').hide();
    $('#getMostValuablePlayersMenu').hide();
    $('#getMostValuablePlayersChartsMenu').hide();
}

var showAddPlayer = function() {
    currentAction = "add";
    $('#queryResultsDisplay').hide();
    $('#comparePlayersQueryResults').hide();
    $('#comparePlayersMenu').hide();
    $('#addPlayerResult').hide();
    $('#updatePlayerFields').hide();
    $('#updatePlayerResult').hide();
    $('#getPlayerMenu').hide();
    $('#addPlayerMenu').show();
    $('#updatePlayerMenu').hide();
    $('#deletePlayerMenu').hide();
    $('#getMostValuablePlayersMenu').hide();
    $('#getMostValuablePlayersChartsMenu').hide();
};

var showUpdatePlayer = function () {
    currentAction = "update";
    $('#queryResultsDisplay').hide();
    $('#updatePlayerFields').hide();
    $('#comparePlayersQueryResults').hide();
    $('#comparePlayersMenu').hide();
    $('#addPlayerResult').hide();
    $('#updatePlayerResult').hide();
    $('#getPlayerMenu').hide();
    $('#addPlayerMenu').hide();
    $('#updatePlayerMenu').show();
    $('#deletePlayerMenu').hide();
    $('#getMostValuablePlayersMenu').hide();
    $('#getMostValuablePlayersChartsMenu').hide();
};

var showDeletePlayer = function () {
    currentAction = "delete";
    toggleShowPlayerList();
    $('#queryResultsDisplay').hide();
    $('#comparePlayersQueryResults').hide();
    $('#addPlayerResult').hide();
    $('#comparePlayersMenu').hide();
    $('#updatePlayerFields').hide();
    $('#updatePlayerResult').hide();
    $('#getPlayerMenu').hide();
    $('#addPlayerMenu').hide();
    $('#updatePlayerMenu').hide();
    $('#deletePlayerMenu').show();
    $('#getMostValuablePlayersMenu').hide();
    $('#getMostValuablePlayersChartsMenu').hide();
};

var showGetMostValuablePlayers = function() {
    currentAction = "get";
    toggleShowPlayerList();
    $('#queryResultsDisplay').hide();
    $('#addPlayerResult').hide();
    $('#comparePlayersMenu').hide();
    $('#updatePlayerFields').hide();
    $('#updatePlayerResult').hide();
    $('#getPlayerMenu').hide();
    $('#comparePlayersQueryResults').hide();
    $('#addPlayerMenu').hide();
    $('#updatePlayerMenu').hide();
    $('#deletePlayerMenu').hide();
    $('#getMostValuablePlayersMenu').show();
    $('#getMostValuablePlayersChartsMenu').hide();
};

var showMostValuablePlayersChart = function () {
    currentAction = "get";
    $('#queryResultsDisplay').hide();
    $('#addPlayerResult').hide();
    $('#comparePlayersQueryResults').hide();
    $('#comparePlayersMenu').hide();
    $('#updatePlayerFields').hide();
    $('#updatePlayerResult').hide();
    $('#getPlayerMenu').hide();
    $('#addPlayerMenu').hide();
    $('#updatePlayerMenu').hide();
    $('#deletePlayerMenu').hide();
    $('#getMostValuablePlayersMenu').hide();
    $('#getMostValuablePlayersChartsMenu').show();
}

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
    console.log(player);
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
                attribute = 'nflSkillPosition';
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

    showResults();
    $('#displayResultsTable').show();
};

var submitComparePlayers = function (firstPlayerDropdownElement, secondPlayerDropdownElement) {
    console.log("submit compare players");
    var firstPlayerId = getActiveDropdownElement(firstPlayerDropdownElement);
    var secondPlayerId = getActiveDropdownElement(secondPlayerDropdownElement);

    var comparePlayersCall = comparePlayersById(firstPlayerId, secondPlayerId);

    $.when(comparePlayersCall).done(function (players) {
        createComparePlayerResults(players[0], players[1]);
    });
}

var createComparePlayerResults = function(firstPlayer, secondPlayer) {
    var playerList = [firstPlayer[0], secondPlayer[0]];

    var resultHTML = "<div id='table-wrapper'>";

    for (var i = 0; i < 2; i++) {
        var resultTable = "<div id='table-scroll'><table class='gridtable'>";
        var attribute = determinePlayerAttribute(playerList[i]) + 'Player';
        var tableFields = $.extend(playerTableFields['generalPlayer'], playerTableFields[attribute]);

        var tableHead = "<tr>";
        for (var key in playerList[i]) {
            if (playerList[i].hasOwnProperty(key) && key !== 'playerId') {
                tableHead += "<th>" + tableFields[key] + "</th>";
            }
        }
        tableHead += "</tr>";
        resultTable += tableHead;


        var tableRow = "<tr>";
        for (var key in playerList[i]) {
            if (playerList[i].hasOwnProperty(key) && key !== 'playerId') {
                tableRow += "<td>" + playerList[i][key] + "</td>";
            }
        }
        tableRow += "</tr>";

        resultTable += tableRow;
        resultHTML += resultTable + "</table></div>";
    }
    resultHTML += "</div>";
    console.log(resultHTML);

    showResults();
    $('#comparePlayersQueryResults').show();
    $('.result').html(resultHTML);

}

var submitDeletePlayer = function (playerDropdownElement) {
    var playerId = getActiveDropdownElement(playerDropdownElement);

    var deletePlayerByIdCall = deletePlayerById(playerId);
    $.when(deletePlayerByIdCall).done(function () {
        showResults();
        $('#nonTableResults').html("Player deleted successfully");
        $('#nonTableResults').show();
        $('#displayResultsTable').hide();
    });
};

var showUpdateFields = function () {
    $('#updatePlayerFields').show();
}

var submitUpdatePlayer = function (playerDropdownElement) {
    var playerId = getActiveDropdownElement(playerDropdownElement);
    var newTeam = $('input[name=newTeamInput]').val();

    var updatePlayerCall = updatePlayerById(playerId, newTeam);
    $.when(updatePlayerCall).done(function () {
        $('#updatePlayerResult').html("Player updated");
        $('#updatePlayerResult').show();
    });

};

var submitGetMostValuablePlayers = function (elementId) {
    var sport = getActiveDropdownElement(elementId);

    var resultsCall = getMostValuablePlayers(sport);
    $.when(resultsCall).done(function (results) {
        var resultHTML = "<div id='table-wrapper'>";

        results.forEach(function (item, idx, array) {

            // Make a table for each of the result lists that is returned from the db
            if (idx !== array.length - 1) {

                var resultTable = "<div id='table-scroll'><table class='gridtable'>";

                var attribute = determinePlayerAttribute(item[0]) + 'Player';
                var tableFields = $.extend(playerTableFields['generalPlayer'], playerTableFields[attribute]);

                var tableHead = "<tr>";
                for (var i in item[0]) {
                    if (item[0].hasOwnProperty(i) && i !== 'playerId') {
                        tableHead += "<th class='" + i + "'>" + tableFields[i] + "</th>";
                    }
                }
                tableHead += "</tr>";
                resultTable += tableHead;


                for (var player in item) {
                    console.log(item);
                    console.log(item[player]);

                    var tableRow = "<tr>";
                    for (var key in item[player]) {
                        if (item[player].hasOwnProperty(key) && key !== 'playerId') {
                            tableRow += "<td>" + item[player][key] + "</td>";
                        }
                    }
                    tableRow += "</tr>";

                    resultTable += tableRow;
                    console.log(resultTable);
                }
                ;
                resultTable += "</table></div>";
                console.log(resultTable);

                resultHTML += resultTable;
            }
        });

        resultHTML += "</div>";
        $('#getMostValuablePlayersResults').html(resultHTML);
    });
};

/* For top-20 player charts */
var submitGetMostValuablePlayersChart = function (elementId) {
    var sport = getActiveDropdownElement(elementId);

    var resultsCall = getMostValuablePlayersChart(sport);
    $.when(resultsCall).done(function (results) {

        createPlayersChart(results[0], sport);
        // $("#chartDisplay").show();
    });

};

var createPlayersChart = function (players, sport) {
    var ctx = document.getElementById("mostValuablePlayersChart").getContext("2d");

    if (window.bar != undefined) {
        window.bar.destroy();
    }

    var valueStatisticLabel = "";
    var valueStatisticAbbreviation = "";
    var valueKey = '';
    var barColor = '';
    var borderColor = '';

    switch (sport) {
        case 'NBA':
            valueStatisticLabel = "Value Over Replacement Player";
            valueStatisticAbbreviation = "VORP";
            valueKey = 'valueOverReplacementPlayer';
            barColor = 'rgba(255, 99, 132, 0.2)'; // red
            borderColor = 'rgba(255,99,132,1)';
            break;
        case 'MLB':
            valueStatisticLabel = "Wins Above Replacement Player";
            valueStatisticAbbreviation = "WAR";
            valueKey = 'war';
            barColor = 'rgba(54, 162, 235, 0.2)';
            borderColor = 'rgba(54, 162, 235, 1)';
            break;
        case 'NFL':
            valueStatisticLabel = "Approximate Value";
            valueStatisticAbbreviation = "Value";
            valueKey = 'approxVal';
            barColor = 'rgba(75, 192, 192, 0.2)';
            borderColor = 'rgba(75, 192, 192, 1)';
            break;
    }

    var chartLabels = [];
    players.forEach(function (player) {
        chartLabels.push(player['playerName'] + ", " + player['pos']);
    });

    var chartValues = [];
    players.forEach(function (player) {
        chartValues.push(player[valueKey]);
    });

    window.bar = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: chartLabels,
            datasets: [{
                label: valueStatisticAbbreviation,
                data: chartValues,
                backgroundColor: barColor,
                borderColor: borderColor,
                borderWidth: 1
            }]
        },
        options: {
            responsive:true,
            maintainAspectRatio:false,
            title : {
                display: true,
                text: valueStatisticLabel,
                fontSize: 20
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true,
                    }
                }]
            }
        }
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

var comparePlayersById = function (firstPlayerId, secondPlayerId) {

    var response = $.getJSON('/getComparePlayers/' + firstPlayerId + '/' + secondPlayerId).done(function (data) {
        // console.log(data[0]);
    })

    return response;
}

var deletePlayerById = function (playerId) {

    var result = $.getJSON('/deletePlayer/' + playerId).done(function (response) {
        console.log(response);
    });

    return result;
};


var updatePlayerById = function (playerId, newTeam) {

    /* $.post('/updatePlayer', {playerId: playerId, team: newTeam}, function (data) {

     }).done(console.log('posted'));*/
    var jsonData = {playerId: playerId, team: newTeam};

    $.ajax({
        type: "POST",
        data: JSON.stringify(jsonData),
        url: "/updatePlayer",
        contentType: "application/json"
    });
};

var addNewPlayer = function () {
    var formData = $('#addPlayerForm').serialize();

    $.post("/addPlayer", formData).done(function (resp) {
        $('#addPlayerResult').html("Player added");
        $('#addPlayerResult').show();
    });
};

var getMostValuablePlayers = function (sport) {
    var response = $.getJSON('/getMostValuablePlayers/' + sport).done(function (data) {

        var returnArray = [];
        data.forEach(function (item) {
            returnArray.push(item);
        });
        return returnArray;
    });
    return response;
};

var getMostValuablePlayersChart = function (sport) {
    var response = $.getJSON('/getMostValuablePlayersChart/' + sport).done(function (data) {
        var players = data[0];
        return players;
    });
    return response;
};

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


    // UI functionality for Ccompare Players feature
    $('.compareSport').change(function () {
        // make sure that the current action is set properly to Compare
        currentAction = "compare";

        $('#nonTableResults').hide();
        var compareSport = $('#comparePlayersSport').val();

        if (compareSport !== 'none') {
            $('#choosePlayers').show();
        }
        else {
            console.log('fnaf');
            $('#choosePlayers').hide();
        }

        if (compareSport !== 'none') {
            var playerCall = getSportPlayers(compareSport);
            $.when(playerCall).done(function (players) {
                var element1 = currentAction + 'FirstPlayer';
                showDropdown(players[0], element1);

                var element2 = currentAction + 'SecondPlayer';
                showDropdown(players[0], element2);
            });
        }
    });

    $('#resetFormButton').click(function () {
        $('#addPlayerResult').hide();
    });

});