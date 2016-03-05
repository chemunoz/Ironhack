	
var user = {}
var responses = []


function question1() {
  var name = prompt('What is your name?')
  user.name = name
}

function question2() {
	var firstQuestion = prompt('Does null === 0 ? (Yes or No)')

	if (firstQuestion.toLowerCase() === 'yes') {
		firstQuestion = true
	} else if (firstQuestion.toLowerCase() === 'no') {
		firstQuestion = false
	  } else {
	    	alert("Please answer either Yes or No");
	    	return question2();
	  }
	  responses.push(firstQuestion); // add the true or false value to the responses array
}

function question3() {
	var secondQuestion;
  	var js = prompt('What was the original name for JavaScript: Java, LiveScript, JavaLive, or ScriptyScript?');
  	js = js.toLowerCase();
  	switch (js) {
    	case "java":
    		secondQuestion=false;
    		break;
    	case "livescript":
    		secondQuestion=true;
    		break;
    	case "javalive":
    		secondQuestion=false;
    		break;
    	case "scriptyscript":
    		secondQuestion=false;
    		break;
    	default:
    		//Dont answer nothing
    		secondQuestion=false;
    		break;
  	}
 	responses.push(secondQuestion);
}

function question4() {
	var thirdQuestion;
  	var js = prompt('What do the walkers from tv show The Walking Dead are?: Infected, Zombies, Retiree People');

  	js = js.toLowerCase();
  	switch (js) {
    	case "infected":
    		thirdQuestion=false;
    		break;
    	case "zombies":
    		thirdQuestion=true;
    		break;
    	case "retiree people":
    		thirdQuestion=false;
    		break;
    	default:
    		//Dont answer nothing
    		thirdQuestion=false;
    		break;
  	}
 	responses.push(thirdQuestion); 	
}


function evaluate(responsesArray) {
	var x, total_true=0, total_false=0;
	for (x in responsesArray){
		if (responsesArray[x]===true){
			total_true+=1;
		}
		else{
			total_false+=1;
		}
	}

	user.falsos=total_false;
	user.verdaderos=total_true;

	showResults();
}

function showResults() {
	// display the user results
	alert("TOTAL de respuestas de "+user.name+"\n Verdaderas: "+user.verdaderos+"\nFalsas: "+user.falsos)
}







question1();
question2();
question3();
question4();
// call the function, passing it the responses array
evaluate(responses);
