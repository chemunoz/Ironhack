function checkInPassenger(name, customersArray) {
     var passengerChecked;
     for (var i = 0; i<customersArray.length; i++) {
          if (customersArray[i] === name) {
               passengerChecked = function() {
                    console.log ("Hi, " + name + ". You’re passenger #" + (i+1));
               };
} }
     return passengerChecked;
}
var flightToBali = ["Wayan", "Putu", "Gede", "Ni Luh", "Nyoman"];
var counterCheckIn = checkInPassenger("Gede", flightToBali);
counterCheckIn();
