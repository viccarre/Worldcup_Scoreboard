
function todayMatches(dataNull){

local url = "http://worldcup.sfg.io/matches/today/?by_date=ASC";
local headers = { "Content-Type" : "text/xml" };
local request = http.get(url, headers);
local response = request.sendsync();

server.log(response.statuscode + " - " + response.body);


local data = http.jsondecode(response.body);
local size = data.len();
server.log(size);
device.send("MatchData", data);

}

function currentMatch(dataNull){

local url = "http://worldcup.sfg.io/matches/current";
local headers = { "Content-Type" : "text/xml" };
local request = http.get(url, headers);
local response = request.sendsync();

server.log(response.statuscode + " - " + response.body);


local data = http.jsondecode(response.body);
local size = data.len();
server.log(size);
device.send("currentMatchData", data);

}

device.on("getTodayMatches", todayMatches);

device.on("getCurrentMatch", currentMatch);


