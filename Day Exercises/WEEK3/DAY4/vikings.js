var Saxon = function(){
	this.name = 'Saxon';
	this.health = parseInt(Math.random() * 10);
	this.strength = parseInt(Math.random() * 10);
	//console.log("health %s : strength %s",this.health,this.strength);
}

var Viking = function(name,health,strength,cry){
	this.name = name;
	this.health = health;
	this.strength = strength;
	this.cry = cry;

	items = {
		axe: "damage * 2",
		spear: "damage * 2",
		bow: "damage * 2",
		shield: "health * 2"
	}

	//console.log("health %s : strength %s",this.health,this.strength);
}

var BattleField = function(name,vikings){
	this.name = name;
	this.vikings = vikings;
	this.saxons = [];
	this.turns = parseInt(get_random(5,8));
	//console.log("turns %s", this.turns);
}

function get_random(min,max){
	return Math.floor(Math.random() * (max - min + 1)) + min;
}

// Pit.prototype.attack = function(){
// 	//choose p1 or p2
// 	if (Math.random() < 0.5){
// 		attacker = this.players[0];
// 		defender = this.players[1];
// 	} else {
// 		attacker = this.players[1];
// 		defender = this.players[0];
// 	}

// 	damage = parseInt(attacker.strength * 0.2);
// 	defender.health -= damage;
// 	console.log(attacker.name+" has attacked "+defender.name+".");
// 	if (defender.health > 5){
// 		console.log(defender.name+" has suffered "+damage+" damage. His health is now "+defender.health+".");
// 		return true;
// 	}
// 	else{
// 		console.log(defender.name + " has surrendered!!.");
// 		return false;
// 	}
// }

BattleField.prototype.attack = function(){
	saxons = this.saxons;
	//var saxonLength = this.saxons.length-1;

	this.vikings.forEach(function(viking,i){
		if ((viking.health > 0) && (saxons.length > 0)) {
			//console.log("i:"+i)
			saxonIndex = parseInt(get_random(0,saxons.length-1));
			saxon = saxons[saxonIndex];
			saxonDamage = parseInt(viking.strength);

			vikingDamage = parseInt(saxon.strength);

			saxon.health -= saxonDamage;
			viking.health -= vikingDamage;

			console.log(viking.name+" has attacked "+saxon.name+".");

			if (saxon.health <= 0){
				console.log("No, please don't kill me! I have a wife and 5 poor children...")
				console.log(saxon.name+" has died horribly from his vicious wounds.");
				saxons.splice(saxonIndex,1);
			}

			if (viking.health <= 0){
				//console.log("viking health:"+viking.health)
				console.log(viking.name+" has died valiantly and awaits his companions from the halls of Valhalla.");
				//this.vikings.splice(i,1);
			}

		}

	});

	this.saxons = saxons;

	if (this.saxons.length <= 0 ){
	 	console.log("There are no more Saxons alive in the village. The vikings are VICTORIOUS!! Hail Odin!");
	 	return false;
	} else {
	 	return true;
	}
}

BattleField.prototype.add_saxon = function(saxon){

	this.saxons.push(saxon);
	saxon.name = saxon.name + this.saxons.length;
}

BattleField.prototype.print_status = function(){
	//console.log(this.players[0].name + " and "+this.players[1].name+" have entered the BattleField at "+this.name+". \nThe crowd roars with anticipation.");
	console.log("The Sun rises. The town of "+this.name+" lies quiet, unexpecting the imminent Viking attack.");


};

// BattleField.prototype.fight = function(){
// 	var i = 0;
// 	while(i < this.turns && this.attack()){
// 		i++;
// 	}

// 	var winner = function(){

// 	}

// 	this.players[0].health > this.players[1].health ? this.players[0] : this.players[1];
// 	console.log("The fight is OVER. The winner is " + winner.name);
// }

BattleField.prototype.battle = function(){
	var total_vikings = this.vikings.length;
	var total_saxons = this.saxons.length;

	var i = 0;
	while(i < this.turns && this.attack()){
		i++;
	}

	// console.log("vikings:%s",this.vikings);
	// console.log("saxons:%s",this.saxons);

	var vikingsAlive = this.vikings.reduce(function(count,viking){
		//console.log("viking %s health %s",viking.name,viking.health);
		if (viking.health > 0) {
			return count + 1;
		} else {
			return count;
		}

	},0);

	var saxonsAlive = this.saxons.reduce(function(count,saxon){
		if (saxon.health > 0) {
			return count + 1;
		} else {
			return count;
		}
		//return (saxon.health >= 0) ? count++ : count;
	},0);

	//console.log("vikings alive? "+vikingsAlive);
	//console.log("saxons alive? "+saxonsAlive);

	//console.log("total_vikings? "+total_vikings);
	percDeadVikings =  100-((vikingsAlive / total_vikings)*100);
	percDeadSaxons = 100-((saxonsAlive / total_saxons)*100);
	// console.log("vikings dead %? "+percDeadVikings);
	// console.log("saxons dead %? "+percDeadSaxons);

	if (percDeadVikings < percDeadSaxons){
		winner = "THE VIKINGS!!!";
	} else {
		winner = "THE SAXONS!!!";
	}


	console.log("The battle is OVER.");
	console.log("The battle field is littered with the bodies of the %s slaughtered Saxons.",(total_saxons-saxonsAlive));
	console.log("The vikings gather around the %s of their fallen comrades. No tears are shed. The fallen are fortunate.",(total_vikings-vikingsAlive));
	console.log("The winner is " + winner);
}

var vikings = [
	new Viking('Vidar',50,50,"WRRAOOAOA"),
	new Viking('Rolf',50,50,"BUURRGGG"),
	new Viking('Inge',50,50,"GRROOAAA"),
	new Viking('Ivar',50,50,"WULLAWULLA"),
	new Viking('Olav',50,50,"MARGARADA"),
	new Viking('Leif',50,50,"CUUUULLUUUU")
	]


var saxon = new Saxon();

var elgin = new BattleField("Elgin",vikings);

for (var i=0;i<100;i++){
	elgin.add_saxon(new Saxon());
}
elgin.print_status();
elgin.battle();
