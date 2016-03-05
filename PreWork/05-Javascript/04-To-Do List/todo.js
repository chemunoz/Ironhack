
window.onload = function() {

// the following code adds event listeners to the buttons
// you'll learn more about this later
// for this exercise, you are going to write the functions for
// what happens when the user clicks on the buttons.
  var saveButton = document.getElementById('save-button');
  saveButton.addEventListener('click', addToDoItem, false);

  var doneButton = document.getElementById('done-button');
  doneButton.addEventListener('click', markAsDone, false);


  function addToDoItem() {
    // add your code here
    // this should create a new list item in the to-do list
    // and set the text as the input from the todo-input field
    var input_todo=document.getElementById('todo-input').value;
    var new_li_todo = document.createElement('li');

    document.getElementsByClassName('todo-list-items')[0].appendChild(new_li_todo);
    new_li_todo.innerHTML = input_todo;
  }


  function markAsDone() {
    doneButton.classList.add('liked');
    doneButton.innerHTML = "Liked!";
    
    list=document.querySelector('ul.todo-list-items > li');
    document.getElementsByClassName('done-list-items')[0].appendChild(list);
    
    list2=document.querySelectorAll('ul.done-list-items > li');
    for (x in list2)
    {
      list2[x].classList.add('done');
    }

    //remove from To-Do List
    document.getElementsByClassName('todo-list-items')[0].removeChild(list);
  }
  
}
