var read = require('read');

var Question = function(id, question, answer){
  this.id=id;
  this.question=question;
  this.answer=answer;
  this.options = {
      prompt: this.question+" (You have 10 segs)\n>",
      timeout: 10000
  }
  console.log("Creada la pregunta "+id)
}

var Quiz = function(questions){

}

Question.prototype.displayQuestion = function(err, answer){
  (answer!=q1.answer) ? console.log("MAL") : console.log("GUAY")
    //console.log("You answer: " + answer)
}

// q1 = new Question(1,"What's your name?\n>","Chema"),
// read(q1.options, q1.displayQuestion);


// var questions_array = [
//   new Question(1,"What's your name?\n>","Chema"),
//   new Question(2,"What's your age?\n>",37)
// ]
//
//  questions_array.forEach(function(ques){
//      //console.log(ques.options);
//      read(ques.options, ques.displayQuestion);
//  });




 //var read = require("../lib/read.js")

 read({prompt: "Username: ", default: "test-user" }, function (er, user) {
   read({prompt: "Password: ", default: "test-pass", silent: true }, function (er, pass) {
     read({prompt: "Password again: ", default: "test-pass", silent: true }, function (er, pass2) {
       console.error({user: user,
                      pass: pass,
                      verify: pass2,
                      passMatch: (pass === pass2)})
       console.error("the program should exit now")
     })
   })
 })



//console.log(q1.options);


// read(q2.options, q2.displayQuestion);



// function displayName (err, name){
//     console.log("Your name is: " + name)
// }// Outputs whatever the user has entered back to the console
//read(options, displayName) // The prompt itself, passing options, and using our callback function after input
