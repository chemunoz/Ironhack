function ticketBuilder(transport) {
  var passengerNumber=0;
  return function(name) {
    passengerNumber+=1;
    console.log("Welcome, " + name + ". Here is your ticket for the " + transport + "!");
    console.log(" you are passenger #"+passengerNumber);
  }
}

var getPlaneTicket = ticketBuilder("plane");
var getTrainTicket = ticketBuilder("train");


getPlaneTicket('Antonio');
getTrainTicket('Pedro');
getPlaneTicket('Luis');
