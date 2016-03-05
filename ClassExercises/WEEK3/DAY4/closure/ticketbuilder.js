function ticketBuilder(transport) {
  return function(name) {
    console.log("Welcome, " + name + ". Here is your ticket for the " + transport + "!");
  }
}

var getPlaneTicket = ticketBuilder("plane");
var getTrainTicket = ticketBuilder("train");


getPlaneTicket('Antonio');
getTrainTicket('Pedro');
getPlaneTicket('Luis');
